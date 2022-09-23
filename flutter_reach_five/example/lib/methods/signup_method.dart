import 'package:flutter/material.dart';
import 'package:flutter_reach_five/flutter_reach_five.dart';

import '../const.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/snackbar.dart';

class SignupMethod extends StatefulWidget {
  const SignupMethod({
    required this.dataSet,
    required this.reachFive,
    required this.authToken,
    required this.setAuthToken,
    super.key,
  });

  final DataSet dataSet;
  final ReachFive reachFive;
  final AuthToken? authToken;
  final void Function(AuthToken authToken) setAuthToken;

  @override
  State<SignupMethod> createState() => SignupMethodState();
}

class SignupMethodState extends State<SignupMethod> {
  bool areInteractionsDisabled = false;

  late String email = widget.dataSet.initialEmail;
  late String password = widget.dataSet.initialPassword;
  late String familyName = widget.dataSet.initialFamilyName;
  late String givenName = widget.dataSet.initialGivenName;
  late String middleName = widget.dataSet.initialMiddleName;
  late String nickname = widget.dataSet.initialNickame;

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
      );

      widget.setAuthToken(result);

      if (mounted) {
        showExampleSnackBar(
          context,
          message: 'Success - Signup - ${widget.dataSet.name}',
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
        ElevatedButton(
          onPressed: !isButtonDisabled
              ? () async => signupToReachFive(widget.reachFive)
              : null,
          child:
              Text(authToken == null ? 'Sign up' : "You're already signed in"),
        ),
      ],
    );
  }
}
