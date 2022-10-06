import 'package:flutter/material.dart';
import 'package:flutter_reach_five/flutter_reach_five.dart';

import '../const.dart';
import '../widgets/snackbar.dart';

class LoginWithProviderMethod extends StatefulWidget {
  const LoginWithProviderMethod({
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
  State<LoginWithProviderMethod> createState() =>
      LoginWithProviderMethodState();
}

class LoginWithProviderMethodState extends State<LoginWithProviderMethod> {
  bool areInteractionsDisabled = false;

  Future<void> loginWithProvider(
    ReachFive reachFive,
    Provider provider,
  ) async {
    setState(() {
      areInteractionsDisabled = true;
    });

    try {
      final result = await reachFive.loginWithProvider(
        provider: provider,
        origin: widget.dataSet.initialOrigin,
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
          message:
              'Success - LoginWithProvider ${provider.name} - ${widget.dataSet.name}',
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
      children: widget.reachFive.providers
          .map(
            (provider) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: !isButtonDisabled
                      ? () async =>
                          loginWithProvider(widget.reachFive, provider)
                      : null,
                  child: Text(
                    authToken == null
                        ? 'Login with ${provider.name}'
                        : "You're already logged in",
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
