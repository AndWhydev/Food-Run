import 'package:flutter/material.dart';
import 'package:foodhub/utils/responsive_page.dart';
import 'package:foodhub/views/auth/forgot_password.dart';
import 'package:foodhub/views/auth/web/forget_password_web.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsivePage(
      portrait: const ForgotPasswordScreen(), // mobile/portrait version
      landscape: const ForgotPasswordScreenWeb(), // web/landscape version
    );
  }
}
