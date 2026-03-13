import 'package:flutter/material.dart';
import 'package:foodhub/views/customer/customer_navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return CustomerNavBar();
        } else {
          // return const AdminHomeScreen();
           return const CustomerNavBar();
        }
      },
    );
  }
}
