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
  late String androidScheme = widget.dataSet.initialAndroidScheme;
  late String iosScheme = widget.dataSet.initialIosScheme;

  late List<ProviderCreator> selectedProviderCreators = [
    ProviderCreator.webview
  ];

  void setDomain(String newDomain) => setState(() {
        domain = newDomain;
      });

  void setClientId(String newClientId) => setState(() {
        clientId = newClientId;
      });

  void setAndroidScheme(String newAndroidScheme) => setState(() {
        androidScheme = newAndroidScheme;
      });

  void setIosScheme(String newIosScheme) => setState(() {
        iosScheme = newIosScheme;
      });

  void toggleProviderCreator(ProviderCreator providerCreator) => setState(() {
        if (selectedProviderCreators.contains(providerCreator)) {
          selectedProviderCreators.remove(providerCreator);
        } else {
          selectedProviderCreators.add(providerCreator);
        }
      });

  Future<void> initializeReachFive() async {
    setState(() {
      areInteractionsDisabled = true;
    });

    try {
      final result = await ReachFiveManager.initialize(
        sdkConfig: SdkConfig(
          domain: domain,
          clientId: clientId,
          androidScheme: androidScheme,
          iosScheme: iosScheme,
        ),
        providerCreators: selectedProviderCreators,
      );

      widget.setReachFive(result);

      if (mounted) {
        showExampleSnackBar(
          context,
          message: 'Success - Initialization - ${widget.dataSet.name}',
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
    final reachFive = widget.reachFive;
    final isButtonDisabled = areInteractionsDisabled || reachFive != null;

    return ListView(
      children: [
        if (reachFive == null) ...[
          CustomTextField(
            value: domain,
            hintText: 'domain',
            setValue: setDomain,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            value: clientId,
            hintText: 'clientId',
            setValue: setClientId,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            value: androidScheme,
            hintText: 'androidScheme',
            setValue: setAndroidScheme,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            value: iosScheme,
            hintText: 'iosScheme',
            setValue: setIosScheme,
          ),
          const SizedBox(height: 16),
          ...ProviderCreator.values.map(
            (providerCreator) => Padding(
              padding: const EdgeInsets.all(16),
              child: SwitchListTile(
                title: Text(providerCreator.name),
                value: selectedProviderCreators.contains(providerCreator),
                onChanged: (_) => toggleProviderCreator(providerCreator),
              ),
            ),
          ),
        ] else ...[
          Text('domain :${reachFive.reachFiveKey.sdkConfig.domain}'),
          const SizedBox(height: 16),
          Text('clientId :${reachFive.reachFiveKey.sdkConfig.clientId}'),
          const SizedBox(height: 16),
          Text(
            'androidScheme :${reachFive.reachFiveKey.sdkConfig.androidScheme}',
          ),
          const SizedBox(height: 16),
          Text('iosScheme :${reachFive.reachFiveKey.sdkConfig.iosScheme}'),
          const SizedBox(height: 16),
          Text(
            'providers :${reachFive.providers.fold('', (previousValue, element) => '$previousValue ${element.name}')}',
          ),
        ],
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: !isButtonDisabled ? initializeReachFive : null,
          child: Text(
            reachFive == null
                ? 'Get Reach Five Config'
                : 'Reach Five is already initialized',
          ),
        ),
      ],
    );
  }
}
