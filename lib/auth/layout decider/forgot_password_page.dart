import 'package:flutter/material.dart';
import 'package:foodhub/utils/responsive_page.dart';
import 'package:foodhub/auth/forgot_password.dart';
import 'package:foodhub/auth/web/forget_password_web.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsivePage(
      portrait: ForgotPasswordScreen(), // mobile/portrait version
      landscape: const ForgotPasswordScreenWeb(), // web/landscape version
    );
  }
}
