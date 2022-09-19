import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';

import './profile_signup_request_converter.dart';
import '../models/reach_five_config.dart';
import '../models/signup_request.dart';
import 'reach_five_config_converter.dart';

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

/// Used to be the link between the [SignupRequestInterface]
/// and the [SignupRequest] exported from this package
class SignupRequestConverter {
  /// convert a [SignupRequest] to a [SignupRequestInterface]
  static SignupRequestInterface toInterface(
    ReachFiveConfig reachFiveConfig,
    SignupRequest signupRequest,
  ) {
    final scope =
        signupRequest.scope?.map(ScopeValueConverter.toInterface).toList();

    return SignupRequestInterface(
      config: ReachFiveConfigConverter.toInterface(reachFiveConfig),
      profile: ProfileSignupRequestConverter.toInterface(signupRequest.profile),
      redirectUrl: signupRequest.redirectUrl,
      scope: scope,
    );
  }

  /// convert a [SignupRequestInterface] to a [SignupRequest]
  static SignupRequest fromInterface(
    SignupRequestInterface signupRequestInterface,
  ) {
    final scope = signupRequestInterface.scope
        ?.where((scopeValueString) => scopeValueString != null)
        .cast<String>()
        .map(ScopeValueConverter.fromInterface)
        .where((scopeValueString) => scopeValueString != null)
        .cast<ScopeValue>()
        .toList();

    return SignupRequest(
      profile: ProfileSignupRequestConverter.fromInterface(
        signupRequestInterface.profile,
      ),
      redirectUrl: signupRequestInterface.redirectUrl,
      scope: scope,
    );
  }
}
