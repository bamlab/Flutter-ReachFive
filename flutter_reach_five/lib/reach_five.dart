import 'package:dio/dio.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:reach_five_identity_repo/reach_five_identity_repo.dart';

import 'flutter_reach_five.dart';
import 'helpers/adapt_errors.dart';
import 'helpers/auth_token.dart';
import 'helpers/profile_converter.dart';
import 'helpers/profile_signup_request_converter.dart';
import 'helpers/provider_converter.dart';
import 'helpers/reach_five_key_converter.dart';
import 'helpers/scope_value_converter.dart';

FlutterReachFivePlatform get _platform => FlutterReachFivePlatform.instance;

/// {@template flutter_reach_five.reachFive}
/// [ReachFive], class used to call every reachFive native sdk methods
/// {@endtemplate}
class ReachFive {
  /// [ReachFive] default constructor
  const ReachFive({
    required this.reachFiveKey,
    required this.providers,
    required this.identityRepo,
  });

  /// @template flutter_reach_five.reachFive.reachFiveKey}
  /// [ReachFive] instance key, kept in memory here to be given in every
  /// reachFive native sdk methods
  /// It allows us to select the correct instance in the native part
  /// and to have multi-instance of reachFive
  /// {@endtemplate}
  final ReachFiveKey reachFiveKey;

  /// @template flutter_reach_five.reachFive.providers}
  /// [ReachFive] available providers, kept in memory here to be given in every
  /// reachFive native sdk methods that needs providers
  /// {@endtemplate}
  final List<Provider> providers;

  /// @template flutter_reach_five.reachFive.repo}
  /// [ReachFiveIdentityRepo] instance, kept in memory here to be create
  /// every api linked to it
  /// {@endtemplate}
  final ReachFiveIdentityRepo identityRepo;

  /// @template flutter_reach_five.reachFive.oAuthApi}
  /// [OAuthApi] instance from [identityRepo] to be given in every
  /// reachFive api methods that needs it
  /// {@endtemplate}
  OAuthApi get oAuthApi => identityRepo.getOAuthApi();

  /// {@template flutter_reach_five.reachFive.signup}
  /// Create and authenticate a new user with the specified data.
  /// {@endtemplate}
  Future<AuthToken> signup({
    required ProfileSignupRequest profile,
    String? redirectUrl,
    List<ScopeValue>? scope,
  }) async {
    try {
      final authTokenInterface = await _platform.signup(
        reachFiveKey: ReachFiveKeyConverter.toInterface(reachFiveKey),
        profile: ProfileSignupRequestConverter.toInterface(profile),
        redirectUrl: redirectUrl,
        scope: scope?.map(ScopeValueConverter.toInterface).toList(),
      );

      final authToken = AuthTokenConverter.fromInterface(authTokenInterface);

      return authToken;
    } catch (error, stackTrace) {
      try {
        _platform.parseError(error, stackTrace);
      } catch (interfaceError, interfaceStackTrace) {
        adaptErrors(
          error: interfaceError,
          stackTrace: interfaceStackTrace,
        );
      }
    }
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
    try {
      final authTokenInterface = await _platform.loginWithPassword(
        reachFiveKey: ReachFiveKeyConverter.toInterface(reachFiveKey),
        password: password,
        email: email,
        phoneNumber: phoneNumber,
        scope: scope?.map(ScopeValueConverter.toInterface).toList(),
      );

      final authToken = AuthTokenConverter.fromInterface(authTokenInterface);

      return authToken;
    } catch (error, stackTrace) {
      try {
        _platform.parseError(error, stackTrace);
      } catch (interfaceError, interfaceStackTrace) {
        adaptErrors(
          error: interfaceError,
          stackTrace: interfaceStackTrace,
        );
      }
    }
  }

