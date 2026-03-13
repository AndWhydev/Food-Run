import 'package:flutter/material.dart';
import 'package:foodhub/views/customer/customer_navbar.dart';
import 'package:foodhub/views/customer/home/widgets/customer_home_mob.dart';
import 'package:foodhub/views/customer/web/customer_home_web.dart';

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
