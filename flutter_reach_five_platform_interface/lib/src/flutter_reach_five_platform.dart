import 'package:flutter/foundation.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'method_channel_flutter_reach_five.dart';
import 'reach_five.g.dart';

/// {@template flutter_reach_five.flutterReachFivePlatform}
/// The interface that implementations of flutter_reach_five must implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `FlutterReachFive`.
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
/// this interface will be broken by newly added
/// [FlutterReachFivePlatform] methods
/// {@endtemplate}
abstract class FlutterReachFivePlatform extends PlatformInterface {
  /// Constructs a FlutterReachFivePlatform.
  FlutterReachFivePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterReachFivePlatform _instance = MethodChannelFlutterReachFive();

  /// The default instance of [FlutterReachFivePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterReachFive].
  static FlutterReachFivePlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [FlutterReachFivePlatform]
  /// when they register themselves.
  static set instance(FlutterReachFivePlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  static ReachFiveHostApi _reachFiveHostApi = ReachFiveHostApi();

  /// The default instance of [ReachFiveHostApi] to use
  ReachFiveHostApi get reachFiveHostApi => _reachFiveHostApi;

  /// You can use this to set another instance of [ReachFiveHostApi] to use
  ///
  /// This only for a test usage
  @visibleForTesting
  set reachFiveHostApi(ReachFiveHostApi newReachFiveHostApi) {
    _reachFiveHostApi = newReachFiveHostApi;
  }

  /// {@macro flutter_reach_five.reachFiveManager.initialize}
  Future<ReachFiveConfigInterface> initialize(
    ReachFiveKeyInterface reachFiveKey,
  ) =>
      reachFiveHostApi.initialize(reachFiveKey);

  /// {@macro flutter_reach_five.reachFive.signup}
  Future<AuthTokenInterface> signup({
    required ReachFiveKeyInterface reachFiveKey,
    required ProfileSignupRequestInterface profile,
    String? redirectUrl,
    List<String>? scope,
  }) =>
      reachFiveHostApi.signup(
        SignupRequestInterface(
          reachFiveKey: reachFiveKey,
          profile: profile,
          redirectUrl: redirectUrl,
          scope: scope,
        ),
      );

  /// {@macro flutter_reach_five.reachFive.loginWithPassword}
  Future<AuthTokenInterface> loginWithPassword({
    required ReachFiveKeyInterface reachFiveKey,
    required String password,
    String? email,
    String? phoneNumber,
    List<String>? scope,
  }) =>
      reachFiveHostApi.loginWithPassword(
        LoginWithPasswordRequestInterface(
          reachFiveKey: reachFiveKey,
          password: password,
          email: email,
          phoneNumber: phoneNumber,
          scope: scope,
        ),
      );

  /// {@macro flutter_reach_five.reachFive.logout}
  Future<void> logout({
    required ReachFiveKeyInterface reachFiveKey,
  }) =>
      reachFiveHostApi.logout(reachFiveKey);

  /// {@macro flutter_reach_five.reachFive.refreshAccessToken}
  Future<AuthTokenInterface> refreshAccessToken({
    required ReachFiveKeyInterface reachFiveKey,
    required AuthTokenInterface authToken,
  }) =>
      reachFiveHostApi.refreshAccessToken(
        RefreshAccessTokenRequestInterface(
          reachFiveKey: reachFiveKey,
          authToken: authToken,
        ),
      );

  /// {@macro flutter_reach_five.reachFive.requestPasswordReset}
  Future<void> requestPasswordReset({
    required ReachFiveKeyInterface reachFiveKey,
    String? email,
    String? phoneNumber,
    String? redirectUrl,
  }) =>
      reachFiveHostApi.requestPasswordReset(
        RequestPasswordResetRequestInterface(
          reachFiveKey: reachFiveKey,
          email: email,
          phoneNumber: phoneNumber,
          redirectUrl: redirectUrl,
        ),
      );

  /// {@macro flutter_reach_five.reachFive.updatePassword}
  Future<void> updatePasswordWithAccessToken({
    required ReachFiveKeyInterface reachFiveKey,
    required AuthTokenInterface authToken,
    required String oldPassword,
    required String newPassword,
  }) =>
      reachFiveHostApi.updatePasswordWithAccessToken(
        UpdatePasswordWithAccessTokenRequestInterface(
          reachFiveKey: reachFiveKey,
          authToken: authToken,
          oldPassword: oldPassword,
          password: newPassword,
        ),
      );

  /// {@macro flutter_reach_five.reachFive.updatePassword}
  Future<void> updatePasswordWithFreshAccessToken({
    required ReachFiveKeyInterface reachFiveKey,
    required AuthTokenInterface freshAuthToken,
    required String newPassword,
  }) =>
      reachFiveHostApi.updatePasswordWithFreshAccessToken(
        UpdatePasswordWithFreshAccessTokenRequestInterface(
          reachFiveKey: reachFiveKey,
          freshAuthToken: freshAuthToken,
          password: newPassword,
        ),
      );

  /// {@macro flutter_reach_five.reachFive.updatePassword}
  Future<void> updatePasswordWithEmail({
    required ReachFiveKeyInterface reachFiveKey,
    required String email,
    required String verificationCode,
    required String newPassword,
  }) =>
      reachFiveHostApi.updatePasswordWithEmail(
        UpdatePasswordWithEmailRequestInterface(
          reachFiveKey: reachFiveKey,
          email: email,
          verificationCode: verificationCode,
          password: newPassword,
        ),
      );

  /// {@macro flutter_reach_five.reachFive.updatePassword}
  Future<void> updatePasswordWithPhoneNumber({
    required ReachFiveKeyInterface reachFiveKey,
    required String phoneNumber,
    required String verificationCode,
    required String newPassword,
  }) =>
      reachFiveHostApi.updatePasswordWithPhoneNumber(
        UpdatePasswordWithPhoneNumberRequestInterface(
          reachFiveKey: reachFiveKey,
          phoneNumber: phoneNumber,
          verificationCode: verificationCode,
          password: newPassword,
        ),
      );
}
