import 'package:flutter/material.dart';

class ResponsiveCustomerHomeLayout extends StatefulWidget {
  final Widget mobilView;
  final Widget webView;
  const ResponsiveCustomerHomeLayout({
    super.key,
    required this.mobilView,
    required this.webView,
  });

  @override
  State<ResponsiveCustomerHomeLayout> createState() =>
      _ResponsiveCustomerHomeLayoutState();
}

class _ResponsiveCustomerHomeLayoutState
    extends State<ResponsiveCustomerHomeLayout>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        print(constraints.maxWidth);
        if (constraints.maxWidth < 550) {
          return widget.mobilView;
        } else {
          return widget.webView;
        }
      },
    );
  }
}
