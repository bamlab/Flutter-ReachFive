import 'package:flutter/material.dart';
import 'package:flutter_reach_five/flutter_reach_five.dart';

import '../const.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/snackbar.dart';

class RequestPasswordResetMethod extends StatefulWidget {
  const RequestPasswordResetMethod({
    required this.dataSet,
    required this.reachFive,
    super.key,
  });

  final DataSet dataSet;
  final ReachFive reachFive;

  @override
  State<RequestPasswordResetMethod> createState() =>
      RequestPasswordResetMethodState();
}

class RequestPasswordResetMethodState
    extends State<RequestPasswordResetMethod> {
  bool areInteractionsDisabled = false;

  late String email = widget.dataSet.initialEmail;

  void setEmail(String newEmail) => setState(() {
        email = newEmail;
      });

  Future<void> requestPasswordReset(ReachFive reachFive) async {
    setState(() {
      areInteractionsDisabled = true;
    });

    try {
      await reachFive.requestPasswordReset(
        email: email,
        redirectUrl: widget.dataSet.initialRedirectUrl,
      );

      if (mounted) {
        showExampleSnackBar(
          context,
          message: 'Success - RequestPasswordReset - ${widget.dataSet.name}',
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
    final isButtonDisabled = areInteractionsDisabled;

    return ListView(
      children: [
        if (!areInteractionsDisabled)
          CustomTextField(
            value: email,
            hintText: 'email',
            setValue: setEmail,
          )
        else
          Text('email : $email'),
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
