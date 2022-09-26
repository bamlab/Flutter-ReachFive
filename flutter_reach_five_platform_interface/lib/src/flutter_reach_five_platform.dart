// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

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
    ReachFiveConfigInterface config,
  ) =>
      reachFiveHostApi.initialize(config);

  /// {@macro flutter_reach_five.reachFive.signup}
  Future<AuthTokenInterface> signup({
    required ReachFiveConfigInterface config,
    required ProfileSignupRequestInterface profile,
    String? redirectUrl,
    List<String>? scope,
  }) =>
      reachFiveHostApi.signup(
        SignupRequestInterface(
          config: config,
          profile: profile,
          redirectUrl: redirectUrl,
          scope: scope,
        ),
      );

  /// {@macro flutter_reach_five.reachFive.loginWithPassword}
  Future<AuthTokenInterface> loginWithPassword({
    required ReachFiveConfigInterface config,
    required String password,
    String? email,
    String? phoneNumber,
    List<String>? scope,
  }) =>
      reachFiveHostApi.loginWithPassword(
        LoginWithPasswordRequestInterface(
          config: config,
          password: password,
          email: email,
          phoneNumber: phoneNumber,
          scope: scope,
        ),
      );

  /// {@macro flutter_reach_five.reachFive.logout}
  Future<void> logout({
    required ReachFiveConfigInterface config,
  }) =>
      reachFiveHostApi.logout(config);

  /// {@macro flutter_reach_five.reachFive.refreshAccessToken}
  Future<AuthTokenInterface> refreshAccessToken({
    required ReachFiveConfigInterface config,
    required AuthTokenInterface authToken,
  }) =>
      reachFiveHostApi.refreshAccessToken(
        RefreshAccessTokenRequestInterface(
          config: config,
          authToken: authToken,
        ),
      );

  /// {@macro flutter_reach_five.reachFive.requestPasswordReset}
  Future<void> requestPasswordReset({
    required ReachFiveConfigInterface config,
    String? email,
    String? phoneNumber,
    String? redirectUrl,
  }) =>
      reachFiveHostApi.requestPasswordReset(
        RequestPasswordResetRequestInterface(
          config: config,
          email: email,
          phoneNumber: phoneNumber,
          redirectUrl: redirectUrl,
        ),
      );

  /// {@macro flutter_reach_five.reachFive.updatePassword}
  Future<void> updatePasswordWithAccessToken({
    required ReachFiveConfigInterface config,
    required AuthTokenInterface authToken,
    required String oldPassword,
    required String newPassword,
  }) =>
      reachFiveHostApi.updatePasswordWithAccessToken(
        UpdatePasswordWithAccessTokenRequestInterface(
          config: config,
          authToken: authToken,
          oldPassword: oldPassword,
          password: newPassword,
        ),
      );

  /// {@macro flutter_reach_five.reachFive.updatePassword}
  Future<void> updatePasswordWithFreshAccessToken({
    required ReachFiveConfigInterface config,
    required AuthTokenInterface freshAuthToken,
    required String newPassword,
  }) =>
      reachFiveHostApi.updatePasswordWithFreshAccessToken(
        UpdatePasswordWithFreshAccessTokenRequestInterface(
          config: config,
          freshAuthToken: freshAuthToken,
          password: newPassword,
        ),
      );

  /// {@macro flutter_reach_five.reachFive.updatePassword}
  Future<void> updatePasswordWithEmail({
    required ReachFiveConfigInterface config,
    required String email,
    required String verificationCode,
    required String newPassword,
  }) =>
      reachFiveHostApi.updatePasswordWithEmail(
        UpdatePasswordWithEmailRequestInterface(
          config: config,
          email: email,
          verificationCode: verificationCode,
          password: newPassword,
        ),
      );

  /// {@macro flutter_reach_five.reachFive.updatePassword}
  Future<void> updatePasswordWithPhoneNumber({
    required ReachFiveConfigInterface config,
    required String phoneNumber,
    required String verificationCode,
    required String newPassword,
  }) =>
      reachFiveHostApi.updatePasswordWithPhoneNumber(
        UpdatePasswordWithPhoneNumberRequestInterface(
          config: config,
          phoneNumber: phoneNumber,
          verificationCode: verificationCode,
          password: newPassword,
        ),
      );
}
