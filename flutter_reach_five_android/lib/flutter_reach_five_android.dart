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
      final errorMessage = error.message;
      if (errorMessage != null) {
        if (errorMessage.contains(errorCodesInterface.emailAlreadyInUseCode)) {
          throw EmailAlreadyInUseExceptionInterface();
        } else if (errorMessage
            .contains(errorCodesInterface.invalidEmailOrPasswordCode)) {
          throw InvalidEmailOrPasswordExceptionInterface();
        } else if (errorMessage
            .contains(errorCodesInterface.invalidVerificationCode)) {
          throw InvalidVerificationCodeExceptionInterface();
        }
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
