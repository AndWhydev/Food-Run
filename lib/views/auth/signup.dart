import 'package:flutter/material.dart';
import 'package:foodhub/views/auth/layout%20decider/login_page.dart';
import 'package:foodhub/views/auth/login.dart';
import 'package:foodhub/views/auth/web/login_web.dart';
import 'package:foodhub/widgets/custom_textformfield.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _topRightAnim;
  late Animation<Offset> _bottomLeftAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _topRightAnim = Tween<Offset>(
      begin: const Offset(1.2, -1.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _bottomLeftAnim = Tween<Offset>(
      begin: const Offset(-1.2, 1.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/images/piza.png'), context);
    precacheImage(AssetImage('assets/images/piza1.png'), context);
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      resizeToAvoidBottomInset:
          false, // 🚀 Prevents screen from resizing when keyboard opens
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            /// Top Right Circle
            Positioned(
              top: -height * 0.15,
              right: -width * 0.2,
              child: SlideTransition(
                position: _topRightAnim,
                child: Container(
                  width: width * 0.8,
                  height: height * 0.4,
                  decoration: const BoxDecoration(
                    color: Colors.deepOrange,
                    shape: BoxShape.circle,
                  ),
                  child: const Image(
                    image: AssetImage('assets/images/piza.png'),
                  ),
                ),
              ),
            ),

            /// Bottom Left Circle
            Positioned(
              bottom: -height * 0.15,
              left: -width * 0.2,
              child: SlideTransition(
                position: _bottomLeftAnim,
                child: Container(
                  width: width * 0.8,
                  height: height * 0.4,
                  decoration: const BoxDecoration(
                    color: Colors.deepOrange,
                    shape: BoxShape.circle,
                  ),
                  child: const Image(
                    image: AssetImage('assets/images/piza1.png'),
                  ),
                ),
              ),
            ),

            /// Content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.1),
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange.shade700,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Name
                  /// Email
                  CustomTextformfield(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Enter your Name",
                    controller: TextEditingController(),
                  ),

                  /// Email
                  CustomTextformfield(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Enter your email",
                    controller: TextEditingController(),
                  ),

                  /// Password
                  CustomTextformfield(
                    prefixIcon: Icon(Icons.lock_open),
                    hintText: "Enter your password",
                    controller: TextEditingController(),
                    obscureText: true,
                  ),
                  SizedBox(height: height * 0.01),

                  /// Signup button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.symmetric(vertical: height * 0.018),
                        elevation: 4,
                      ),
                      onPressed: () {},
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.03),

                  /// Divider with text
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(color: Colors.grey, thickness: 1),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                        child: Text(
                          "or continue with",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Divider(color: Colors.grey, thickness: 1),
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.02),

                  /// Social login buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialButton('assets/icons/google.png'),
                      const SizedBox(width: 20),
                      _socialButton('assets/icons/apple.png'),
                    ],
                  ),

                  SizedBox(height: height * 0.02),

                  /// Signup Row
                  Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.6,
                      top: height * 0.03,
                    ),
                    child: Wrap(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(LoginPage());
                          },
                          child: Text(
                            "Sign in",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange.shade700,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.deepOrange,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Social Button
  Widget _socialButton(String assetPath) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset(assetPath, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
