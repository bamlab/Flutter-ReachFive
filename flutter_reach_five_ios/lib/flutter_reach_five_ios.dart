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
        throw EmailAlreadyInUseException();
      } else if (error.code == errorCodesInterface.invalidEmailOrPasswordCode) {
        throw InvalidEmailOrPasswordException();
      } else if (error.code == errorCodesInterface.invalidVerificationCode) {
        throw InvalidVerificationCodeException();
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
