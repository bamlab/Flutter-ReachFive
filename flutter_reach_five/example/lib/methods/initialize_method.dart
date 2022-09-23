import 'package:flutter/material.dart';
import 'package:flutter_reach_five/flutter_reach_five.dart';

import '../const.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/snackbar.dart';

class InitializeMethod extends StatefulWidget {
  const InitializeMethod({
    required this.dataSet,
    required this.reachFive,
    required this.setReachFive,
    super.key,
  });

  final DataSet dataSet;
  final ReachFive? reachFive;
  final void Function(ReachFive reachFive) setReachFive;

  @override
  State<InitializeMethod> createState() => _InitializeMethodState();
}

class _InitializeMethodState extends State<InitializeMethod> {
  bool areInteractionsDisabled = false;

  late String domain = widget.dataSet.initialDomain;
  late String clientId = widget.dataSet.initialClientId;
  late String scheme = widget.dataSet.initialScheme;

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
        config: ReachFiveConfig(
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
    final isButtonDisabled =
        areInteractionsDisabled || widget.reachFive != null;

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
        ElevatedButton(
          onPressed: !isButtonDisabled ? initializeReachFive : null,
          child: Text(
            widget.reachFive == null
                ? 'Get Reach Five Config'
                : 'Reach Five is already initialized',
          ),
        ),
      ],
    );
  }
}