  /// {@template flutter_reach_five.reachFive.loginWithProvider}
  /// Login an user by using one of the available providers
  ///
  /// Your available providers are in the field [providers]
  /// {@endtemplate}
  Future<AuthToken> loginWithProvider({
    required Provider provider,
    required String origin,
    List<ScopeValue>? scope,
  }) async {
    try {
      final authTokenInterface = await _platform.loginWithProvider(
        reachFiveKey: ReachFiveKeyConverter.toInterface(reachFiveKey),
        provider: ProviderConverter.toInterface(provider),
        origin: origin,
        scope: scope?.map(ScopeValueConverter.toInterface).toList(),
      );

      final authToken = AuthTokenConverter.fromInterface(authTokenInterface);

      return authToken;
    } catch (error, stackTrace) {
      try {
        _platform.parseError(error, stackTrace);
      } catch (interfaceError, interfaceStackTrace) {
        adaptErrors(
          error: interfaceError,
          stackTrace: interfaceStackTrace,
        );
      }
    }
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
      reachFiveKey: ReachFiveKeyConverter.toInterface(reachFiveKey),
    );
  }

  /// {@template flutter_reach_five.reachFive.getProfile}
  /// Get your user profile information
  ///
  /// It needs an authToken with an valid accessToken to succeed
  /// {@endtemplate}
  Future<Profile> getProfile({
    required AuthToken authToken,
  }) async {
    try {
      final newProfileInterface = await _platform.getProfile(
        reachFiveKey: ReachFiveKeyConverter.toInterface(reachFiveKey),
        authToken: AuthTokenConverter.toInterface(authToken),
      );

      return ProfileConverter.fromInterface(newProfileInterface);
    } catch (error, stackTrace) {
      try {
        _platform.parseError(error, stackTrace);
      } catch (interfaceError, interfaceStackTrace) {
        adaptErrors(
          error: interfaceError,
          stackTrace: interfaceStackTrace,
        );
      }
    }
  }

  /// {@template flutter_reach_five.reachFive.updateProfile}
  /// Update your user profile information
  ///
  /// It needs an authToken with an valid accessToken to succeed
  /// Every non null information given in [profile] will be updated
  /// {@endtemplate}
  Future<Profile> updateProfile({
    required AuthToken authToken,
    required Profile profile,
  }) async {
    try {
      final newProfileInterface = await _platform.updateProfile(
        reachFiveKey: ReachFiveKeyConverter.toInterface(reachFiveKey),
        authToken: AuthTokenConverter.toInterface(authToken),
        profile: ProfileConverter.toInterface(profile),
      );

      return ProfileConverter.fromInterface(newProfileInterface);
    } catch (error, stackTrace) {
      try {
        _platform.parseError(error, stackTrace);
      } catch (interfaceError, interfaceStackTrace) {
        adaptErrors(
          error: interfaceError,
          stackTrace: interfaceStackTrace,
        );
      }
    }
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
      reachFiveKey: ReachFiveKeyConverter.toInterface(reachFiveKey),
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
    final revokeTokenRequest = RevokeTokenRequest(
      clientId: reachFiveKey.sdkConfig.clientId,
      clientSecret: clientSecret ?? '',
      token: revokeTokenType.map(
        refresh: authToken.refreshToken ?? '',
        access: authToken.accessToken,
      ),
      tokenTypeHint: authToken.tokenType,
    );

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
        reachFiveKey: ReachFiveKeyConverter.toInterface(reachFiveKey),
        email: email,
        phoneNumber: phoneNumber,
        redirectUrl: redirectUrl,
      );

  /// {@template flutter_reach_five.reachFive.updatePassword}
  /// Make request for password reset
  ///
  /// You can choose between a [UpdatePasswordRequestWithAccessToken]
  /// that require a authToken and your oldPassword
  ///
  /// or a [UpdatePasswordRequestWithFreshAccessToken]
  /// that need a authToken with an access token from less than 5 minutes ago
  ///
  /// or a [UpdatePasswordRequestWithEmail]
  /// that need your email and a verification code
  ///
  /// or a [UpdatePasswordRequestWithPhoneNumber]
  /// that need your phone number and a verification code
  /// {@endtemplate}
  Future<void> updatePassword(
    UpdatePasswordRequest updatePasswordRequest,
  ) async {
    try {
      await updatePasswordRequest.map<Future<void>>(
        withAccessToken: (updatePasswordRequestWithAccessToken) =>
            _platform.updatePasswordWithAccessToken(
          reachFiveKey: ReachFiveKeyConverter.toInterface(reachFiveKey),
          authToken: AuthTokenConverter.toInterface(
            updatePasswordRequestWithAccessToken.authToken,
          ),
          oldPassword: updatePasswordRequestWithAccessToken.oldPassword,
          newPassword: updatePasswordRequestWithAccessToken.newPassword,
        ),
        withFreshAccessToken: (updatePasswordRequestWithFreshAccessToken) =>
            _platform.updatePasswordWithFreshAccessToken(
          reachFiveKey: ReachFiveKeyConverter.toInterface(reachFiveKey),
          freshAuthToken: AuthTokenConverter.toInterface(
            updatePasswordRequestWithFreshAccessToken.freshAuthToken,
          ),
          newPassword: updatePasswordRequestWithFreshAccessToken.newPassword,
        ),
        withEmail: (updatePasswordRequestWithEmail) =>
            _platform.updatePasswordWithEmail(
          reachFiveKey: ReachFiveKeyConverter.toInterface(reachFiveKey),
          email: updatePasswordRequestWithEmail.email,
          verificationCode: updatePasswordRequestWithEmail.verificationCode,
          newPassword: updatePasswordRequestWithEmail.newPassword,
        ),
        withPhoneNumber: (updatePasswordRequestWithPhoneNumber) =>
            _platform.updatePasswordWithPhoneNumber(
          reachFiveKey: ReachFiveKeyConverter.toInterface(reachFiveKey),
          phoneNumber: updatePasswordRequestWithPhoneNumber.phoneNumber,
          verificationCode:
              updatePasswordRequestWithPhoneNumber.verificationCode,
          newPassword: updatePasswordRequestWithPhoneNumber.newPassword,
        ),
      );
    } catch (error, stackTrace) {
      try {
        _platform.parseError(error, stackTrace);
      } catch (interfaceError, interfaceStackTrace) {
        adaptErrors(
          error: interfaceError,
          stackTrace: interfaceStackTrace,
        );
      }
    }
  }
}

