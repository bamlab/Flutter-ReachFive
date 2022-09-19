import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';

import '../models/login_with_password_request.dart';
import '../models/reach_five_config.dart';
import '../models/scope_value.dart';
import 'reach_five_config_converter.dart';
import 'scope_value_converter.dart';

/// Used to be the link between the [LoginWithPasswordRequestInterface]
/// and the [LoginWithPasswordRequest] exported from this package
class LoginWithPasswordRequestConverter {
  /// convert a [LoginWithPasswordRequest] to a [LoginWithPasswordRequestInterface]
  static LoginWithPasswordRequestInterface toInterface(
    ReachFiveConfig reachFiveConfig,
    LoginWithPasswordRequest loginWithPasswordRequest,
  ) {
    final scope = loginWithPasswordRequest.scope
        ?.map(ScopeValueConverter.toInterface)
        .toList();

    return LoginWithPasswordRequestInterface(
      config: ReachFiveConfigConverter.toInterface(reachFiveConfig),
      email: loginWithPasswordRequest.email,
      phoneNumber: loginWithPasswordRequest.phoneNumber,
      password: loginWithPasswordRequest.password,
      scope: scope,
    );
  }

  /// convert a [LoginWithPasswordRequestInterface] to a [LoginWithPasswordRequest]
  static LoginWithPasswordRequest fromInterface(
    LoginWithPasswordRequestInterface loginWithPasswordRequestInterface,
  ) {
    final scope = loginWithPasswordRequestInterface.scope
        ?.where((scopeValueString) => scopeValueString != null)
        .cast<String>()
        .map(ScopeValueConverter.fromInterface)
        .whereType<ScopeValue>()
        .toList();

    return LoginWithPasswordRequest(
      email: loginWithPasswordRequestInterface.email,
      phoneNumber: loginWithPasswordRequestInterface.phoneNumber,
      password: loginWithPasswordRequestInterface.password,
      scope: scope,
    );
  }
}
