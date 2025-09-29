import 'package:flutter/material.dart';
import 'package:foodhub/views/auth/login.dart';
import 'package:foodhub/views/auth/signup.dart';
import 'package:foodhub/views/auth/web/login_web.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/images/onboard.jpg"), context);
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/onboard.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            /// Title near the top
            // Positioned(
            //   top: height * 0.1,
            //   left: 0,
            //   right: 0,
            //   child: Text(
            //     "FoodHub",
            //     textAlign: TextAlign.center,
            //     style: GoogleFonts.aDLaMDisplay(
            //       color: Colors.white,
            //       decoration: TextDecoration.none,
            //       fontSize: 40,
            //       fontWeight: FontWeight.bold,
            //       shadows: [
            //         Shadow(
            //           blurRadius: 8,
            //           color: Colors.black.withOpacity(0.6),
            //           offset: const Offset(2, 2),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            /// Bottom curved gradient container
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: width,
                height: height * 0.6,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black54,
                      Colors.grey.shade700,
                      Colors.grey.shade200,
                      Colors.white,
                    ],
                    stops: const [0.0, 0.35, 0.55, 0.8, 1.0],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.08,
                    vertical: height * 0.04,
                  ),
                  child: Column(
                    children: [
                      const Spacer(), // pushes button lower
                      /// Get Started Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: height * 0.02,
                            ),
                            elevation: 6,
                          ),
                          onPressed: () {
                            // Get.offAll(LoginScreen());
                            Get.to(
                              OrientationBuilder(
                                builder: (context, orientation) =>
                                    orientation == Orientation.portrait
                                    ? LoginScreen()
                                    : LoginScreenWeb(),
                              ),
                            );
                          },
                          child: Text(
                            "Get Started",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      /// Divider with text
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(color: Colors.white70, thickness: 1),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.04,
                            ),
                            child: Text(
                              "or sign in with",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Divider(color: Colors.white70, thickness: 1),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      /// Social Buttons with Asset Images
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _socialButton("assets/icons/google.png"),
                          const SizedBox(width: 20),
                          _socialButton("assets/icons/apple.png"),
                        ],
                      ),

                      const SizedBox(height: 20),

                      /// Signup Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(SignUpScreen());
                            },
                            child: Text(
                              "Sign up",
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.deepOrange,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Reusable Social Button with Asset Image
  Widget _socialButton(String assetPath) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: () {
          // Handle social login
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(assetPath, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
