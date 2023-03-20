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
      if (errorCode.contains(errorCodesInterface.emailAlreadyInUseCode)) {
        throw EmailAlreadyInUseExceptionInterface();
      } else if (errorCode
          .contains(errorCodesInterface.invalidEmailOrPasswordCode)) {
        throw InvalidEmailOrPasswordExceptionInterface();
      } else if (errorCode
          .contains(errorCodesInterface.invalidVerificationCode)) {
        throw InvalidVerificationCodeExceptionInterface();
      } else if (errorCode.contains(errorCodesInterface.invalidGrant)) {
        throw InvalidGrantCodeExceptionInterface();
      } else if (errorCode
          .contains(errorCodesInterface.userCancelledOrClosedTheWebFlow)) {
        throw UserCancelledOrClosedTheWebFlowCodeExceptionInterface();
      } else if (errorCode
          .contains(errorCodesInterface.socialAccountEmailAlreadyInUse)) {
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
