import 'package:flutter/material.dart';
import 'package:foodhub/utils/responsive_page.dart';
import 'package:foodhub/auth/login.dart';
import 'package:foodhub/auth/web/login_web.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsivePage(
      portrait: const LoginScreen(), // mobile/portrait version
      landscape: const LoginScreenWeb(), // web/landscape version
    );
  }
}
