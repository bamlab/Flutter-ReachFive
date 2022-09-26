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

    private fun getReachFiveInstanceKey(reachFiveConfig: ReachFiveApi.ReachFiveConfigInterface): String {
        return reachFiveConfig.domain + reachFiveConfig.clientId + reachFiveConfig.scheme
    }

    private fun getReachFiveInstance(reachFiveConfig: ReachFiveApi.ReachFiveConfigInterface): ReachFive {
        val reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveConfig = reachFiveConfig)

        return reachFiveInstances[reachFiveInstanceKey]
            ?: throw Error("ReachFive instance has not been initialized")
    }

    override fun initialize(config: ReachFiveApi.ReachFiveConfigInterface, result: ReachFiveApi.Result<ReachFiveApi.ReachFiveConfigInterface>) {
        val reachFive = ReachFive(
            sdkConfig = SdkConfig(
                domain = config.domain,
                clientId = config.clientId,
                scheme = config.scheme
            ),
            providersCreators = listOf()
        )

        val reachFiveInstanceKey = getReachFiveInstanceKey(reachFiveConfig = config)

        reachFive.initialize(
            {
                this.reachFiveInstances[reachFiveInstanceKey] = reachFive
                result.success(
                    ReachFiveApi.ReachFiveConfigInterface
                        .Builder()
                        .setDomain(reachFive.sdkConfig.domain)
                        .setClientId(reachFive.sdkConfig.clientId)
                        .setScheme(reachFive.sdkConfig.scheme)
                        .build()
                )
        }, {
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
            reachFive = getReachFiveInstance(reachFiveConfig = request.config)
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
            reachFive = getReachFiveInstance(reachFiveConfig = request.config)
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
        config: ReachFiveApi.ReachFiveConfigInterface,
        result: ReachFiveApi.Result<Void>?
    ) {
        val reachFive: ReachFive
        try {
            reachFive = getReachFiveInstance(reachFiveConfig = config)
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
            reachFive = getReachFiveInstance(reachFiveConfig = request.config)
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
            reachFive = getReachFiveInstance(reachFiveConfig = request.config)
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
            reachFive = getReachFiveInstance(reachFiveConfig = request.config)
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
            reachFive = getReachFiveInstance(reachFiveConfig = request.config)
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
            reachFive = getReachFiveInstance(reachFiveConfig = request.config)
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
            reachFive = getReachFiveInstance(reachFiveConfig = request.config)
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
