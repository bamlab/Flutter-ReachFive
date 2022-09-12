package tech.bam.flutter_reach_five.android

import android.content.Context
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin

class FlutterReachFivePlugin : FlutterPlugin, Info.HostInfosApi
{
    private var context: Context? = null
    private var infosFlutterApi: Info.FLutterInfosApi? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        Info.HostInfosApi.setup(flutterPluginBinding.binaryMessenger, this)
        infosFlutterApi = Info.FLutterInfosApi(flutterPluginBinding.binaryMessenger)
        context = flutterPluginBinding.applicationContext
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        Info.HostInfosApi.setup(binding.binaryMessenger, null)
        infosFlutterApi = null
    }

    override fun search(): Info.Infos {
        val infos = Info.Infos()
        infos.info1 = "info1"
        infos.info2 = "info2"

        infosFlutterApi?.onSearch{Info.FLutterInfosApi.Reply<Void>{}}

        return infos
    }
}