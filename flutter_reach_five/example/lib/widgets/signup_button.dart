import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({
    required this.isDisabled,
    required this.setAuthToken,
    required this.label,
    super.key,
  });

  final bool isDisabled;
  final void Function() setAuthToken;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: !isDisabled ? setAuthToken : null,
      child: Text(label),
    );
  }
}
