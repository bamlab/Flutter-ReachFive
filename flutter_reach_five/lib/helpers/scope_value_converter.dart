import '../models/scope_value.dart';

/// Used to be the link between a [String]
/// and the [ScopeValue] exported from this package
class ScopeValueConverter {
  /// convert a [ScopeValue] to a [String]
  static String toInterface(
    ScopeValue scopeValue,
  ) =>
      scopeValue.name;

  /// convert a [String] to a [ScopeValue]?
  static ScopeValue? fromInterface(
    String scopeValueString,
  ) {
    const scopeValues = ScopeValue.values;

    final scopeValueIndex = scopeValues
        .indexWhere((scopeValue) => scopeValue.name == scopeValueString);

    final scopeValue =
        scopeValueIndex != -1 ? scopeValues[scopeValueIndex] : null;

    return scopeValue;
  }
}
