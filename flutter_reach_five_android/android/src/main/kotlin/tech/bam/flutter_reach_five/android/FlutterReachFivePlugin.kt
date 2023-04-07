package tech.bam.flutter_reach_five.android

import android.app.Activity
import android.content.Context
import android.content.Intent
import co.reachfive.identity.sdk.core.ReachFive
import co.reachfive.identity.sdk.core.models.*
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import co.reachfive.identity.sdk.core.models.requests.UpdatePasswordRequest.*
import co.reachfive.identity.sdk.core.utils.Success
import co.reachfive.identity.sdk.core.utils.Failure
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.PluginRegistry

class FlutterReachFivePlugin : FlutterPlugin, PluginRegistry.ActivityResultListener, ActivityAware, ReachFiveHostApi
{
    private var context: Context? = null
    private var activity: Activity? = null
    private var activityBinding: ActivityPluginBinding? = null

    private var reachFiveInstances = mutableMapOf<String, ReachFive>()
    private var loginWithProviderReachFiveInstance: ReachFive? = null
    private var onLoginWithProviderSuccess: Success<AuthToken>? = null
    private var onLoginWithProviderFailure: Failure<FlutterError>? = null
    private var errorCodes: ErrorCodesInterface? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        ReachFiveHostApi.setUp(flutterPluginBinding.binaryMessenger, this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        ReachFiveHostApi.setUp(binding.binaryMessenger, null)
        context = null
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        activityBinding = binding
        activityBinding?.addActivityResultListener(this)
    }

    override fun onDetachedFromActivity() {
        activity = null
        activityBinding?.removeActivityResultListener(this)
        activityBinding = null
    }

    override fun onDetachedFromActivityForConfigChanges() {
        this.onDetachedFromActivity()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        this.onAttachedToActivity(binding)
    }

    private fun resetLoginWithProviderVars() {
        loginWithProviderReachFiveInstance = null
        onLoginWithProviderSuccess = null
        onLoginWithProviderFailure = null
        errorCodes = null
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        val loginWithProviderReachFiveInstance = this.loginWithProviderReachFiveInstance
        val activity = this.activity
        val onLoginWithProviderSuccess = this.onLoginWithProviderSuccess
        val onLoginWithProviderFailure = this.onLoginWithProviderFailure
        val errorCodes = this.errorCodes

        if (loginWithProviderReachFiveInstance == null || onLoginWithProviderSuccess == null || onLoginWithProviderFailure ==null || errorCodes == null) {
            return true
        }

        if (activity == null) {
            onLoginWithProviderFailure(
                FlutterError(
                    code = "no_android_activity",
                    message ="No android activity attached to your application",
                    details = null
                )
            )
            resetLoginWithProviderVars()
            return true
        }

        loginWithProviderReachFiveInstance.onLoginActivityResult(
            requestCode = requestCode,
            resultCode = resultCode,
            intent = data,
            success = { authToken ->
                onLoginWithProviderSuccess(authToken)
                resetLoginWithProviderVars()
            },
            failure = { error -> onLoginWithProviderFailure(
                Converters.parseError(
                    reachFiveError = error,
                    errorCodesInterface = errorCodes,
                    defaultFlutterError = FlutterError(
                        code= "sign_up_error_code",
                        message= error.message,
                        details= null
                    )
                )
            )
                resetLoginWithProviderVars()
            },
            activity = activity
        )

        return true
    }

    private fun getReachFiveInstanceKey(reachFiveKey: ReachFiveKeyInterface): String {
        var key = reachFiveKey.sdkConfig.domain + reachFiveKey.sdkConfig.clientId + reachFiveKey.sdkConfig.androidScheme
        reachFiveKey.providerCreators.forEach { providerCreatorInterface ->
            key += providerCreatorInterface?.type?.name
        }
        return key
    }

    private fun getReachFiveInstance(reachFiveKey: ReachFiveKeyInterface): ReachFive {
        val reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey = reachFiveKey)

