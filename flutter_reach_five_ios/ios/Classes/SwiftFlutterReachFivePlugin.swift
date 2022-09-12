import Flutter
import UIKit

public class SwiftFlutterReachFivePlugin: NSObject, FlutterPlugin, HostInfosApi {

  static var infosFlutterApi: FLutterInfosApi?

  public static func register(with registrar: FlutterPluginRegistrar) {
    let messenger : FlutterBinaryMessenger = registrar.messenger()
    let api : HostInfosApi & NSObjectProtocol = SwiftFlutterReachFivePlugin.init()
    HostInfosApiSetup(messenger, api);
    SwiftFlutterReachFivePlugin.infosFlutterApi =
      FLutterInfosApi(binaryMessenger: registrar.messenger())

  }

    public func searchWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> Infos? {
    let infos = Infos()
    infos.info1 = "info1"
    infos.info2 = "info2"

        SwiftFlutterReachFivePlugin.infosFlutterApi?.onSearch(
            completion: { (error: Error?) in
     
        })


    return infos
  }
}
