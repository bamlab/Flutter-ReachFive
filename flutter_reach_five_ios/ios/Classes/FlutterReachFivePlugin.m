#import "FlutterReachFivePlugin.h"
#if __has_include(<flutter_reach_five_ios/flutter_reach_five_ios-Swift.h>)
#import <flutter_reach_five_ios/flutter_reach_five_ios-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_reach_five_ios-Swift.h"
#endif

@implementation FlutterReachFivePlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
  [SwiftFlutterReachFivePlugin registerWithRegistrar:registrar];
}

@end