// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/foundation.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';

FlutterReachFivePlatform get _platform => FlutterReachFivePlatform.instance;

/// ReachFiveConfig class, contains the essential infos to create
/// a ReachFive instance
class ReachFiveConfig {
  /// ReachFiveConfig default constructor
  const ReachFiveConfig({
    required this.domain,
    required this.clientId,
    required this.scheme,
  });

  /// domain of your reachFive api
  final String domain;

  /// clientId of your reachFive api
  final String clientId;

  /// scheme of your reachFive api
  final String scheme;
}

/// Config Converter class used to be the link between the Interface Config
/// and the Config exported from this package
@visibleForTesting
class ReachFiveConfigConverter {
  /// convert a ReachFiveConfig to a ReachFiveConfigInterface
  static ReachFiveConfigInterface toInterface(
    ReachFiveConfig config,
  ) {
    return ReachFiveConfigInterface(
      domain: config.domain,
      clientId: config.clientId,
      scheme: config.scheme,
    );
  }

  /// convert a ReachFiveConfigInterface to a ReachFiveConfig
  static ReachFiveConfig fromInterface(
    ReachFiveConfigInterface config,
  ) {
    return ReachFiveConfig(
      domain: config.domain,
      clientId: config.clientId,
      scheme: config.scheme,
    );
  }
}

/// ReachFive, class used to call every reachFive native sdk methods
class ReachFive {
  /// ReachFive default constructor
  const ReachFive(this.config);

  /// ReachFive config, kept in memory here to be given in every
  /// reachFive native sdk methods
  final ReachFiveConfig config;
}

/// ReachFiveManager, class used to initialize each instance of ReachFive
class ReachFiveManager {
  /// initialize function used to create an instance of ReachFive
  static Future<ReachFive> initialize(ReachFiveConfig config) async {
    final reachFiveConfig = await _platform.initialize(
      ReachFiveConfigInterface(
        domain: config.domain,
        clientId: config.clientId,
        scheme: config.scheme,
      ),
    );

    return ReachFive(
      ReachFiveConfigConverter.fromInterface(reachFiveConfig),
    );
  }
}
