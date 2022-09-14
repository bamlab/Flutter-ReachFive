import Flutter
import UIKit
import IdentitySdkCore

public class SwiftFlutterReachFivePlugin: NSObject, FlutterPlugin, ReachFiveHostApi {
    
    var reachfive: ReachFive?

    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger : FlutterBinaryMessenger = registrar.messenger()
        let api : ReachFiveHostApi & NSObjectProtocol = SwiftFlutterReachFivePlugin.init()
        
        ReachFiveHostApiSetup(messenger, api);
        
    }

    public func initializeConfig(_ config: ReachFiveConfigInterface, completion: @escaping (ReachFiveConfigInterface?, FlutterError?) -> Void) {

        reachfive = ReachFive(
            sdkConfig: SdkConfig(
                domain: config.domain,
                clientId: config.clientId,
                scheme: config.scheme
            ),
            providersCreators: [],
            storage: nil
        )
        
        reachfive?
            .initialize()
            .onSuccess { providers in
                completion(
                    ReachFiveConfigInterface.make(
                        withDomain: config.domain,
                        clientId: config.clientId,
                        scheme: config.scheme
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
    
}
