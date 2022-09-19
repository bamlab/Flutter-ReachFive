import 'package:flutter/material.dart';
import 'package:flutter_reach_five/flutter_reach_five.dart';

import '../const.dart';
import '../widgets/config_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/snackbar.dart';

class InitializeMethod extends StatefulWidget {
  const InitializeMethod({
    required this.reachFive,
    required this.setReachFive,
    super.key,
  });

  final ReachFive? reachFive;
  final void Function(ReachFive reachFive) setReachFive;

  @override
  State<InitializeMethod> createState() => _InitializeMethodState();
}

class _InitializeMethodState extends State<InitializeMethod> {
  bool areInteractionsDisabled = false;

  String domain = initialDomain;
  String clientId = initialClientId;
  String scheme = initialScheme;

  void setDomain(String newDomain) => setState(() {
        domain = newDomain;
      });

  void setClientId(String newClientId) => setState(() {
        clientId = newClientId;
      });

  void setScheme(String newScheme) => setState(() {
        scheme = newScheme;
      });

  Future<void> initializeReachFive() async {
    setState(() {
      areInteractionsDisabled = true;
    });

    try {
      final result = await ReachFiveManager.initialize(
        ReachFiveConfig(
          domain: domain,
          clientId: clientId,
          scheme: scheme,
        ),
      );

      widget.setReachFive(result);

      if (mounted) {
        showExampleSnackBar(
          context,
          message: 'Success - Initialization',
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
        if (widget.reachFive == null) ...[
          CustomTextField(
            value: domain,
            setValue: setDomain,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            value: clientId,
            setValue: setClientId,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            value: scheme,
            setValue: setScheme,
          ),
        ] else ...[
          Text('domain :$domain'),
          const SizedBox(height: 16),
          Text('clientId :$clientId'),
          const SizedBox(height: 16),
          Text('scheme :$scheme'),
        ],
        const SizedBox(height: 32),
        ConfigButton(
          isDisabled: areInteractionsDisabled || widget.reachFive != null,
          setConfig: initializeReachFive,
          label: widget.reachFive == null
              ? 'Get Reach Five Config'
              : 'Here is your Reach Five Config',
        ),
      ],
    );
  }
}
