import 'package:flutter/material.dart';
import 'package:flutter_reach_five/flutter_reach_five.dart';

import '../const.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/signup_button.dart';
import '../widgets/snackbar.dart';

class SignupMethod extends StatefulWidget {
  const SignupMethod({
    required this.reachFive,
    required this.authToken,
    required this.setAuthToken,
    super.key,
  });

  final ReachFive reachFive;
  final AuthToken? authToken;
  final void Function(AuthToken authToken) setAuthToken;

  @override
  State<SignupMethod> createState() => SignupMethodState();
}

class SignupMethodState extends State<SignupMethod> {
  bool areInteractionsDisabled = false;

  String email = initialEmail;
  String password = initialPassword;
  String familyName = initialFamilyName;
  String givenName = initialGivenName;
  String middleName = initialMiddleName;
  String nickname = initialNickame;

  void setEmail(String newEmail) => setState(() {
        email = newEmail;
      });

  void setPassword(String newPassword) => setState(() {
        password = newPassword;
      });

  void setFamilyName(String newFamilyName) => setState(() {
        familyName = newFamilyName;
      });

  void setGivenName(String newGivenName) => setState(() {
        givenName = newGivenName;
      });

  void setMiddleName(String newMiddleName) => setState(() {
        middleName = newMiddleName;
      });

  void setNickname(String newNickname) => setState(() {
        nickname = newNickname;
      });

  Future<void> signupToReachFive(ReachFive reachFive) async {
    setState(() {
      areInteractionsDisabled = true;
    });

    try {
      final result = await reachFive.signup(
        SignupRequest(
          profile: ProfileSignupRequest(
            password: password,
            email: email,
            familyName: familyName,
            givenName: givenName,
            middleName: middleName,
            nickname: nickname,
          ),
          scope: const [
            ScopeValue.openid,
            ScopeValue.email,
            ScopeValue.offlineAccess,
            ScopeValue.profile,
          ],
        ),
      );

      widget.setAuthToken(result);

      if (mounted) {
        showExampleSnackBar(
          context,
          message: 'Success - Signup',
          type: SnackbarType.success,
        );
      }
    } catch (error) {
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
          const SizedBox(height: 16),
          CustomTextField(
            value: familyName,
            setValue: setFamilyName,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            value: givenName,
            setValue: setGivenName,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            value: middleName,
            setValue: setMiddleName,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            value: nickname,
            setValue: setNickname,
          ),
        ] else ...[
          Text('email : $email'),
          const SizedBox(height: 16),
          Text('password : $password'),
          const SizedBox(height: 16),
          Text('name : $familyName'),
          const SizedBox(height: 16),
          Text('name : $givenName'),
          const SizedBox(height: 16),
          Text('name : $middleName'),
          const SizedBox(height: 16),
          Text('name : $nickname'),
        ],
        const SizedBox(height: 32),
        SignupButton(
          isDisabled: areInteractionsDisabled || authToken != null,
          setAuthToken: () async => signupToReachFive(widget.reachFive),
          label: authToken == null ? 'Sign up' : 'Here is your token',
        ),
      ],
    );
  }
}
