import 'package:flutter/material.dart';
import 'package:foodhub/utils/responsive_page.dart';
import 'package:foodhub/auth/signup.dart';
import 'package:foodhub/auth/web/signup_web.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsivePage(
      portrait: SignUpScreen(), // your mobile/portrait version
      landscape: const SignUpScreenWeb(), // your web/landscape version
    );
  }
}
