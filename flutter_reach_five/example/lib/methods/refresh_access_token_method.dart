import 'package:flutter/material.dart';
import 'package:flutter_reach_five/flutter_reach_five.dart';

import '../widgets/snackbar.dart';

class RefreshAccessTokenMethod extends StatefulWidget {
  const RefreshAccessTokenMethod({
    required this.reachFive,
    required this.authToken,
    required this.setAuthToken,
    super.key,
  });

  final ReachFive reachFive;
  final AuthToken authToken;
  final void Function(AuthToken authToken) setAuthToken;

  @override
  State<RefreshAccessTokenMethod> createState() =>
      RefreshAccessTokenMethodState();
}

class RefreshAccessTokenMethodState extends State<RefreshAccessTokenMethod> {
  bool areInteractionsDisabled = false;

  Future<void> refreshReachFiveAuthToken(
    ReachFive reachFive,
    AuthToken authToken,
  ) async {
    setState(() {
      areInteractionsDisabled = true;
    });

    try {
      final result = await reachFive.refreshAccessToken(authToken);

      widget.setAuthToken(result);

      if (mounted) {
        showExampleSnackBar(
          context,
          message: 'Success - Refresh Access Token',
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
    final openIdUser = widget.authToken.user;
    final authToken = widget.authToken;

    return ListView(
      children: [
        Text('accessToken : ${authToken.accessToken}'),
        const SizedBox(height: 16),
        Text('expiresIn : ${authToken.expiresIn}'),
        const SizedBox(height: 16),
        Text('idToken : ${authToken.idToken}'),
        const SizedBox(height: 16),
        Text('refreshToken : ${authToken.refreshToken}'),
        const SizedBox(height: 16),
        Text('tokenType : ${authToken.tokenType}'),
        const SizedBox(height: 32),
        if (openIdUser != null) ...[
          Text('name : ${openIdUser.name}'),
          const SizedBox(height: 16),
          Text('familyName : ${openIdUser.familyName}'),
          const SizedBox(height: 16),
          Text('givenName : ${openIdUser.givenName}'),
          const SizedBox(height: 16),
          Text('middleName : ${openIdUser.middleName}'),
          const SizedBox(height: 16),
          Text('nickname : ${openIdUser.nickname}'),
          const SizedBox(height: 16),
          Text('email : ${openIdUser.email}'),
          const SizedBox(height: 16),
          Text('emailVerified : ${openIdUser.emailVerified}'),
        ],
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () async =>
              refreshReachFiveAuthToken(widget.reachFive, widget.authToken),
          child: const Text('Refresh your access token'),
        ),
      ],
    );
  }
}
