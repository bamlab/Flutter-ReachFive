import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';

import '../models/reach_five_config.dart';

/// Used to be the link between the ReachFiveConfigInterface
/// and the ReachFiveConfig exported from this package
class ReachFiveConfigConverter {
  /// convert a ReachFiveConfig to a ReachFiveConfigInterface
  static ReachFiveConfigInterface toInterface(
    ReachFiveConfig reachFiveConfig,
  ) =>
      ReachFiveConfigInterface(
        domain: reachFiveConfig.domain,
        clientId: reachFiveConfig.clientId,
        scheme: reachFiveConfig.scheme,
      );

  /// convert a ReachFiveConfigInterface to a ReachFiveConfig
  static ReachFiveConfig fromInterface(
    ReachFiveConfigInterface reachFiveConfigInterface,
  ) =>
      ReachFiveConfig(
        domain: reachFiveConfigInterface.domain,
        clientId: reachFiveConfigInterface.clientId,
        scheme: reachFiveConfigInterface.scheme,
      );
}
