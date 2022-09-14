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

    public func initializeConfig(_ config: ReachFiveConfigInterface, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> ReachFiveConfigInterface? {

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
            .onSuccess { providers in }
            .onFailure { error in }
                
        return ReachFiveConfigInterface.make(
            withDomain: config.domain,
            clientId: config.clientId,
            scheme: config.scheme
        )
        
    }
    
}
