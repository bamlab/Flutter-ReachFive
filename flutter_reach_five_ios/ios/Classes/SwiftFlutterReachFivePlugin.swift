import Flutter
import UIKit
import IdentitySdkCore
import AuthenticationServices

public class SwiftFlutterReachFivePlugin: NSObject, FlutterPlugin, ReachFiveHostApi {

    var reachFiveInstances =  [String: ReachFive]()
    
    let nonInitializedFlutterError = FlutterError(
        code: "non_initialized_error_code",
        message: "ReachFive instance has not been initialized",
        details: nil
    )

    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger : FlutterBinaryMessenger = registrar.messenger()
        let api : ReachFiveHostApi & NSObjectProtocol = SwiftFlutterReachFivePlugin.init()
        
        SetUpReachFiveHostApi(messenger, api);
        
    }
    
    private func getReachFiveInstanceKey(reachFiveKey: ReachFiveKeyInterface) -> String {
        var key: String =  reachFiveKey.sdkConfig.domain + reachFiveKey.sdkConfig.clientId + reachFiveKey.sdkConfig.iosScheme
        reachFiveKey.providerCreators.forEach({
            providerCreator in
            key += Converters.providerCreatorFromInterface(
                providerCreatorInterface: providerCreator
            )?.name ?? ""
        })
        return key
    }

    public func initializeReachFiveKey(_ reachFiveKey: ReachFiveKeyInterface, completion: @escaping (ReachFiveConfigInterface?, FlutterError?) -> Void) {
        let providersCreators = reachFiveKey.providerCreators.map({
            providerCreatorInterface in
                    Converters.providerCreatorFromInterface(
                            providerCreatorInterface: providerCreatorInterface
                    )
        }).filter({
            providerCreator in
                    providerCreator != nil
        }) as! Array<ProviderCreator>

        let reachFive = ReachFive(
            sdkConfig: SdkConfig(
                domain: reachFiveKey.sdkConfig.domain,
                clientId: reachFiveKey.sdkConfig.clientId,
                scheme: reachFiveKey.sdkConfig.iosScheme
            ),
            providersCreators: providersCreators,
            storage: nil
        )
        
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: reachFiveKey)
        
        reachFive
            .initialize()
            .onSuccess { providers in
                self.reachFiveInstances[reachFiveInstanceKey] = reachFive
                completion(
                    ReachFiveConfigInterface.make(
                        withReachFiveKey: reachFiveKey,
                        providers: providers.map({
                            provider in
                            provider.name
                        })
                    ),
                    nil
                )
            }
            .onFailure { error in
                completion(
                    nil,
                    FlutterError(
                        code: "initialization_error_code",
                        message: error.message(),
                        details: nil
                    )
                )
            }
    }
    
    public func signupRequest(_ request: SignupRequestInterface, completion: @escaping (AuthTokenInterface?, FlutterError?) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey]
        else {
            completion(
                nil,
                nonInitializedFlutterError
            )
            return
        }
        
        let signupRequest = Converters.signupRequestFromInterface(
            profileSignupRequestInterface: request.profile
        )
        
        reachFive.signup(
            profile: signupRequest,
            redirectUrl: request.redirectUrl,
            scope: request.scope
        ).onSuccess(
            callback: { authToken in
                completion(
                    Converters.authTokenToInterface(authToken: authToken),
                    nil
                )
            }
        ).onFailure(
            callback: { error in
                completion(
                        nil,
                        Converters.parseError(
                                reachFiveError: error,
                                errorCodesInterface: request.errorCodes,
                                defaultFlutterError: FlutterError(
                                        code: "sign_up_error_code",
                                        message: error.message(),
                                        details: nil
                                )
                        )
                )
            }
        )
    }
    
    public func login(withPasswordRequest request: LoginWithPasswordRequestInterface, completion: @escaping (AuthTokenInterface?, FlutterError?) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey]
        else {
            completion(
                nil,
                nonInitializedFlutterError
            )
            return
        }
        
        reachFive.loginWithPassword(
            email: request.email,
            phoneNumber: request.phoneNumber,
            password: request.password,
            scope: request.scope
        ).onSuccess(
            callback: { authToken in
                completion(
                    Converters.authTokenToInterface(authToken: authToken),
                    nil
                )
            }
        ).onFailure(
            callback: { error in
                completion(
                        nil,
                        Converters.parseError(
                                reachFiveError: error,
                                errorCodesInterface: request.errorCodes,
                                defaultFlutterError: FlutterError(
                                        code: "login_with_password_error_code",
                                        message: error.message(),
                                        details: nil
                                )
                        )
                )
            }
        )
    }
    
    public func login(withProviderRequest request: LoginWithProviderRequestInterface, completion: @escaping (AuthTokenInterface?, FlutterError?) -> Void) {
            let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
            guard let reachFive = reachFiveInstances[reachFiveInstanceKey]
            else {
                completion(
                    nil,
                    nonInitializedFlutterError
                )
                return
            }

            let viewController = ((UIApplication.shared.delegate?.window!)!).rootViewController

            guard let provider = reachFive.getProvider(name: request.provider)
            else {
                completion(
                    nil,
                    FlutterError(
                        code: "not_available_provider_error_code",
                        message: "The provider was not found in your reachFive instance",
                        details: nil
                    )
                )
                return
            }

            provider.login(
                scope: request.scope,
                origin: request.origin,
                viewController: viewController
            ).onSuccess(
                callback: { authToken in
                    completion(
                        Converters.authTokenToInterface(authToken: authToken),
                        nil
                    )
                }
            ).onFailure(
                callback: { error in
                    completion(
                            nil,
                            Converters.parseError(
                                    reachFiveError: error,
                                    errorCodesInterface: request.errorCodes,
                                    defaultFlutterError: FlutterError(
                                            code: "login_with_provider_error_code",
                                            message: error.message(),
                                            details: nil
                                    )
                            )
                    )
                }
            )
        }
    
    public func logoutReachFiveKey(_ reachFiveKey: ReachFiveKeyInterface, completion: @escaping (FlutterError?) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey]
        else {
            completion(
                nonInitializedFlutterError
            )
            return
        }
        
        reachFive.logout().onSuccess(
            callback: { _ in
                completion(nil)
            }
        ).onFailure(
            callback: { error in
                completion(
                    FlutterError(
                        code: "logout_error_code",
                        message: error.message(),
                        details: nil
                    )
                )
            }
        )
    }
    
    public func getProfileRequest(_ request: GetProfileRequestInterface, completion: @escaping (ProfileInterface?, FlutterError?) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey]
        else {
            completion(
                    nil,
                    nonInitializedFlutterError
            )
            return
        }

        let authToken = Converters.authTokenFromInterface(
                authTokenInterface: request.authToken
        )

        reachFive.getProfile(authToken: authToken)
                .onSuccess(
                        callback: { profile in
                            completion(
                                    Converters.profileToInterface(profile: profile),
                                    nil
                            )
                        }
                ).onFailure(
                        callback: { error in
                            completion(
                                    nil,
                                    Converters.parseError(
                                            reachFiveError: error,
                                            errorCodesInterface: request.errorCodes,
                                            defaultFlutterError: FlutterError(
                                                    code: "get_profile_error_code",
                                                    message: error.message(),
                                                    details: nil
                                            )
                                    )
                            )
                        }
                )
    }

    public func updateProfileRequest(_ request: UpdateProfileRequestInterface, completion: @escaping (ProfileInterface?, FlutterError?) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey]
        else {
            completion(
                    nil,
                    nonInitializedFlutterError
            )
            return
        }

        let authToken = Converters.authTokenFromInterface(
                authTokenInterface: request.authToken
        )

        let profile = Converters.profileFromInterface(profileInterface: request.profile)

        reachFive.updateProfile(
                        authToken: authToken,
                        profile: profile)
                .onSuccess(
                        callback: { profile in
                            completion(
                                    Converters.profileToInterface(profile: profile),
                                    nil
                            )
                        }
                ).onFailure(
                        callback: { error in
                            completion(
                                    nil,
                                    Converters.parseError(
                                            reachFiveError: error,
                                            errorCodesInterface: request.errorCodes,
                                            defaultFlutterError: FlutterError(
                                                    code: "update_profile_error_code",
                                                    message: error.message(),
                                                    details: nil
                                            )
                                    )
                            )
                        }
                )
    }
    
    public func refreshAccessTokenRequest(_ request: RefreshAccessTokenRequestInterface, completion: @escaping (AuthTokenInterface?, FlutterError?) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey]
        else {
            completion(
                nil,
                nonInitializedFlutterError
            )
            return
        }
        
        let authToken = Converters.authTokenFromInterface(
            authTokenInterface: request.authToken
        )
        
        reachFive.refreshAccessToken(
            authToken: authToken
        ).onSuccess(
            callback: { authToken in
                completion(
                    Converters.authTokenToInterface(authToken: authToken),
                    nil
                )
            }
        ).onFailure(
            callback: { error in
                completion(
                    nil,
                    FlutterError(
                        code: "refresh_access_token_error_code",
                        message: error.message(),
                        details: nil
                    )
                )
            }
        )
    }
    
    public func requestPasswordResetRequest(_ request: RequestPasswordResetRequestInterface, completion: @escaping (FlutterError?) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey]
        else {
            completion(
                nonInitializedFlutterError
            )
            return
        }
        
        reachFive.requestPasswordReset(
            email: request.email,
            phoneNumber: request.phoneNumber,
            redirectUrl: request.redirectUrl
        ).onSuccess(
            callback: {_ in
                completion(nil)
            }
        ).onFailure(
            callback: {error in
                completion(
                    FlutterError(
                        code: "request_password_reset_error_code",
                        message: error.message(),
                        details: nil
                    )
                )
            }
        )
    }
    
    public func updatePassword(withAccessTokenRequest request: UpdatePasswordWithAccessTokenRequestInterface, completion: @escaping (FlutterError?) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey]
        else {
            completion(
                nonInitializedFlutterError
            )
            return
        }
        
        reachFive.updatePassword(
            .AccessTokenParams(
                authToken: Converters.authTokenFromInterface(
                    authTokenInterface: request.authToken
                ),
                password: request.password,
                oldPassword: request.oldPassword
            )
        ).onSuccess(
            callback: {_ in
                completion(nil)
            }
        ).onFailure(
            callback: {error in
                completion(
                    FlutterError(
                        code: "update_password_with_access_token_error_code",
                        message: error.message(),
                        details: nil
                    )
                )
            }
        )
    }
    
    public func updatePassword(withFreshAccessTokenRequest request: UpdatePasswordWithFreshAccessTokenRequestInterface, completion: @escaping (FlutterError?) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey]
        else {
            completion(
                nonInitializedFlutterError
            )
            return
        }
        
        reachFive.updatePassword(
            .FreshAccessTokenParams(
                authToken: Converters.authTokenFromInterface(
                    authTokenInterface: request.freshAuthToken
                ),
                password: request.password
            )
        ).onSuccess(
            callback: {_ in
                completion(nil)
            }
        ).onFailure(
            callback: {error in
                completion(
                    FlutterError(
                        code: "update_password_with_fresh_access_token_error_code",
                        message: error.message(),
                        details: nil
                    )
                )
            }
        )
    }
    
    public func updatePassword(withEmailRequest request: UpdatePasswordWithEmailRequestInterface, completion: @escaping (FlutterError?) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey]
        else {
            completion(
                nonInitializedFlutterError
            )
            return
        }
        
        reachFive.updatePassword(
            .EmailParams(
                email: request.email,
                verificationCode: request.verificationCode,
                password: request.password
            )
        ).onSuccess(
            callback: {_ in
                completion(nil)
            }
        ).onFailure(
            callback: {error in
                completion(
                        Converters.parseError(
                                reachFiveError: error,
                                errorCodesInterface: request.errorCodes,
                                defaultFlutterError: FlutterError(
                                        code: "update_password_with_email_request_error_code",
                                        message: error.message(),
                                        details: nil
                                )
                        )
                )
            }
        )
    }
    
    public func updatePassword(withPhoneNumberRequest request: UpdatePasswordWithPhoneNumberRequestInterface, completion: @escaping (FlutterError?) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey]
        else {
            completion(
                nonInitializedFlutterError
            )
            return
        }

        reachFive.updatePassword(
            .SmsParams(
                phoneNumber: request.phoneNumber,
                verificationCode: request.verificationCode,
                password: request.password
            )
        ).onSuccess(
            callback: {_ in
                completion(nil)
            }
        ).onFailure(
            callback: {error in
                completion(
                    Converters.parseError(
                            reachFiveError: error,
                            errorCodesInterface: request.errorCodes,
                            defaultFlutterError: FlutterError(
                                    code: "update_password_with_phone_number_request_error_code",
                                    message: error.message(),
                                    details: nil
                            )
                    )
                )
            }
        )
    }
    
}

extension UIViewController: ASWebAuthenticationPresentationContextProviding {
    public func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        view.window!
    }
}
