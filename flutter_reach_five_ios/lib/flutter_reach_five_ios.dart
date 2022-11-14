import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';

/// {@macro flutter_reach_five.flutterReachFivePlatform}
///
/// The iOS implementation of [FlutterReachFivePlatform].
class FlutterReachFiveIOS extends FlutterReachFivePlatform {
  @override
  Never parseError(Object error, StackTrace stackTrace) {
    if (error is PlatformException) {
      if (error.code == errorCodesInterface.emailAlreadyInUseCode) {
        throw EmailAlreadyInUseExceptionInterface();
      } else if (error.code == errorCodesInterface.invalidEmailOrPasswordCode) {
        throw InvalidEmailOrPasswordExceptionInterface();
      } else if (error.code == errorCodesInterface.invalidVerificationCode) {
        throw InvalidVerificationCodeExceptionInterface();
      } else if (error.code == errorCodesInterface.invalidGrant) {
        throw InvalidGrantCodeExceptionInterface();
      } else if (error.code ==
          errorCodesInterface.userCancelledOrClosedTheWebFlow) {
        throw UserCancelledOrClosedTheWebFlowCodeExceptionInterface();
      } else if (error.code ==
          errorCodesInterface.socialAccountEmailAlreadyInUse) {
        throw SocialAccountEmailAlreadyInUseExceptionInterface();
      }
    }
    return Error.throwWithStackTrace(error, stackTrace);
  }

  /// {@macro flutter_reach_five.methodChannelFlutterReachFive.methodChannel}
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_reach_five_ios');

  /// Registers this class as the default instance of [FlutterReachFivePlatform]
  static void registerWith() {
    FlutterReachFivePlatform.instance = FlutterReachFiveIOS();
  }
}
