import 'package:flutter/material.dart';
import 'package:flutter_reach_five/flutter_reach_five.dart';

import '../const.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/snackbar.dart';

class UpdatePasswordMethod extends StatefulWidget {
  const UpdatePasswordMethod({
    required this.dataSet,
    required this.reachFive,
    super.key,
  });

  final DataSet dataSet;
  final ReachFive reachFive;

  @override
  State<UpdatePasswordMethod> createState() => UpdatePasswordMethodState();
}

class UpdatePasswordMethodState extends State<UpdatePasswordMethod> {
  bool areInteractionsDisabled = false;

  String verificationCode = '';
  String newPassword = '';

  void setVerificationCode(String newVerificationCode) => setState(() {
        verificationCode = newVerificationCode;
      });

  void setNewPassword(String newNewPassword) => setState(() {
        newPassword = newNewPassword;
      });

  Future<void> requestPasswordReset(ReachFive reachFive) async {
    setState(() {
      areInteractionsDisabled = true;
    });

    try {
      await reachFive.updatePassword(
        UpdatePasswordRequest.withEmail(
          email: widget.dataSet.initialEmail,
          verificationCode: verificationCode,
          newPassword: newPassword,
        ),
      );

      if (mounted) {
        showExampleSnackBar(
          context,
          message: 'Success - UpdatePassword - ${widget.dataSet.name}',
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
    final isButtonDisabled = areInteractionsDisabled;

    return ListView(
      children: [
        CustomTextField(
          value: verificationCode,
          hintText: 'verificationCode',
          setValue: setVerificationCode,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          value: newPassword,
          hintText: 'newPassword',
          setValue: setNewPassword,
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: !isButtonDisabled
              ? () async => requestPasswordReset(widget.reachFive)
              : null,
          child: const Text('Reset your password'),
        ),
      ],
    );
  }
}
