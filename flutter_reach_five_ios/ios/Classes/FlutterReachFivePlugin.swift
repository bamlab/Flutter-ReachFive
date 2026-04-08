import Flutter
import UIKit
import Reach5
import AuthenticationServices

public class FlutterReachFivePlugin: NSObject, FlutterPlugin, ReachFiveHostApi {
    
    public static func register(with registrar: any FlutterPluginRegistrar) {
        let messenger: FlutterBinaryMessenger = registrar.messenger()
        let api: ReachFiveHostApi & NSObjectProtocol = FlutterReachFivePlugin.init()
        ReachFiveHostApiSetup.setUp(binaryMessenger: messenger, api: api)
    }

    var reachFiveInstances = [String: ReachFive]()

    let nonInitializedFlutterError = PigeonError(
        code: "non_initialized_error_code",
        message: "ReachFive instance has not been initialized",
        details: nil
    )

    private func getReachFiveInstanceKey(reachFiveKey: ReachFiveKeyInterface) -> String {
        var key = reachFiveKey.sdkConfig.domain + reachFiveKey.sdkConfig.clientId + reachFiveKey.sdkConfig.iosScheme
        reachFiveKey.providerCreators.forEach { providerCreator in
            key += Converters.providerCreatorFromInterface(providerCreatorInterface: providerCreator)?.name ?? ""
        }
        return key
    }

    func initialize(reachFiveKey: ReachFiveKeyInterface, completion: @escaping (Result<ReachFiveConfigInterface, Error>) -> Void) {
        let providersCreators = reachFiveKey.providerCreators.compactMap {
            Converters.providerCreatorFromInterface(providerCreatorInterface: $0)
        }

        let reachFive = ReachFive(
            sdkConfig: SdkConfig(
                domain: reachFiveKey.sdkConfig.domain,
                clientId: reachFiveKey.sdkConfig.clientId,
                scheme: reachFiveKey.sdkConfig.iosScheme
            ),
            providersCreators: providersCreators
        )

        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: reachFiveKey)

