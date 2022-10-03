import Flutter
import UIKit
import IdentitySdkCore

public class SwiftFlutterReachFivePlugin: NSObject, FlutterPlugin, ReachFiveHostApi {

    var reachFiveInstances =  [String: ReachFive]()
    
    let nonInitializedFlutterError = FlutterError(
        code: "null",
        message: "ReachFive instance has not been initialized",
        details: nil
    )

    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger : FlutterBinaryMessenger = registrar.messenger()
        let api : ReachFiveHostApi & NSObjectProtocol = SwiftFlutterReachFivePlugin.init()
        
        ReachFiveHostApiSetup(messenger, api);
        
    }
    
    private func getReachFiveInstanceKey(reachFiveKey: ReachFiveKeyInterface) -> String {
        let key: String =  reachFiveKey.sdkConfig.domain + reachFiveKey.sdkConfig.clientId + reachFiveKey.sdkConfig.scheme
        return key
    }

    public func initializeReachFiveKey(_ reachFiveKey: ReachFiveKeyInterface, completion: @escaping (ReachFiveConfigInterface?, FlutterError?) -> Void) {

        let reachFive = ReachFive(
            sdkConfig: SdkConfig(
                domain: reachFiveKey.sdkConfig.domain,
                clientId: reachFiveKey.sdkConfig.clientId,
                scheme: reachFiveKey.sdkConfig.scheme
            ),
            providersCreators: [],
            storage: nil
        )
        
        let reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey: reachFiveKey)
        
        reachFive
            .initialize()
            .onSuccess { providers in
                self.reachFiveInstances[reachFiveInstanceKey] = reachFive
                completion(
                    ReachFiveConfigInterface.make(
                        withReachFiveKey: reachFiveKey
                    ),
                    nil
                )
            }
            .onFailure { error in
                completion(
                    nil,
                    FlutterError(
                        code: "null",
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
                    FlutterError(
                        code: "null",
                        message: error.message(),
                        details: nil
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
                    FlutterError(
                        code: "null",
                        message: error.message(),
                        details: nil
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
                        code: "null",
                        message: error.message(),
                        details: nil
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
                        code: "null",
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
                        code: "null",
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
                        code: "null",
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
                        code: "null",
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
                    FlutterError(
                        code: "null",
                        message: error.message(),
                        details: nil
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
                    FlutterError(
                        code: "null",
                        message: error.message(),
                        details: nil
                    )
                )
            }
        )
    }
    
}