        return reachFiveInstances[reachFiveInstanceKey]
            ?: throw FlutterError(
                code= "non_initialized_error_code",
                message= "ReachFive instance has not been initialized",
                details= null
            )
    }

    private fun loadSocialProviders(reachFive: ReachFive, reachFiveKey: ReachFiveKeyInterface, callback: (Result<ReachFiveConfigInterface>) -> Unit) {
        val context = this.context
        if(context == null) {
            callback(Result.failure(Error("No android context attached to your application")))
            return
        }

        val reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey = reachFiveKey)

        reachFive.loadSocialProviders(
            context,
            success = { providers ->
                this.reachFiveInstances[reachFiveInstanceKey] = reachFive
                callback(Result.success(
                        ReachFiveConfigInterface(
                                reachFiveKey = reachFiveKey,
                                providers = providers.map {
                                    provider -> provider.name
                                },
                        )
                ))
            },
            failure = { error -> callback(
                    Result.failure(
                            FlutterError(
                                    code= "loading_social_providers_error_code",
                                    message= error.message,
                                    details= null
                            )
                    )
            )}
        )
    }

    override fun initialize(reachFiveKey: ReachFiveKeyInterface, callback: (Result<ReachFiveConfigInterface>) -> Unit) {
        val reachFive = ReachFive(
                sdkConfig = SdkConfig(
                        domain = reachFiveKey.sdkConfig.domain,
                        clientId = reachFiveKey.sdkConfig.clientId,
                        scheme = reachFiveKey.sdkConfig.androidScheme
                ),
                providersCreators = reachFiveKey.providerCreators.mapNotNull { providerCreatorInterface ->
                    if (providerCreatorInterface != null) Converters.providerCreatorFromInterface(providerCreatorInterface) else null
                }
        )



        reachFive.initialize(
                success = {
                    loadSocialProviders(
                            reachFive = reachFive,
                            reachFiveKey = reachFiveKey,
                            callback = callback
                    )
                },
                failure = { error -> callback(
                        Result.failure(
                                FlutterError(
                                        code= "initialization_error_code",
                                        message= error.message,
                                        details= null
                                )
                        )
                )}
        )
    }

    override fun signup(request: SignupRequestInterface, callback: (Result<AuthTokenInterface>) -> Unit) {
        val reachFive: ReachFive
        try {
            reachFive = getReachFiveInstance(reachFiveKey = request.reachFiveKey)
        } catch (error: FlutterError) {
            callback(Result.failure(error))
            return
        }

        val signupRequest = Converters.signupRequestFromInterface(request.profile)

        reachFive.signup(
                profile = signupRequest,
                scope = request.scope?.filterNotNull() ?: listOf(),
                success = { authToken ->
                    callback(Result.success(Converters.authTokenToInterface(authToken)))
                },
                failure = {
                    error -> callback(
                        Result.failure(
                                Converters.parseError(
                                        reachFiveError = error,
                                        errorCodesInterface = request.errorCodes,
                                        defaultFlutterError = FlutterError(
                                                code= "sign_up_error_code",
                                                message= error.message,
                                                details= null
                                        )
                                )
                        )
                    )}
        )
    }

    override fun loginWithPassword(request: LoginWithPasswordRequestInterface, callback: (Result<AuthTokenInterface>) -> Unit) {
        val reachFive: ReachFive
        try {
            reachFive = getReachFiveInstance(reachFiveKey = request.reachFiveKey)
        } catch (error: FlutterError) {
            callback(Result.failure(error))
            return
        }

        reachFive.loginWithPassword(
                email = request.email,
                phoneNumber = request.phoneNumber,
                password = request.password,
                scope = request.scope?.filterNotNull() ?: listOf(),
                success = { authToken ->
                    callback(Result.success(Converters.authTokenToInterface(authToken)))
                },
                failure = {
                    error -> callback(
                        Result.failure(
                                Converters.parseError(
                                        reachFiveError = error,
                                        errorCodesInterface = request.errorCodes,
                                        defaultFlutterError = FlutterError(
                                                code= "login_with_password_error_code",
                                                message= error.message,
                                                details= null
                                        )
                                )
                        )
                    )}
        )
    }

    override fun loginWithProvider(request: LoginWithProviderRequestInterface, callback: (Result<AuthTokenInterface>) -> Unit) {
        val reachFive: ReachFive
        try {
            reachFive = getReachFiveInstance(reachFiveKey = request.reachFiveKey)
        } catch (error: FlutterError) {
            callback(Result.failure(error))
            return
        }

        val provider = reachFive.getProvider(request.provider)
        if(provider == null) {
            callback(Result.failure(Error("This provider is not available in this reachFive instance")))
            return
        }

        val activity = this.activity
        if(activity == null) {
            callback(Result.failure(
                    FlutterError(
                            code= "not_available_provider_error_code",
                            message= "The provider was not found in your reachFive instance",
                            details= null
                    )
            ))
            return
        }

        this.loginWithProviderReachFiveInstance = reachFive
        this.onLoginWithProviderSuccess = {
            authToken ->
            callback(Result.success(Converters.authTokenToInterface(authToken)))
        }
        this.onLoginWithProviderFailure = {
            error -> callback(Result.failure(error))
        }
        this.errorCodes = request.errorCodes

        provider.login(
                origin = request.origin,
                scope = request.scope?.filterNotNull() ?: listOf(),
                activity = activity
        )
    }

    override fun logout(reachFiveKey: ReachFiveKeyInterface, callback: (Result<Unit>) -> Unit) {
        val reachFive: ReachFive
        try {
            reachFive = getReachFiveInstance(reachFiveKey = reachFiveKey)
        } catch (error: FlutterError) {
            callback(Result.failure(error))
            return
        }

        reachFive.logout(
                success = {
                    unit ->
                    callback(Result.success(unit))
                },
                failure = {
                    error -> callback(Result.failure(
                        FlutterError(
                                code= "logout_error_code",
                                message= error.message,
                                details= null
                        ))
                )}
        )
    }

    override fun getProfile(request: GetProfileRequestInterface, callback: (Result<ProfileInterface>) -> Unit) {
        val reachFive: ReachFive
        try {
            reachFive = getReachFiveInstance(reachFiveKey = request.reachFiveKey)
        } catch (error: FlutterError) {
            callback(Result.failure(error))
            return
        }

        reachFive.getProfile(
                authToken = Converters.authTokenFromInterface(request.authToken),
                success = {
                    profile ->
                    callback(Result.success(Converters.profileToInterface(profile)))
                },
                failure = {
                    error -> callback(Result.failure(
                        Converters.parseError(
                                reachFiveError = error,
                                errorCodesInterface = request.errorCodes,
                                defaultFlutterError = FlutterError(
                                        code= "get_profile_error_code",
                                        message= error.message,
                                        details= null
                                )
                        ))
                )}
        )
    }

    override fun updateProfile(request: UpdateProfileRequestInterface, callback: (Result<ProfileInterface>) -> Unit) {
        val reachFive: ReachFive
        try {
            reachFive = getReachFiveInstance(reachFiveKey = request.reachFiveKey)
        } catch (error: FlutterError) {
            callback(Result.failure(error))
            return
        }

        reachFive.updateProfile(
                authToken = Converters.authTokenFromInterface(request.authToken),
                profile = Converters.profileFromInterface(request.profile),
                success = {
                    profile ->
                    callback(Result.success(Converters.profileToInterface(profile)))
                },
                failure = {
                    error -> callback(Result.failure(
                        Converters.parseError(
                                reachFiveError = error,
                                errorCodesInterface = request.errorCodes,
                                defaultFlutterError = FlutterError(
                                        code= "update_profile_error_code",
                                        message= error.message,
                                        details= null
                                )
                        ))
                )}
        )
    }

    override fun refreshAccessToken(request: RefreshAccessTokenRequestInterface, callback: (Result<AuthTokenInterface>) -> Unit) {
        val reachFive: ReachFive
        try {
            reachFive = getReachFiveInstance(reachFiveKey = request.reachFiveKey)
        } catch (error: FlutterError) {
            callback(Result.failure(error))
            return
        }

        val requestAuthToken = request.authToken

        reachFive.refreshAccessToken(
                authToken = Converters.authTokenFromInterface(requestAuthToken),
                success = { authToken ->
                    callback(Result.success(Converters.authTokenToInterface(authToken)))
                },
                failure = {
                    error -> callback(Result.failure(
                        FlutterError(
                                code= "refresh_access_token_error_code",
                                message= error.message,
                                details= null
                        ))
                )}
        )
    }

    override fun requestPasswordReset(request: RequestPasswordResetRequestInterface, callback: (Result<Unit>) -> Unit) {
        val reachFive: ReachFive
        try {
            reachFive = getReachFiveInstance(reachFiveKey = request.reachFiveKey)
        } catch (error: FlutterError) {
            callback(Result.failure(error))
            return
        }

        reachFive.requestPasswordReset(
                email = request.email,
                phoneNumber = request.phoneNumber,
                redirectUrl = request.redirectUrl,
                success = { unit -> callback(Result.success(unit))},
                failure = {
                    error -> callback(Result.failure(
                        FlutterError(
                                code= "request_password_reset_error_code",
                                message= error.message,
                                details= null
                        ))
                )}
        )
    }

    override fun updatePasswordWithAccessToken(request: UpdatePasswordWithAccessTokenRequestInterface, callback: (Result<Unit>) -> Unit) {
        val reachFive: ReachFive
        try {
            reachFive = getReachFiveInstance(reachFiveKey = request.reachFiveKey)
        } catch (error: FlutterError) {
            callback(Result.failure(error))
            return
        }

        reachFive.updatePassword(
                updatePasswordRequest = AccessTokenParams(
                        authToken = Converters.authTokenFromInterface(request.authToken),
                        oldPassword = request.oldPassword,
                        password = request.password
                ),
                success = { unit -> callback(Result.success(unit)) },
                failure = {
                    error -> callback(Result.failure(
                        FlutterError(
                                code= "update_password_with_access_token_error_code",
                                message= error.message,
                                details= null
                        ))
                )}
        )
    }

    override fun updatePasswordWithFreshAccessToken(request: UpdatePasswordWithFreshAccessTokenRequestInterface, callback: (Result<Unit>) -> Unit) {
        val reachFive: ReachFive
        try {
            reachFive = getReachFiveInstance(reachFiveKey = request.reachFiveKey)
        } catch (error: FlutterError) {
            callback(Result.failure(error))
            return
        }

        reachFive.updatePassword(
                updatePasswordRequest = FreshAccessTokenParams(
                        freshAuthToken = Converters.authTokenFromInterface(request.freshAuthToken),
                        password = request.password
                ),
                success = { unit -> callback(Result.success(unit)) },
                failure = {
                    error -> callback(Result.failure(
                        FlutterError(
                                code= "update_password_with_fresh_access_token_error_code",
                                message= error.message,
                                details= null
                        ))
                )}
        )
    }

    override fun updatePasswordWithEmail(request: UpdatePasswordWithEmailRequestInterface, callback: (Result<Unit>) -> Unit) {
        val reachFive: ReachFive
        try {
            reachFive = getReachFiveInstance(reachFiveKey = request.reachFiveKey)
        } catch (error: FlutterError) {
            callback(Result.failure(error))
            return
        }

        reachFive.updatePassword(
                updatePasswordRequest = EmailParams(
                        email = request.email,
                        verificationCode = request.verificationCode,
                        password = request.password
                ),
                success = { unit -> callback(Result.success(unit)) },
                failure = {
                    error -> callback(Result.failure(
                        Converters.parseError(
                                reachFiveError = error,
                                errorCodesInterface = request.errorCodes,
                                defaultFlutterError = FlutterError(
                                        code= "update_password_with_email_request_error_code",
                                        message= error.message,
                                        details= null
                                )
                        ))
                )}
        )
    }

    override fun updatePasswordWithPhoneNumber(request: UpdatePasswordWithPhoneNumberRequestInterface, callback: (Result<Unit>) -> Unit) {
        val reachFive: ReachFive
        try {
            reachFive = getReachFiveInstance(reachFiveKey = request.reachFiveKey)
        } catch (error: FlutterError) {
            callback(Result.failure(error))
            return
        }

        reachFive.updatePassword(
                updatePasswordRequest = SmsParams(
                        phoneNumber = request.phoneNumber,
                        verificationCode = request.verificationCode,
                        password = request.password
                ),
                success = { unit -> callback(Result.success(unit)) },
                failure = {
                    error -> callback(Result.failure(
                        Converters.parseError(
                                reachFiveError = error,
                                errorCodesInterface = request.errorCodes,
                                defaultFlutterError = FlutterError(
                                        code= "update_password_with_phone_number_request_error_code",
                                        message= error.message,
                                        details= null
                                )
                        ))
                )}
        )
    }
}
