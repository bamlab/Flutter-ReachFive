import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';

/// {@macro flutter_reach_five.flutterReachFivePlatform}
///
/// The Android implementation of [FlutterReachFivePlatform].
class FlutterReachFiveAndroid extends FlutterReachFivePlatform {
  @override
  Never parseError(Object error, StackTrace stackTrace) {
    if (error is PlatformException) {
      final errorCode = error.code;
      if (errorCode == errorCodesInterface.emailAlreadyInUseCode) {
        throw EmailAlreadyInUseExceptionInterface();
      } else if (errorCode == errorCodesInterface.invalidEmailOrPasswordCode) {
        throw InvalidEmailOrPasswordExceptionInterface();
      } else if (errorCode == errorCodesInterface.invalidVerificationCode) {
        throw InvalidVerificationCodeExceptionInterface();
      } else if (errorCode == errorCodesInterface.invalidGrant) {
        throw InvalidGrantCodeExceptionInterface();
      } else if (errorCode ==
          errorCodesInterface.userCancelledOrClosedTheWebFlow) {
        throw UserCancelledOrClosedTheWebFlowCodeExceptionInterface();
      } else if (errorCode ==
          errorCodesInterface.socialAccountEmailAlreadyInUse) {
        throw SocialAccountEmailAlreadyInUseExceptionInterface();
      }
    }
    return Error.throwWithStackTrace(error, stackTrace);
  }

  /// {@macro flutter_reach_five.methodChannelFlutterReachFive.methodChannel}
  @visibleForTesting
  final MethodChannel methodChannel =
      const MethodChannel('flutter_reach_five_android');

  /// Registers this class as the default instance of [FlutterReachFivePlatform]
  static void registerWith() {
    FlutterReachFivePlatform.instance = FlutterReachFiveAndroid();
  }
}