        Task {
            do {
                let providers = try await reachFive.initialize()
                self.reachFiveInstances[reachFiveInstanceKey] = reachFive
                completion(.success(ReachFiveConfigInterface(
                    reachFiveKey: reachFiveKey,
                    providers: providers.map { $0.name }
                )))
            } catch let error as ReachFiveError {
                completion(.failure(PigeonError(
                    code: "initialization_error_code",
                    message: error.message(),
                    details: nil
                )))
            } catch {
                completion(.failure(PigeonError(
                    code: "initialization_error_code",
                    message: error.localizedDescription,
                    details: nil
                )))
            }
        }
    }

    func signup(request: SignupRequestInterface, completion: @escaping (Result<AuthTokenInterface, Error>) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey] else {
            completion(.failure(nonInitializedFlutterError))
            return
        }

        let signupRequest = Converters.signupRequestFromInterface(profileSignupRequestInterface: request.profile)

        Task {
            do {
                let flow = try await reachFive.signup(
                    profile: signupRequest,
                    redirectUrl: request.redirectUrl,
                    scope: request.scope
                )
                switch flow {
                case .AchievedLogin(let authToken):
                    completion(.success(Converters.authTokenToInterface(authToken: authToken)))
                case .AwaitingIdentifierVerification:
                    completion(.failure(PigeonError(
                        code: "awaiting_identifier_verification",
                        message: "Awaiting identifier verification",
                        details: nil
                    )))
                }
            } catch let error as ReachFiveError {
                completion(.failure(Converters.parseError(
                    reachFiveError: error,
                    errorCodesInterface: request.errorCodes,
                    defaultFlutterError: PigeonError(
                        code: "sign_up_error_code",
                        message: error.message(),
                        details: nil
                    )
                )))
            } catch {
                completion(.failure(PigeonError(
                    code: "sign_up_error_code",
                    message: error.localizedDescription,
                    details: nil
                )))
            }
        }
    }

    func loginWithPassword(request: LoginWithPasswordRequestInterface, completion: @escaping (Result<AuthTokenInterface, Error>) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey] else {
            completion(.failure(nonInitializedFlutterError))
            return
        }

        Task {
            do {
                let flow = try await reachFive.loginWithPassword(
                    email: request.email,
                    phoneNumber: request.phoneNumber,
                    password: request.password,
                    scope: request.scope
                )
                switch flow {
                case .AchievedLogin(let authToken):
                    completion(.success(Converters.authTokenToInterface(authToken: authToken)))
                case .OngoingStepUp:
                    completion(.failure(PigeonError(
                        code: "mfa_required",
                        message: "MFA step up required",
                        details: nil
                    )))
                }
            } catch let error as ReachFiveError {
                completion(.failure(Converters.parseError(
                    reachFiveError: error,
                    errorCodesInterface: request.errorCodes,
                    defaultFlutterError: PigeonError(
                        code: "login_with_password_error_code",
                        message: error.message(),
                        details: nil
                    )
                )))
            } catch {
                completion(.failure(PigeonError(
                    code: "login_with_password_error_code",
                    message: error.localizedDescription,
                    details: nil
                )))
            }
        }
    }

    func loginWithProvider(request: LoginWithProviderRequestInterface, completion: @escaping (Result<AuthTokenInterface, Error>) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey] else {
            completion(.failure(nonInitializedFlutterError))
            return
        }

        let viewController = ((UIApplication.shared.delegate?.window!)!).rootViewController

        guard let provider = reachFive.getProvider(name: request.provider) else {
            completion(.failure(PigeonError(
                code: "not_available_provider_error_code",
                message: "The provider was not found in your reachFive instance",
                details: nil
            )))
            return
        }

        Task {
            do {
                let authToken = try await provider.login(
                    scope: request.scope,
                    origin: request.origin,
                    viewController: viewController
                )
                completion(.success(Converters.authTokenToInterface(authToken: authToken)))
            } catch let error as ReachFiveError {
                completion(.failure(Converters.parseError(
                    reachFiveError: error,
                    errorCodesInterface: request.errorCodes,
                    defaultFlutterError: PigeonError(
                        code: "login_with_provider_error_code",
                        message: error.message(),
                        details: nil
                    )
                )))
            } catch {
                completion(.failure(PigeonError(
                    code: "login_with_provider_error_code",
                    message: error.localizedDescription,
                    details: nil
                )))
            }
        }
    }

    func logout(reachFiveKey: ReachFiveKeyInterface, completion: @escaping (Result<Void, Error>) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey] else {
            completion(.failure(nonInitializedFlutterError))
            return
        }

        Task {
            do {
                try await reachFive.logout()
                completion(.success(()))
            } catch {
                completion(.failure(PigeonError(
                    code: "logout_error_code",
                    message: error.localizedDescription,
                    details: nil
                )))
            }
        }
    }

    func getProfile(request: GetProfileRequestInterface, completion: @escaping (Result<ProfileInterface, Error>) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey] else {
            completion(.failure(nonInitializedFlutterError))
            return
        }

        let authToken = Converters.authTokenFromInterface(authTokenInterface: request.authToken)

        Task {
            do {
                let profile = try await reachFive.getProfile(authToken: authToken)
                completion(.success(Converters.profileToInterface(profile: profile)))
            } catch let error as ReachFiveError {
                completion(.failure(Converters.parseError(
                    reachFiveError: error,
                    errorCodesInterface: request.errorCodes,
                    defaultFlutterError: PigeonError(
                        code: "get_profile_error_code",
                        message: error.message(),
                        details: nil
                    )
                )))
            } catch {
                completion(.failure(PigeonError(
                    code: "get_profile_error_code",
                    message: error.localizedDescription,
                    details: nil
                )))
            }
        }
    }

    func updateProfile(request: UpdateProfileRequestInterface, completion: @escaping (Result<ProfileInterface, Error>) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey] else {
            completion(.failure(nonInitializedFlutterError))
            return
        }

        let authToken = Converters.authTokenFromInterface(authTokenInterface: request.authToken)
        let profile = Converters.profileFromInterface(profileInterface: request.profile)

        Task {
            do {
                let updatedProfile = try await reachFive.updateProfile(authToken: authToken, profile: profile)
                completion(.success(Converters.profileToInterface(profile: updatedProfile)))
            } catch let error as ReachFiveError {
                completion(.failure(Converters.parseError(
                    reachFiveError: error,
                    errorCodesInterface: request.errorCodes,
                    defaultFlutterError: PigeonError(
                        code: "update_profile_error_code",
                        message: error.message(),
                        details: nil
                    )
                )))
            } catch {
                completion(.failure(PigeonError(
                    code: "update_profile_error_code",
                    message: error.localizedDescription,
                    details: nil
                )))
            }
        }
    }

    func refreshAccessToken(request: RefreshAccessTokenRequestInterface, completion: @escaping (Result<AuthTokenInterface, Error>) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey] else {
            completion(.failure(nonInitializedFlutterError))
            return
        }

        let authToken = Converters.authTokenFromInterface(authTokenInterface: request.authToken)

        Task {
            do {
                let refreshedToken = try await reachFive.refreshAccessToken(authToken: authToken)
                completion(.success(Converters.authTokenToInterface(authToken: refreshedToken)))
            } catch let error as ReachFiveError {
                completion(.failure(Converters.parseError(
                    reachFiveError: error,
                    errorCodesInterface: request.errorCodes,
                    defaultFlutterError: PigeonError(
                        code: "refresh_access_token_error_code",
                        message: error.message(),
                        details: nil
                    )
                )))
            } catch {
                completion(.failure(PigeonError(
                    code: "refresh_access_token_error_code",
                    message: error.localizedDescription,
                    details: nil
                )))
            }
        }
    }

    func requestPasswordReset(request: RequestPasswordResetRequestInterface, completion: @escaping (Result<Void, Error>) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey] else {
            completion(.failure(nonInitializedFlutterError))
            return
        }

        Task {
            do {
                try await reachFive.requestPasswordReset(
                    email: request.email,
                    phoneNumber: request.phoneNumber,
                    redirectUrl: request.redirectUrl
                )
                completion(.success(()))
            } catch {
                completion(.failure(PigeonError(
                    code: "request_password_reset_error_code",
                    message: error.localizedDescription,
                    details: nil
                )))
            }
        }
    }

    func updatePasswordWithAccessToken(request: UpdatePasswordWithAccessTokenRequestInterface, completion: @escaping (Result<Void, Error>) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey] else {
            completion(.failure(nonInitializedFlutterError))
            return
        }

        Task {
            do {
                try await reachFive.updatePassword(
                    .AccessTokenParams(
                        authToken: Converters.authTokenFromInterface(authTokenInterface: request.authToken),
                        password: request.password,
                        oldPassword: request.oldPassword
                    )
                )
                completion(.success(()))
            } catch {
                completion(.failure(PigeonError(
                    code: "update_password_with_access_token_error_code",
                    message: error.localizedDescription,
                    details: nil
                )))
            }
        }
    }

    func updatePasswordWithFreshAccessToken(request: UpdatePasswordWithFreshAccessTokenRequestInterface, completion: @escaping (Result<Void, Error>) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey] else {
            completion(.failure(nonInitializedFlutterError))
            return
        }

        Task {
            do {
                try await reachFive.updatePassword(
                    .FreshAccessTokenParams(
                        authToken: Converters.authTokenFromInterface(authTokenInterface: request.freshAuthToken),
                        password: request.password
                    )
                )
                completion(.success(()))
            } catch {
                completion(.failure(PigeonError(
                    code: "update_password_with_fresh_access_token_error_code",
                    message: error.localizedDescription,
                    details: nil
                )))
            }
        }
    }

    func updatePasswordWithEmail(request: UpdatePasswordWithEmailRequestInterface, completion: @escaping (Result<Void, Error>) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey] else {
            completion(.failure(nonInitializedFlutterError))
            return
        }

        Task {
            do {
                try await reachFive.updatePassword(
                    .EmailParams(
                        email: request.email,
                        verificationCode: request.verificationCode,
                        password: request.password
                    )
                )
                completion(.success(()))
            } catch let error as ReachFiveError {
                completion(.failure(Converters.parseError(
                    reachFiveError: error,
                    errorCodesInterface: request.errorCodes,
                    defaultFlutterError: PigeonError(
                        code: "update_password_with_email_request_error_code",
                        message: error.message(),
                        details: nil
                    )
                )))
            } catch {
                completion(.failure(PigeonError(
                    code: "update_password_with_email_request_error_code",
                    message: error.localizedDescription,
                    details: nil
                )))
            }
        }
    }

    func updatePasswordWithPhoneNumber(request: UpdatePasswordWithPhoneNumberRequestInterface, completion: @escaping (Result<Void, Error>) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey] else {
            completion(.failure(nonInitializedFlutterError))
            return
        }

        Task {
            do {
                try await reachFive.updatePassword(
                    .SmsParams(
                        phoneNumber: request.phoneNumber,
                        verificationCode: request.verificationCode,
                        password: request.password
                    )
                )
                completion(.success(()))
            } catch let error as ReachFiveError {
                completion(.failure(Converters.parseError(
                    reachFiveError: error,
                    errorCodesInterface: request.errorCodes,
                    defaultFlutterError: PigeonError(
                        code: "update_password_with_phone_number_request_error_code",
                        message: error.message(),
                        details: nil
                    )
                )))
            } catch {
                completion(.failure(PigeonError(
                    code: "update_password_with_phone_number_request_error_code",
                    message: error.localizedDescription,
                    details: nil
                )))
            }
        }
    }

}

extension UIViewController: ASWebAuthenticationPresentationContextProviding {
    public func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        view.window!
    }
}
