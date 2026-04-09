import 'package:flutter/material.dart';

import 'primary_button.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(label: label, onPressed: onPressed, icon: icon);
  }
}
