// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_reach_five_platform_interface/src/method_channel_flutter_reach_five.dart';
import 'package:flutter_reach_five_platform_interface/src/reach_five.g.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// The interface that implementations of flutter_reach_five must implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `FlutterReachFive`.
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
/// this interface will be broken by newly added
/// [FlutterReachFivePlatform] methods
abstract class FlutterReachFivePlatform extends PlatformInterface {
  /// Constructs a FlutterReachFivePlatform.
  FlutterReachFivePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterReachFivePlatform _instance = MethodChannelFlutterReachFive();

  /// The default instance of [FlutterReachFivePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterReachFive].
  static FlutterReachFivePlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [FlutterReachFivePlatform]
  /// when they register themselves.
  static set instance(FlutterReachFivePlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Return Informations
  Future<ReachFiveConfigInterface> initialize(ReachFiveConfigInterface config) {
    return ReachFiveHostApi().initialize(config);
  }
}
