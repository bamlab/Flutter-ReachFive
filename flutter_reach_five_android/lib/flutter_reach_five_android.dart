// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';

/// The Android implementation of [FlutterReachFivePlatform].
class FlutterReachFiveAndroid extends FlutterReachFivePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final MethodChannel methodChannel =
      const MethodChannel('flutter_reach_five_android');

  /// Registers this class as the default instance of [FlutterReachFivePlatform]
  static void registerWith() {
    FlutterReachFivePlatform.instance = FlutterReachFiveAndroid();
  }
}
