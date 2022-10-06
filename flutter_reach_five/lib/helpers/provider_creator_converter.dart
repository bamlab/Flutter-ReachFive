import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';

import '../models/provider_creator.dart';

/// Used to be the link between a [ProviderCreatorInterface]
/// and the [ProviderCreator] exported from this package
class ProviderCreatorConverter {
  /// convert a [ProviderCreator] to a [ProviderCreatorInterface]
  static ProviderCreatorInterface toInterface(
    ProviderCreator providerCreator,
  ) =>
      ProviderCreatorInterface(
        type: ProviderCreatorTypeInterface.values.byName(providerCreator.name),
      );

  /// convert a [ProviderCreatorInterface] to a [ProviderCreator]?
  static ProviderCreator fromInterface(
    ProviderCreatorInterface providerCreatorInterface,
  ) =>
      ProviderCreator.values.byName(providerCreatorInterface.type.name);
}
