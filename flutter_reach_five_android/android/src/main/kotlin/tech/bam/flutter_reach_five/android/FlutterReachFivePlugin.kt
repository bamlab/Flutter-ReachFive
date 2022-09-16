package tech.bam.flutter_reach_five.android

import android.content.Context
import androidx.annotation.NonNull
import co.reachfive.identity.sdk.core.ReachFive
import co.reachfive.identity.sdk.core.models.SdkConfig
import io.flutter.embedding.engine.plugins.FlutterPlugin

class FlutterReachFivePlugin : FlutterPlugin, ReachFiveApi.ReachFiveHostApi
{
    private var context: Context? = null
    private lateinit var reachFive: ReachFive

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        ReachFiveApi.ReachFiveHostApi.setup(flutterPluginBinding.binaryMessenger, this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        ReachFiveApi.ReachFiveHostApi.setup(binding.binaryMessenger, null)
    }

    override fun initialize(config: ReachFiveApi.ReachFiveConfigInterface, result: ReachFiveApi.Result<ReachFiveApi.ReachFiveConfigInterface>) {
        this.reachFive = ReachFive(
            sdkConfig = SdkConfig(
                domain = config.domain,
                clientId = config.clientId,
                scheme = config.scheme
            ),
            providersCreators = listOf()
        ).initialize(
            {
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
        val signupRequest = Converters.signupRequestFromInterface(request.profile)
        
        this.reachFive.signup(
            profile = signupRequest,
            scope = request.scope?.toList() ?: listOf(),
            success = { authToken ->
                result?.success(Converters.authTokenToInterface(authToken))
            },
            failure = { error -> result?.error(error)}
        )
    }
}
