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

    override fun initialize(config: ReachFiveApi.ReachFiveConfigInterface): ReachFiveApi.ReachFiveConfigInterface {
        this.reachFive = ReachFive(
            sdkConfig = SdkConfig(
                domain = config.domain,
                clientId = config.clientId,
                scheme = config.scheme
            ),
            providersCreators = listOf()
        ).initialize({}, {})

        return ReachFiveApi.ReachFiveConfigInterface
            .Builder()
            .setDomain(reachFive.sdkConfig.domain)
            .setClientId(reachFive.sdkConfig.clientId)
            .setScheme(reachFive.sdkConfig.scheme)
            .build()
    }
}