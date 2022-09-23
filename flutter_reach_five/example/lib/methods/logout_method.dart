import 'package:flutter/material.dart';
import 'package:flutter_reach_five/flutter_reach_five.dart';

import '../const.dart';
import '../widgets/snackbar.dart';

class LogoutMethod extends StatefulWidget {
  const LogoutMethod({
    required this.dataSet,
    required this.reachFive,
    required this.authToken,
    required this.resetAuthToken,
    super.key,
  });

  final DataSet dataSet;
  final ReachFive reachFive;
  final AuthToken authToken;
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
      await reachFive.logout(
        authToken: widget.authToken,
      );
      widget.resetAuthToken();
      if (mounted) {
        showExampleSnackBar(
          context,
          message: 'Success - Logout - ${widget.dataSet.name}',
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
