import 'package:flutter/material.dart';
import 'package:flutter_reach_five/flutter_reach_five.dart';

import '../methods/initialize_method.dart';
import '../methods/login_with_password_method.dart';
import '../methods/logout_method.dart';
import '../methods/refresh_access_token_method.dart';
import '../methods/signup_method.dart';

enum ReachFiveMethod {
  initialize,
  signup,
  loginWithPassword,
  logout,
  refreshAccessToken,
}

class ReachFiveMethodsView extends StatefulWidget {
  const ReachFiveMethodsView({super.key});

  @override
  State<ReachFiveMethodsView> createState() => _ReachFiveMethodsViewState();
}

class _ReachFiveMethodsViewState extends State<ReachFiveMethodsView> {
  var selectedReachFiveMethod = ReachFiveMethod.initialize;

  void setSelectedReachFiveMethod(ReachFiveMethod newSelectedReachFiveMethod) =>
      setState(() {
        selectedReachFiveMethod = newSelectedReachFiveMethod;
      });

  ReachFive? reachFive;
  AuthToken? authToken;

  void setReachFive(ReachFive newReachFive) => setState(() {
        reachFive = newReachFive;
      });

  void setAuthToken(AuthToken newAuthToken) => setState(() {
        authToken = newAuthToken;
      });

  void resetAuthToken() => setState(() {
        authToken = null;
      });

  @override
  Widget build(BuildContext context) {
    final reachFive = this.reachFive;
    final authToken = this.authToken;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        children: [
          const SizedBox(width: double.infinity),
          DropdownButton<ReachFiveMethod>(
            value: selectedReachFiveMethod,
            items: ReachFiveMethod.values
                .map(
                  (reachFiveMethod) => DropdownMenuItem<ReachFiveMethod>(
                    value: reachFiveMethod,
                    child: Text(reachFiveMethod.name),
                  ),
                )
                .toList(),
            onChanged: (reachFiveMethod) => reachFiveMethod != null
                ? setSelectedReachFiveMethod(reachFiveMethod)
                : null,
          ),
          Expanded(
            child: _ReachFiveMethodView(
              reachFiveMethod: selectedReachFiveMethod,
              reachFive: reachFive,
              setReachFive: setReachFive,
              authToken: authToken,
              setAuthToken: setAuthToken,
              resetAuthToken: resetAuthToken,
            ),
          ),
        ],
      ),
    );
  }
}

class _ReachFiveMethodView extends StatelessWidget {
  const _ReachFiveMethodView({
    required this.reachFiveMethod,
    required this.reachFive,
    required this.setReachFive,
    required this.authToken,
    required this.setAuthToken,
    required this.resetAuthToken,
  });

  final ReachFiveMethod reachFiveMethod;

  final ReachFive? reachFive;
  final void Function(ReachFive) setReachFive;

  final AuthToken? authToken;
  final void Function(AuthToken) setAuthToken;
  final void Function() resetAuthToken;

  @override
  Widget build(BuildContext context) {
    final reachFiveMethod = this.reachFiveMethod;
    final reachFive = this.reachFive;
    final authToken = this.authToken;

    switch (reachFiveMethod) {
      case ReachFiveMethod.initialize:
        return InitializeMethod(
          reachFive: reachFive,
          setReachFive: setReachFive,
        );
      case ReachFiveMethod.signup:
        if (reachFive != null) {
          return SignupMethod(
            reachFive: reachFive,
            authToken: authToken,
            setAuthToken: setAuthToken,
          );
        }
        return const Text('You should initialize Reach Five first');
      case ReachFiveMethod.loginWithPassword:
        if (reachFive != null) {
          return LoginWithPasswordMethod(
            reachFive: reachFive,
            authToken: authToken,
            setAuthToken: setAuthToken,
          );
        }
        return const Text('You should initialize Reach Five first');
      case ReachFiveMethod.logout:
        if (reachFive != null && authToken != null) {
          return LogoutMethod(
            reachFive: reachFive,
            authToken: authToken,
            resetAuthToken: resetAuthToken,
          );
        }
        return const Text('You should login or signup first');
      case ReachFiveMethod.refreshAccessToken:
        if (reachFive != null && authToken != null) {
          return RefreshAccessTokenMethod(
            reachFive: reachFive,
            authToken: authToken,
            setAuthToken: setAuthToken,
          );
        }
        return const Text('You should login or signup first');
    }
  }
}
