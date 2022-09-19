import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';

import '../models/auth_token.dart';
import 'open_id_user.dart';

/// Used to be the link between the [AuthTokenInterface]
/// and the [AuthToken] exported from this package
class AuthTokenConverter {
  /// convert a [AuthToken] to a [AuthTokenInterface]
  static AuthTokenInterface toInterface(
    AuthToken authToken,
  ) {
    final user = authToken.user;

    return AuthTokenInterface(
      idToken: authToken.idToken,
      accessToken: authToken.accessToken,
      refreshToken: authToken.refreshToken,
      tokenType: authToken.tokenType,
      expiresIn: authToken.expiresIn,
      user: user != null ? OpenIdUserConverter.toInterface(user) : null,
    );
  }

  /// convert a [AuthTokenInterface] to a [AuthToken]
  static AuthToken fromInterface(
    AuthTokenInterface authTokenInterface,
  ) {
    final user = authTokenInterface.user;

    return AuthToken(
      idToken: authTokenInterface.idToken,
      accessToken: authTokenInterface.accessToken,
      refreshToken: authTokenInterface.refreshToken,
      tokenType: authTokenInterface.tokenType,
      expiresIn: authTokenInterface.expiresIn,
      user: user != null ? OpenIdUserConverter.fromInterface(user) : null,
    );
  }
}
