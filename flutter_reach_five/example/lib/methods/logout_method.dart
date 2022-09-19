import 'package:flutter/material.dart';
import 'package:flutter_reach_five/flutter_reach_five.dart';

import '../widgets/snackbar.dart';

class LogoutMethod extends StatefulWidget {
  const LogoutMethod({
    required this.reachFive,
    required this.resetAuthToken,
    super.key,
  });

  final ReachFive reachFive;
  final void Function() resetAuthToken;

  @override
  State<LogoutMethod> createState() => LogoutMethodState();
}

class LogoutMethodState extends State<LogoutMethod> {
  bool areInteractionsDisabled = false;

  Future<void> logout(
    ReachFive reachFive,
  ) async {
    setState(() {
      areInteractionsDisabled = true;
    });

    try {
      await reachFive.logout();
      widget.resetAuthToken();
      if (mounted) {
        showExampleSnackBar(
          context,
          message: 'Success - Logout',
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
    return ListView(
      children: [
        ElevatedButton(
          onPressed: !areInteractionsDisabled
              ? () async => logout(widget.reachFive)
              : null,
          child: const Text('Logout'),
        ),
      ],
    );
  }
}
