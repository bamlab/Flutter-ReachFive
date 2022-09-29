import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';

import '../models/sdk_config.dart';

/// Used to be the link between the [SdkConfigInterface]
/// and the [SdkConfig] exported from this package
class SdkConfigConverter {
  /// convert a [SdkConfig] to a [SdkConfigInterface]
  static SdkConfigInterface toInterface(
    SdkConfig sdkConfig,
  ) =>
      SdkConfigInterface(
        domain: sdkConfig.domain,
        clientId: sdkConfig.clientId,
        scheme: sdkConfig.scheme,
      );

  /// convert a [SdkConfigInterface] to a [SdkConfig]
  static SdkConfig fromInterface(
    SdkConfigInterface sdkConfigInterface,
  ) =>
      SdkConfig(
        domain: sdkConfigInterface.domain,
        clientId: sdkConfigInterface.clientId,
        scheme: sdkConfigInterface.scheme,
      );
}
