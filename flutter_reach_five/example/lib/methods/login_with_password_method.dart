import 'package:flutter/material.dart';
import 'package:flutter_reach_five/flutter_reach_five.dart';

import '../const.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/snackbar.dart';

class LoginWithPasswordMethod extends StatefulWidget {
  const LoginWithPasswordMethod({
    required this.reachFive,
    required this.authToken,
    required this.setAuthToken,
    super.key,
  });

  final ReachFive reachFive;
  final AuthToken? authToken;
  final void Function(AuthToken authToken) setAuthToken;

  @override
  State<LoginWithPasswordMethod> createState() =>
      LoginWithPasswordMethodState();
}

class LoginWithPasswordMethodState extends State<LoginWithPasswordMethod> {
  bool areInteractionsDisabled = false;

  String email = initialEmail;
  String password = initialPassword;

  void setEmail(String newEmail) => setState(() {
        email = newEmail;
      });

  void setPassword(String newPassword) => setState(() {
        password = newPassword;
      });

  Future<void> signupToReachFive(ReachFive reachFive) async {
    setState(() {
      areInteractionsDisabled = true;
    });

    try {
      final result = await reachFive.loginWithPassword(
        email: email,
        password: password,
        scope: const [
          ScopeValue.openid,
          ScopeValue.email,
          ScopeValue.offlineAccess,
          ScopeValue.profile,
        ],
      );

      widget.setAuthToken(result);

      if (mounted) {
        showExampleSnackBar(
          context,
          message: 'Success - LoginWithPassword',
          type: SnackbarType.success,
        );
      }
    } catch (error) {
      print(error);
      if (mounted) {
        showExampleSnackBar(
          context,
          message: error.toString(),
          type: SnackbarType.error,
        );
      }
    } finally {
      setState(() {
        areInteractionsDisabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authToken = widget.authToken;
    final isButtonDisabled = areInteractionsDisabled || authToken != null;

    return ListView(
      children: [
        if (authToken == null) ...[
          CustomTextField(
            value: email,
            setValue: setEmail,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            value: password,
            setValue: setPassword,
          ),
        ] else ...[
          Text('email : $email'),
          const SizedBox(height: 16),
          Text('password : $password'),
        ],
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: !isButtonDisabled
              ? () async => signupToReachFive(widget.reachFive)
              : null,
          child: Text(
            authToken == null
                ? 'Login with your password'
                : "You're already logged in",
          ),
        ),
      ],
    );
  }
}
