import 'package:flutter/material.dart';

class ConfigButton extends StatelessWidget {
  const ConfigButton({
    required this.isDisabled,
    required this.setConfig,
    required this.label,
    super.key,
  });

  final bool isDisabled;
  final void Function() setConfig;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: !isDisabled ? setConfig : null,
      child: Text(label),
    );
  }
}
