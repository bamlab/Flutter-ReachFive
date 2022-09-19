import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';

import './profile_signup_request_converter.dart';
import '../models/reach_five_config.dart';
import '../models/scope_value.dart';
import '../models/signup_request.dart';
import 'reach_five_config_converter.dart';
import 'scope_value_converter.dart';

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
        .whereType<ScopeValue>()
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
