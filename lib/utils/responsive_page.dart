import 'package:flutter/material.dart';

class ResponsivePage extends StatelessWidget {
  final Widget portrait;
  final Widget landscape;

  const ResponsivePage({
    super.key,
    required this.portrait,
    required this.landscape,
  });

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait ? portrait : landscape;
  }
}
