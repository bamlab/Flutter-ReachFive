import '../models/provider.dart';

/// Used to be the link between a [String]
/// and the [Provider] exported from this package
class ProviderConverter {
  /// convert a [Provider] to a [String]
  static String toInterface(
    Provider provider,
  ) =>
      provider.name;

  /// convert a [String] to a [Provider]?
  static Provider fromInterface(
    String providerString,
  ) =>
      Provider.values.byName(providerString);
}
