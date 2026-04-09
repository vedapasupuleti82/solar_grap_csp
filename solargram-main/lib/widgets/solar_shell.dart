import 'package:flutter/material.dart';

class SolarShell extends StatelessWidget {
  const SolarShell({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.fromLTRB(20, 16, 20, 24),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(padding: padding, child: child),
    );
  }
}
