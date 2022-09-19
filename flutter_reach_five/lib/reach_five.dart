import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';

import 'helpers/auth_token.dart';
import 'helpers/login_with_password_request_converter.dart';
import 'helpers/reach_five_config_converter.dart';
import 'helpers/signup_request_converter.dart';
import 'models/auth_token.dart';
import 'models/login_with_password_request.dart';
import 'models/reach_five_config.dart';
import 'models/signup_request.dart';

FlutterReachFivePlatform get _platform => FlutterReachFivePlatform.instance;

/// {@template flutter_reach_five.reachFive}
/// [ReachFive], class used to call every reachFive native sdk methods
/// {@endtemplate}
class ReachFive {
  /// [ReachFive] default constructor
  const ReachFive(this.config);

  /// @template flutter_reach_five.reachFive.config}
  /// [ReachFive] config, kept in memory here to be given in every
  /// reachFive native sdk methods
  /// {@endtemplate}
  final ReachFiveConfig config;

  /// {@template flutter_reach_five.reachFive.signup}
  /// Create and authenticate a new user with the specified data.
  /// {@endtemplate}
  Future<AuthToken> signup(SignupRequest request) async {
    final authTokenInterface = await _platform.signup(
      SignupRequestConverter.toInterface(
        config,
        request,
      ),
    );

    final authToken = AuthTokenConverter.fromInterface(authTokenInterface);

    return authToken;
  }

  /// {@template flutter_reach_five.reachFive.loginWithPassword}
  /// Login an user by providing an identifier (email or phoneNumber) and a password
  /// {@endtemplate}
  Future<AuthToken> loginWithPassword(LoginWithPasswordRequest request) async {
    final authTokenInterface = await _platform.loginWithPassword(
      LoginWithPasswordRequestConverter.toInterface(
        config,
        request,
      ),
    );

    final authToken = AuthTokenConverter.fromInterface(authTokenInterface);

    return authToken;
  }

  /// {@template flutter_reach_five.reachFive.refreshAccessToken}
  /// Obtain a new [AuthToken] once your access token has expired.
  ///
  /// * An expired access token (short-lived) can be renewed using a refresh token (long-lived).
  /// * Refreshing access tokens using an expired refresh token fails and invalidates all refresh tokens issued previously, for this ReachFive client only.
  /// * The profile must have been granted the `offline_access` scope at the last authentication to obtain a refresh token.
  /// * For refresh token to be included in your [AuthToken], your client must be configured on the ReachFive Console to enforce PKCE and to enable refresh tokens.
  ///
  /// For more on refresh tokens, check out the [Refresh Tokens](https://developer.reachfive.com/docs/refresh-tokens.html) page.
  /// {@endtemplate}
  Future<AuthToken> refreshAccessToken(AuthToken authToken) async {
    final authTokenInterface = await _platform.refreshAccessToken(
      RefreshAccessTokenRequestInterface(
        authToken: AuthTokenConverter.toInterface(authToken),
        config: ReachFiveConfigConverter.toInterface(config),
      ),
    );

    return AuthTokenConverter.fromInterface(authTokenInterface);
  }
}

/// {@template flutter_reach_five.reachFiveManager}
/// ReachFiveManager, class used to initialize each instance of ReachFive
/// {@endtemplate}
class ReachFiveManager {
  /// {@template flutter_reach_five.reachFiveManager.initialize}
  /// initialize function used to create an instance of ReachFive
  /// {@endtemplate}
  static Future<ReachFive> initialize(ReachFiveConfig config) async {
    final reachFiveConfig = await _platform.initialize(
      ReachFiveConfigInterface(
        domain: config.domain,
        clientId: config.clientId,
        scheme: config.scheme,
      ),
    );

    return ReachFive(
      ReachFiveConfigConverter.fromInterface(reachFiveConfig),
    );
  }
}
