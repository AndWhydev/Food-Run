import 'package:flutter/material.dart';

import 'package:foodhub/utils/theme.dart';
import 'package:foodhub/views/onboarding/onboarding.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: "FoodHub",
      theme: AppTheme.lightTheme,
      home: Onboarding(),
    );
  }
}
