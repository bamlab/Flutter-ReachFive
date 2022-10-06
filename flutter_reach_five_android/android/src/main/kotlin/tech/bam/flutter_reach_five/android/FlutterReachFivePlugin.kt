package tech.bam.flutter_reach_five.android

import android.content.Context
import co.reachfive.identity.sdk.core.ReachFive
import co.reachfive.identity.sdk.core.models.SdkConfig
import io.flutter.embedding.engine.plugins.FlutterPlugin
import co.reachfive.identity.sdk.core.models.requests.UpdatePasswordRequest.*

class FlutterReachFivePlugin : FlutterPlugin, ReachFiveApi.ReachFiveHostApi
{
    private var context: Context? = null
    private var reachFiveInstances = mutableMapOf<String, ReachFive>()

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        ReachFiveApi.ReachFiveHostApi.setup(flutterPluginBinding.binaryMessenger, this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        ReachFiveApi.ReachFiveHostApi.setup(binding.binaryMessenger, null)
    }

    private fun getReachFiveInstanceKey(reachFiveKey: ReachFiveApi.ReachFiveKeyInterface): String {
        var key = reachFiveKey.sdkConfig.domain + reachFiveKey.sdkConfig.clientId + reachFiveKey.sdkConfig.scheme
        reachFiveKey.providerCreators.forEach { providerCreatorInterface ->
            key += providerCreatorInterface.type.name
        }
        return key
    }

    private fun getReachFiveInstance(reachFiveKey: ReachFiveApi.ReachFiveKeyInterface): ReachFive {
        val reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey = reachFiveKey)

