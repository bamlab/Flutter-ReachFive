import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:reach_five_repo/reach_five_repo.dart';

import 'flutter_reach_five.dart';
import 'helpers/auth_token.dart';
import 'helpers/profile_signup_request_converter.dart';
import 'helpers/reach_five_config_converter.dart';
import 'helpers/scope_value_converter.dart';
import 'models/revoke_token_type.dart';

FlutterReachFivePlatform get _platform => FlutterReachFivePlatform.instance;

/// {@template flutter_reach_five.reachFive}
/// [ReachFive], class used to call every reachFive native sdk methods
/// {@endtemplate}
class ReachFive {
  /// [ReachFive] default constructor
  const ReachFive({
    required this.config,
    required this.repo,
  });

  /// @template flutter_reach_five.reachFive.config}
  /// [ReachFive] config, kept in memory here to be given in every
  /// reachFive native sdk methods
  /// {@endtemplate}
  final ReachFiveConfig config;

  /// @template flutter_reach_five.reachFive.repo}
  /// [ReachFiveRepo] instance, kept in memory here to be create
  /// every api linked to it
  /// {@endtemplate}
  final ReachFiveRepo repo;

  /// @template flutter_reach_five.reachFive.oAuthApi}
  /// [OAuthApi] instance from [repo] to be given in every
  /// reachFive api methods that needs it
  /// {@endtemplate}
  OAuthApi get oAuthApi => repo.getOAuthApi();

  /// {@template flutter_reach_five.reachFive.signup}
  /// Create and authenticate a new user with the specified data.
  /// {@endtemplate}
  Future<AuthToken> signup({
    required ProfileSignupRequest profile,
    String? redirectUrl,
    List<ScopeValue>? scope,
  }) async {
    final authTokenInterface = await _platform.signup(
      config: ReachFiveConfigConverter.toInterface(config),
      profile: ProfileSignupRequestConverter.toInterface(profile),
      redirectUrl: redirectUrl,
      scope: scope?.map(ScopeValueConverter.toInterface).toList(),
    );

    final authToken = AuthTokenConverter.fromInterface(authTokenInterface);

    return authToken;
  }

  /// {@template flutter_reach_five.reachFive.loginWithPassword}
  /// Login an user by providing an identifier (email or phoneNumber) and a password
  /// {@endtemplate}
  Future<AuthToken> loginWithPassword({
    required String password,
    String? email,
    String? phoneNumber,
    List<ScopeValue>? scope,
  }) async {
    final authTokenInterface = await _platform.loginWithPassword(
      config: ReachFiveConfigConverter.toInterface(config),
      password: password,
      email: email,
      phoneNumber: phoneNumber,
      scope: scope?.map(ScopeValueConverter.toInterface).toList(),
    );

    final authToken = AuthTokenConverter.fromInterface(authTokenInterface);

    return authToken;
  }

  /// {@template flutter_reach_five.reachFive.logout}
  /// Logout your user from your session (and every providers)
  ///
  /// If you give an [authToken] in the prop, it can also revoke your
  /// refreshToken and all associated access token by using [revokeToken]
  /// {@endtemplate}
  Future<void> logout({
    AuthToken? authToken,
    String? clientSecret,
  }) async {
    if (authToken != null) {
      await revokeToken(
        authToken: authToken,
        revokeTokenType: RevokeTokenType.refresh,
        clientSecret: clientSecret,
      );
    }
    await _platform.logout(
      config: ReachFiveConfigConverter.toInterface(config),
    );
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
      config: ReachFiveConfigConverter.toInterface(config),
      authToken: AuthTokenConverter.toInterface(authToken),
    );

    return AuthTokenConverter.fromInterface(authTokenInterface);
  }

  /// {@template flutter_reach_five.reachFive.revokeToken}
  /// Revoke an [AuthToken] refreshToken or accessToken depending on
  /// the [revokeTokenType] for an user and a clientId
  ///
  /// clientSecret is necessary only if your client's authorization method is POST
  ///
  /// See the ReachFive doc for [Revoke token](https://developer.reachfive.com/openapi/identity.html#operation/revokeToken) endpoint
  /// {@endtemplate}
  Future<void> revokeToken({
    required AuthToken authToken,
    required RevokeTokenType revokeTokenType,
    String? clientSecret,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    bool Function(int?)? validateStatus,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final revokeTokenRequest = RevokeTokenRequest((revokeTokenRequestBuilder) {
      revokeTokenRequestBuilder
        ..clientId = config.clientId
        ..token = revokeTokenType.map(
          refresh: authToken.refreshToken,
          access: authToken.accessToken,
        )
        ..tokenTypeHint = authToken.tokenType
        ..clientSecret = clientSecret ?? '';
    });

    await oAuthApi.revokeToken(
      revokeTokenRequest: revokeTokenRequest,
      cancelToken: cancelToken,
      headers: headers,
      extra: extra,
      validateStatus: validateStatus,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  /// {@template flutter_reach_five.reachFive.requestPasswordReset}
  /// Make request for password reset
  /// You can personnalize the sent mail/SMS in the reachFive console
  /// {@endtemplate}
  Future<void> requestPasswordReset({
    String? email,
    String? phoneNumber,
    String? redirectUrl,
  }) =>
      _platform.requestPasswordReset(
        config: ReachFiveConfigConverter.toInterface(config),
        email: email,
        phoneNumber: phoneNumber,
        redirectUrl: redirectUrl,
      );
}

/// {@template flutter_reach_five.reachFiveManager}
/// ReachFiveManager, class used to initialize each instance of ReachFive
/// {@endtemplate}
class ReachFiveManager {
  /// {@template flutter_reach_five.reachFiveManager.initialize}
  /// initialize function used to create an instance of ReachFive
  /// {@endtemplate}
  static Future<ReachFive> initialize({
    required ReachFiveConfig config,
    Dio? dio,
    Serializers? serializers,
    String? domainPathOverride,
    List<Interceptor>? interceptors,
  }) async {
    final reachFiveConfig = await _platform.initialize(
      ReachFiveConfigInterface(
        domain: config.domain,
        clientId: config.clientId,
        scheme: config.scheme,
      ),
    );

    final basePathOverride = domainPathOverride ?? 'https://${config.domain}';

    final reachFiveRepo = ReachFiveRepo(
      dio: dio,
      serializers: serializers,
      basePathOverride: basePathOverride,
      interceptors: interceptors,
    );

    return ReachFive(
      config: ReachFiveConfigConverter.fromInterface(reachFiveConfig),
      repo: reachFiveRepo,
    );
  }
}
