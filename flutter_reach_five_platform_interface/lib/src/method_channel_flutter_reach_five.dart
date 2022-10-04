import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:flutter/services.dart';

import 'flutter_reach_five_platform.dart';

/// An implementation of [FlutterReachFivePlatform] that uses method channels.
class MethodChannelFlutterReachFive extends FlutterReachFivePlatform {
  /// {@template flutter_reach_five.methodChannelFlutterReachFive.methodChannel}
  /// The method channel used to interact with the native platform.
  /// {@endtemplate}
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_reach_five');
}