        return reachFiveInstances[reachFiveInstanceKey]
            ?: throw Error("ReachFive instance has not been initialized")
    }

    override fun initialize(reachFiveKey: ReachFiveApi.ReachFiveKeyInterface, result: ReachFiveApi.Result<ReachFiveApi.ReachFiveConfigInterface>) {
        val reachFive = ReachFive(
            sdkConfig = SdkConfig(
                domain = reachFiveKey.sdkConfig.domain,
                clientId = reachFiveKey.sdkConfig.clientId,
                scheme = reachFiveKey.sdkConfig.scheme
            ),
            providersCreators = reachFiveKey.providerCreators.map { providerCreatorInterface ->
                Converters.providerCreatorFromInterface(providerCreatorInterface)
            }
        )

        val reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveKey = reachFiveKey)

        reachFive.initialize(
            success = {},
            failure = {
                    error -> result.error(error)
            }
        )

        val context = this.context
        if(context == null) {
            result.error(Error("No android context attached to your application"))
            return
        }

        reachFive.loadSocialProviders(
            context,
            success = { providers ->
                this.reachFiveInstances[reachFiveInstanceKey] = reachFive
                result.success(
                    ReachFiveApi.ReachFiveConfigInterface
                        .Builder()
                        .setReachFiveKey(reachFiveKey)
                        .setProviders(providers.map {
                                provider ->
                            provider.name
                        })
                        .build()
                )
            },
            failure = {
                    error -> result.error(error)
            }
        )
    }

    override fun signup(
        request: ReachFiveApi.SignupRequestInterface,
        result: ReachFiveApi.Result<ReachFiveApi.AuthTokenInterface>?
    ) {
        val reachFive: ReachFive
        try {
            reachFive = getReachFiveInstance(reachFiveKey = request.reachFiveKey)
        } catch (error: Error) {
            result?.error(error)
            return
        }

        val signupRequest = Converters.signupRequestFromInterface(request.profile)

        reachFive.signup(
            profile = signupRequest,
            scope = request.scope?.toList() ?: listOf(),
            success = { authToken ->
                result?.success(Converters.authTokenToInterface(authToken))
            },
            failure = { error -> result?.error(error)}
        )
    }

    override fun loginWithPassword(
        request: ReachFiveApi.LoginWithPasswordRequestInterface,
        result: ReachFiveApi.Result<ReachFiveApi.AuthTokenInterface>?
    ) {
        val reachFive: ReachFive
        try {
            reachFive = getReachFiveInstance(reachFiveKey = request.reachFiveKey)
        } catch (error: Error) {
            result?.error(error)
            return
        }

        reachFive.loginWithPassword(
            email = request.email,
            phoneNumber = request.phoneNumber,
            password = request.password,
            scope = request.scope?.toList() ?: listOf(),
            success = { authToken ->
                result?.success(Converters.authTokenToInterface(authToken))
            },
            failure = { error -> result?.error(error)}
        )
    }

    override fun logout(
        reachFiveKey: ReachFiveApi.ReachFiveKeyInterface,
        result: ReachFiveApi.Result<Void>?
    ) {
        val reachFive: ReachFive
        try {
            reachFive = getReachFiveInstance(reachFiveKey = reachFiveKey)
        } catch (error: Error) {
            result?.error(error)
            return
        }

        reachFive.logout(
            success = {
                result?.success(null)
            },
            failure = { error -> result?.error(error)}
        )
    }

    override fun refreshAccessToken(
        request: ReachFiveApi.RefreshAccessTokenRequestInterface,
        result: ReachFiveApi.Result<ReachFiveApi.AuthTokenInterface>?
    ) {
        val reachFive: ReachFive
        try {
            reachFive = getReachFiveInstance(reachFiveKey = request.reachFiveKey)
        } catch (error: Error) {
            result?.error(error)
            return
        }

        val requestAuthToken = request.authToken

        reachFive.refreshAccessToken(
            authToken = Converters.authTokenFromInterface(requestAuthToken),
            success = { authToken ->
                result?.success(Converters.authTokenToInterface(authToken))
            },
            failure = { error -> result?.error(error)}
        )
    }

    override fun requestPasswordReset(
        request: ReachFiveApi.RequestPasswordResetRequestInterface,
        result: ReachFiveApi.Result<Void>?
    ) {
        val reachFive: ReachFive
        try {
            reachFive = getReachFiveInstance(reachFiveKey = request.reachFiveKey)
        } catch (error: Error) {
            result?.error(error)
            return
        }
        
        reachFive.requestPasswordReset(
            email = request.email,
            phoneNumber = request.phoneNumber,
            redirectUrl = request.redirectUrl,
            success = { result?.success(null)},
            failure = {error -> result?.error(error)}
        )
    }

    override fun updatePasswordWithAccessToken(
        request: ReachFiveApi.UpdatePasswordWithAccessTokenRequestInterface,
        result: ReachFiveApi.Result<Void>?
    ) {
        val reachFive: ReachFive
        try {
            reachFive = getReachFiveInstance(reachFiveKey = request.reachFiveKey)
        } catch (error: Error) {
            result?.error(error)
            return
        }

        reachFive.updatePassword(
            updatePasswordRequest = AccessTokenParams(
                authToken = Converters.authTokenFromInterface(request.authToken),
                oldPassword = request.oldPassword,
                password = request.password
            ),
            success = { result?.success(null) },
            failure = {error -> result?.error(error)}
        )
    }

    override fun updatePasswordWithFreshAccessToken(
        request: ReachFiveApi.UpdatePasswordWithFreshAccessTokenRequestInterface,
        result: ReachFiveApi.Result<Void>?
    ) {
        val reachFive: ReachFive
        try {
            reachFive = getReachFiveInstance(reachFiveKey = request.reachFiveKey)
        } catch (error: Error) {
            result?.error(error)
            return
        }

        reachFive.updatePassword(
            updatePasswordRequest = FreshAccessTokenParams(
                freshAuthToken = Converters.authTokenFromInterface(request.freshAuthToken),
                password = request.password
            ),
            success = { result?.success(null) },
            failure = {error -> result?.error(error)}
        )
    }

    override fun updatePasswordWithEmail(
        request: ReachFiveApi.UpdatePasswordWithEmailRequestInterface,
        result: ReachFiveApi.Result<Void>?
    ) {
        val reachFive: ReachFive
        try {
            reachFive = getReachFiveInstance(reachFiveKey = request.reachFiveKey)
        } catch (error: Error) {
            result?.error(error)
            return
        }

        reachFive.updatePassword(
            updatePasswordRequest = EmailParams(
                email = request.email,
                verificationCode = request.verificationCode,
                password = request.password
            ),
            success = { result?.success(null) },
            failure = {error -> result?.error(error)}
        )
    }

    override fun updatePasswordWithPhoneNumber(
        request: ReachFiveApi.UpdatePasswordWithPhoneNumberRequestInterface,
        result: ReachFiveApi.Result<Void>?
    ) {
        val reachFive: ReachFive
        try {
            reachFive = getReachFiveInstance(reachFiveKey = request.reachFiveKey)
        } catch (error: Error) {
            result?.error(error)
            return
        }

        reachFive.updatePassword(
            updatePasswordRequest = SmsParams(
                phoneNumber = request.phoneNumber,
                verificationCode = request.verificationCode,
                password = request.password
            ),
            success = { result?.success(null) },
            failure = {error -> result?.error(error)}
        )
    }
}
