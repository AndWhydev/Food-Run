import 'package:flutter/material.dart';
import 'package:foodhub/auth/layout%20decider/home_page.dart';
import 'package:foodhub/auth/providers/auth_provider.dart';
import 'package:foodhub/widgets/custom_textformfield.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreenWeb extends StatelessWidget {
  const LoginScreenWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
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
                          width: constraints.maxWidth * 0.3,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          textAlign: TextAlign.center,
                          "🍕 Fresh, Hot & Delicious",
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Your favorite meals delivered\nstraight to your doorstep",
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

                /// RIGHT SIDE (Login form in card)
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

  /// Login Form
  Widget _buildForm(BuildContext context) {
    final emailController = TextEditingController();
    final passController = TextEditingController();
    final authProvider = Provider.of<AuthProvider>(context);
    return Consumer<AuthProvider>(
      builder: (context, provider, child) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome Back 👋",
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            "Login to continue your food journey",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),

          /// Email
          CustomTextformfield(
            prefixIcon: const Icon(Icons.email),
            hintText: "Enter your email",
            controller: emailController,
          ),

          /// Password
          CustomTextformfield(
            prefixIcon: const Icon(Icons.lock_open),
            hintText: "Enter your password",
            controller: passController,
            obscureText: true,
          ),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                context.go('/forget');
              },
              child: Text(
                "Forgot Password?",
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),

          /// Login Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: authProvider.isLoading
                ? null
                : () => authProvider.login(
                    email: emailController.text,
                    password: passController.text.trim(),
                    context: context,
                  ),
            child: authProvider.isLoading
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.deepOrange,
                    ),
                  )
                : Text(
                    "Login",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),

          const SizedBox(height: 20),

          /// Divider with text
          // Row(
          //   children: [
          //     const Expanded(child: Divider(color: Colors.white70)),
          //     Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 12),
          //       child: Text(
          //         "or sign in with",
          //         style: GoogleFonts.poppins(color: Colors.white),
          //       ),
          //     ),
          //     const Expanded(child: Divider(color: Colors.white70)),
          //   ],
          // ),
          // const SizedBox(height: 20),

          // /// Social buttons
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     _socialButton('assets/icons/google.png'),
          //     // const SizedBox(width: 20),
          //     // _socialButton('assets/icons/apple.png'),
          //   ],
          // ),
          // const SizedBox(height: 20),

          /// Sign up row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              GestureDetector(
                onTap: () {
                  context.go('/signup');
                },
                child: Text(
                  "Sign up",
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
      ),
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
