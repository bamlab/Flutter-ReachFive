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
        
        ReachFiveHostApiSetup.setUp(binaryMessenger: messenger, api: api);
    }
    
    private func getReachFiveInstanceKey(reachFiveKey: ReachFiveKeyInterface) -> String {
        var key: String =  reachFiveKey.sdkConfig.domain + reachFiveKey.sdkConfig.clientId + reachFiveKey.sdkConfig.iosScheme
        reachFiveKey.providerCreators.forEach({
            providerCreator in
            key += (providerCreator != nil ? Converters.providerCreatorFromInterface(
                providerCreatorInterface: providerCreator!
            )?.name : nil) ?? ""
        })
        return key
    }
    
    func initialize(reachFiveKey: ReachFiveKeyInterface, completion: @escaping (Result<ReachFiveConfigInterface, Error>) -> Void) {
        let providersCreators = reachFiveKey.providerCreators.map({
            providerCreatorInterface in
            providerCreatorInterface != nil ?
                    Converters.providerCreatorFromInterface(
                        providerCreatorInterface: providerCreatorInterface!
                    ) : nil
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
                    Result.success(
                        ReachFiveConfigInterface(
                            reachFiveKey: reachFiveKey,
                            providers: providers.map({
                                provider in
                                provider.name
                            })
                        )
                    )
                )
            }
            .onFailure { error in
                completion(
                    Result.failure(FlutterError(
                        code: "initialization_error_code",
                        message: error.message(),
                        details: nil
                    ))
                )
            }
    }
    
    func signup(request: SignupRequestInterface, completion: @escaping (Result<AuthTokenInterface, Error>) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey]
        else {
            completion(Result.failure(nonInitializedFlutterError))
            return
        }
        
        let signupRequest = Converters.signupRequestFromInterface(
            profileSignupRequestInterface: request.profile
        )
        
        let signupCall = reachFive.signup(
            profile: signupRequest,
            redirectUrl: request.redirectUrl,
            scope: request.scope?.filter({scopeValue in
                scopeValue != nil}) as? [String]
        )
        
        signupCall.onSuccess(
            callback: { authToken in
                completion(
                    Result.success(
                        Converters.authTokenToInterface(authToken: authToken)
                    )
                )
            }
        )
        
        signupCall.onFailure(
            callback: { error in
                completion(
                    Result.failure(
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
                )
            }
        )

    }
    
    func loginWithPassword(request: LoginWithPasswordRequestInterface, completion: @escaping (Result<AuthTokenInterface, Error>) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey]
        else {
            completion(Result.failure(nonInitializedFlutterError))
            return
        }
        
        let loginWithPasswordCall = reachFive.loginWithPassword(
            email: request.email,
            phoneNumber: request.phoneNumber,
            password: request.password,
            scope: request.scope?.filter({scopeValue in
                scopeValue != nil}) as? [String]
        )
            
        loginWithPasswordCall.onSuccess(
            callback: { authToken in
                completion(
                    Result.success(
                        Converters.authTokenToInterface(authToken: authToken)
                    )
                )

            }
        )
            
        loginWithPasswordCall.onFailure(
            callback: { error in
                completion(
                    Result.failure(
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
                )
            }
        )
    }
    
    func loginWithProvider(request: LoginWithProviderRequestInterface, completion: @escaping (Result<AuthTokenInterface, Error>) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey]
        else {
            completion(Result.failure(nonInitializedFlutterError))
            return
        }

        let viewController = ((UIApplication.shared.delegate?.window!)!).rootViewController

        guard let provider = reachFive.getProvider(name: request.provider)
        else {
            completion(Result.failure(
                FlutterError(
                    code: "not_available_provider_error_code",
                    message: "The provider was not found in your reachFive instance",
                    details: nil
                )
            ))
            return
        }

        let loginWithProviderCall = provider.login(
            scope: request.scope?.filter({scopeValue in
                scopeValue != nil}) as? [String],
            origin: request.origin,
            viewController: viewController
        )
            
        loginWithProviderCall.onSuccess(
            callback: { authToken in
                completion(
                    Result.success(
                        Converters.authTokenToInterface(authToken: authToken)
                    )
                )
            }
        )
        
        loginWithProviderCall.onFailure(
            callback: { error in
                completion(
                    Result.failure(
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
                )
            }
        )
    }
    
    func logout(reachFiveKey: ReachFiveKeyInterface, completion: @escaping (Result<Void, Error>) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey]
        else {
            completion(Result.failure(nonInitializedFlutterError))
            return
        }
        
        reachFive.logout().onSuccess(
            callback: { unit in
                completion(Result.success(unit))
            }
        ).onFailure(
            callback: { error in
                completion(
                    Result.failure(
                        FlutterError(
                            code: "logout_error_code",
                            message: error.message(),
                            details: nil
                        )
                    )
                )
            }
        )
    }
    
    func getProfile(request: GetProfileRequestInterface, completion: @escaping (Result<ProfileInterface, Error>) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey]
        else {
            completion(Result.failure(nonInitializedFlutterError))
            return
        }

        let authToken = Converters.authTokenFromInterface(
                authTokenInterface: request.authToken
        )

        reachFive.getProfile(authToken: authToken)
                .onSuccess(
                        callback: { profile in
                            completion(
                                Result.success(
                                    Converters.profileToInterface(profile: profile)
                                )
                            )
                        }
                ).onFailure(
                        callback: { error in
                            completion(
                                Result.failure(
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
                            )
                        }
                )
    }
    
    func updateProfile(request: UpdateProfileRequestInterface, completion: @escaping (Result<ProfileInterface, Error>) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey]
        else {
            completion(Result.failure(nonInitializedFlutterError))
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
                                Result.success(
                                    Converters.profileToInterface(profile: profile)
                                )
                            )
                        }
                ).onFailure(
                        callback: { error in
                            completion(
                                Result.failure(
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
                            )
                        }
                )
    }
    
    func refreshAccessToken(request: RefreshAccessTokenRequestInterface, completion: @escaping (Result<AuthTokenInterface, Error>) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey]
        else {
            completion(Result.failure(nonInitializedFlutterError))
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
                    Result.success(
                        Converters.authTokenToInterface(authToken: authToken)
                    )
                )
            }
        ).onFailure(
            callback: { error in
                completion(
                    Result.failure(
                        FlutterError(
                            code: "refresh_access_token_error_code",
                            message: error.message(),
                            details: nil
                        )
                    )
                )
            }
        )
    }
    
    func requestPasswordReset(request: RequestPasswordResetRequestInterface, completion: @escaping (Result<Void, Error>) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey]
        else {
            completion(Result.failure(nonInitializedFlutterError))
            return
        }
        
        reachFive.requestPasswordReset(
            email: request.email,
            phoneNumber: request.phoneNumber,
            redirectUrl: request.redirectUrl
        ).onSuccess(
            callback: { unit in
                completion(Result.success(unit))
            }
        ).onFailure(
            callback: {error in
                completion(
                    Result.failure(
                        FlutterError(
                            code: "request_password_reset_error_code",
                            message: error.message(),
                            details: nil
                        )
                    )
                )
            }
        )
    }
    
    func updatePasswordWithAccessToken(request: UpdatePasswordWithAccessTokenRequestInterface, completion: @escaping (Result<Void, Error>) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey]
        else {
            completion(Result.failure(nonInitializedFlutterError))
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
            callback: { unit in
                completion(Result.success(unit))
            }
        ).onFailure(
            callback: {error in
                completion(
                    Result.failure(
                        FlutterError(
                            code: "update_password_with_access_token_error_code",
                            message: error.message(),
                            details: nil
                        )
                    )
                )
            }
        )
    }
    
    func updatePasswordWithFreshAccessToken(request: UpdatePasswordWithFreshAccessTokenRequestInterface, completion: @escaping (Result<Void, Error>) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey]
        else {
            completion(Result.failure(nonInitializedFlutterError))
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
            callback: { unit in
                completion(Result.success(unit))
            }
        ).onFailure(
            callback: {error in
                completion(
                    Result.failure(
                        FlutterError(
                            code: "update_password_with_fresh_access_token_error_code",
                            message: error.message(),
                            details: nil
                        )
                    )
                )
            }
        )
    }
    
    func updatePasswordWithEmail(request: UpdatePasswordWithEmailRequestInterface, completion: @escaping (Result<Void, Error>) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey]
        else {
            completion(Result.failure(nonInitializedFlutterError))
            return
        }
        
        reachFive.updatePassword(
            .EmailParams(
                email: request.email,
                verificationCode: request.verificationCode,
                password: request.password
            )
        ).onSuccess(
            callback: { unit in
                completion(Result.success(unit))
            }
        ).onFailure(
            callback: {error in
                completion(
                    Result.failure(
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
                )
            }
        )
    }
    
    func updatePasswordWithPhoneNumber(request: UpdatePasswordWithPhoneNumberRequestInterface, completion: @escaping (Result<Void, Error>) -> Void) {
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: request.reachFiveKey)
        guard let reachFive = reachFiveInstances[reachFiveInstanceKey]
        else {
            completion(Result.failure(nonInitializedFlutterError))
            return
        }

        reachFive.updatePassword(
            .SmsParams(
                phoneNumber: request.phoneNumber,
                verificationCode: request.verificationCode,
                password: request.password
            )
        ).onSuccess(
            callback: { unit in
                completion(Result.success(unit))
            }
        ).onFailure(
            callback: {error in
                completion(
                    Result.failure(
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
