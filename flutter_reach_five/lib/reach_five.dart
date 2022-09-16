import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';

import 'helpers/auth_token.dart';
import 'helpers/reach_five_config_converter.dart';
import 'helpers/signup_request_converter.dart';
import 'models/auth_token.dart';
import 'models/reach_five_config.dart';
import 'models/signup_request.dart';

FlutterReachFivePlatform get _platform => FlutterReachFivePlatform.instance;

/// ReachFive, class used to call every reachFive native sdk methods
class ReachFive {
  /// ReachFive default constructor
  const ReachFive(this.config);

  /// ReachFive config, kept in memory here to be given in every
  /// reachFive native sdk methods
  final ReachFiveConfig config;

  /// Sign up method
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
}

/// ReachFiveManager, class used to initialize each instance of ReachFive
class ReachFiveManager {
  /// initialize function used to create an instance of ReachFive
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
