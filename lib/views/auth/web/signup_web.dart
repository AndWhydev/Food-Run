import 'package:flutter/material.dart';
import 'package:foodhub/views/auth/layout%20decider/login_page.dart';
import 'package:foodhub/views/auth/login.dart';
import 'package:foodhub/views/auth/signup.dart';
import 'package:foodhub/views/auth/web/login_web.dart';
import 'package:foodhub/views/customer/customer_navbar.dart';
import 'package:foodhub/widgets/custom_textformfield.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreenWeb extends StatelessWidget {
  const SignUpScreenWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWeb = constraints.maxWidth > 600;

          if (!isWeb) {
            return SignUpScreen();
          }

          return SingleChildScrollView(
            child: Row(
              children: [
                /// LEFT SIDE (Food image + tagline)
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/piza.png',
                          fit: BoxFit.contain,
                          width: constraints.maxWidth * 0.4,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          textAlign: TextAlign.center,
                          "🍔 Taste the Best, Every Bite!",
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Join FoodHub today & explore\nfresh meals anytime, anywhere",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[700],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),

                /// RIGHT SIDE (Signup form in card)
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Center(
                      child: Card(
                        color: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(36.0),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 420),
                            child: _buildForm(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  /// Signup Form
  Widget _buildForm(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Create Account ✨",
          style: GoogleFonts.poppins(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Text(
          "Sign up to start your food adventure",
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white70,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),

        /// Name
        CustomTextformfield(
          prefixIcon: const Icon(Icons.person),
          hintText: "Enter your full name",
          controller: TextEditingController(),
        ),

        /// Email
        CustomTextformfield(
          prefixIcon: const Icon(Icons.email),
          hintText: "Enter your email",
          controller: TextEditingController(),
        ),

        /// Password
        CustomTextformfield(
          prefixIcon: const Icon(Icons.lock_open),
          hintText: "Enter your password",
          controller: TextEditingController(),
          obscureText: true,
        ),

        /// Confirm Password
        CustomTextformfield(
          prefixIcon: const Icon(Icons.lock_outline),
          hintText: "Confirm your password",
          controller: TextEditingController(),
          obscureText: true,
        ),

        const SizedBox(height: 10),

        /// Signup Button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: () => Get.to(CustomerNavBar()),
          child: Text(
            "Sign Up",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 20),

        /// Divider with text
        Row(
          children: [
            const Expanded(child: Divider(color: Colors.white70)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "or sign up with",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
            const Expanded(child: Divider(color: Colors.white70)),
          ],
        ),
        const SizedBox(height: 20),

        /// Social buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _socialButton('assets/icons/google.png'),
            const SizedBox(width: 20),
            _socialButton('assets/icons/apple.png'),
          ],
        ),

        const SizedBox(height: 20),

        /// Already have account row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account? ",
              style: GoogleFonts.poppins(color: Colors.white),
            ),
            GestureDetector(
              onTap: () {
                Get.to(LoginPage());
              },
              child: Text(
                "Login",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Social Button
  Widget _socialButton(String assetPath) {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(assetPath, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