/// {@template flutter_reach_five.reachFiveManager}
/// ReachFiveManager, class used to initialize each instance of ReachFive
/// {@endtemplate}
class ReachFiveManager {
  /// {@template flutter_reach_five.reachFiveManager.initialize}
  /// initialize function used to create an instance of ReachFive
  /// {@endtemplate}
  Future<ReachFive> initialize({
    required SdkConfig sdkConfig,
    List<ProviderCreator> providerCreators = const [],
    Dio? dio,
    String? domainPathOverride,
    List<Interceptor>? interceptors,
  }) async {
    final reachFiveConfigInterface = await _platform.initialize(
      ReachFiveKeyConverter.toInterface(
        ReachFiveKey(
          sdkConfig: sdkConfig,
          providerCreators: providerCreators,
        ),
      ),
    );

    final basePathOverride =
        domainPathOverride ?? 'https://${sdkConfig.domain}';

    final reachFiveIdentityRepo = ReachFiveIdentityRepo(
      dio: dio,
      basePathOverride: basePathOverride,
      interceptors: interceptors,
    );

    return ReachFive(
      reachFiveKey: ReachFiveKeyConverter.fromInterface(
        reachFiveConfigInterface.reachFiveKey,
      ),
      providers: reachFiveConfigInterface.providers
          .whereType<String>()
          .map(ProviderConverter.fromInterface)
          .toList(),
      identityRepo: reachFiveIdentityRepo,
    );
  }
}
