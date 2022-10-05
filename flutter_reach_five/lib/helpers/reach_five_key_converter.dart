import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';

import '../models/reach_five_key.dart';
import 'provider_creator_converter.dart';
import 'sdk_config_converter.dart';

/// Used to be the link between the [ReachFiveKeyInterface]
/// and the [ReachFiveKey] exported from this package
class ReachFiveKeyConverter {
  /// convert a [ReachFiveKey] to a [ReachFiveKeyInterface]
  static ReachFiveKeyInterface toInterface(
    ReachFiveKey reachFiveKey,
  ) =>
      ReachFiveKeyInterface(
        sdkConfig: SdkConfigConverter.toInterface(reachFiveKey.sdkConfig),
        providerCreators: reachFiveKey.providerCreators
            .map(ProviderCreatorConverter.toInterface)
            .toList(),
      );

  /// convert a [ReachFiveKeyInterface] to a [ReachFiveKey]
  static ReachFiveKey fromInterface(
    ReachFiveKeyInterface reachFiveKeyInterface,
  ) =>
      ReachFiveKey(
        sdkConfig:
            SdkConfigConverter.fromInterface(reachFiveKeyInterface.sdkConfig),
        providerCreators: reachFiveKeyInterface.providerCreators
            .whereType<ProviderCreatorInterface>()
            .map(ProviderCreatorConverter.fromInterface)
            .toList(),
      );
}
