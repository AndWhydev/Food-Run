// import 'package:flutter/material.dart';
// import 'package:foodhub/widgets/custom_textformfield.dart';
// import 'package:google_fonts/google_fonts.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     precacheImage(AssetImage("assets/images/onboard.jpg"), context);
//     final size = MediaQuery.of(context).size;
//     final width = size.width;
//     final height = size.height;

//     return Scaffold(
//       body: Container(
//         width: width,
//         height: height,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/images/onboard.jpg"), // dark background
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Stack(
//           children: [
//             /// Title + Food Image
//             Positioned(
//               top: height * 0.08,
//               left: 0,
//               right: 0,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: width * 0.08),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "FoodHub",
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.aDLaMDisplay(
//                         color: Colors.white,
//                         fontSize: 40,
//                         fontWeight: FontWeight.bold,
//                         shadows: [
//                           Shadow(
//                             blurRadius: 8,
//                             color: Colors.black.withOpacity(0.6),
//                             offset: const Offset(2, 2),
//                           ),
//                         ],
//                       ),
//                     ),
//                     // Your Next Meal, Just a Tap Away
//                     Text(
//                       "Your Next Meal, Just a Tap Away",
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.aDLaMDisplay(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         shadows: [
//                           Shadow(
//                             blurRadius: 8,
//                             color: Colors.black.withOpacity(0.6),
//                             offset: const Offset(2, 2),
//                           ),
//                         ],
//                       ),
//                     ),

//                     Image.asset("assets/images/food1.png"),
//                   ],
//                 ),
//               ),
//             ),

//             /// Bottom curved gradient container with login form
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 width: width,
//                 height: height * 0.7,
//                 decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(32),
//                     topRight: Radius.circular(32),
//                   ),
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Colors.transparent,
//                       Colors.black54,
//                       Colors.grey.shade700,
//                       Colors.grey.shade900,
//                       Colors.black87,
//                     ],
//                     stops: const [0.0, 0.3, 0.6, 0.85, 1.0],
//                   ),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: width * 0.08,
//                     vertical: height * 0.04,
//                   ),
//                   child: Column(
//                     children: [
//                       // const Spacer(),
//                       Padding(
//                         padding: EdgeInsets.only(bottom: height * 0.02),
//                         child: Row(
//                           children: [
//                             Text(
//                               "Login",
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.aDLaMDisplay(
//                                 color: Colors.white,
//                                 fontSize: 30,
//                                 fontWeight: FontWeight.bold,
//                                 shadows: [
//                                   Shadow(
//                                     blurRadius: 8,
//                                     color: Colors.black.withOpacity(0.6),
//                                     offset: const Offset(2, 2),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),

//                       /// Login Fields
//                       CustomTextFormField(
//                         label: "Email",
//                         hint: "Enter email",
//                         controller: TextEditingController(),
//                       ),
//                       const SizedBox(height: 20),
//                       CustomTextFormField(
//                         label: "Password",
//                         hint: "Enter password",
//                         controller: TextEditingController(),

//                         obscureText: true,
//                       ),

//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           TextButton(
//                             onPressed: () {},
//                             child: Text("Forget Password"),
//                           ),
//                         ],
//                       ),

//                       /// Login button
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.deepOrange,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             padding: EdgeInsets.symmetric(
//                               vertical: height * 0.018,
//                             ),
//                             elevation: 6,
//                           ),
//                           onPressed: () {},
//                           child: Text(
//                             "Login",
//                             style: GoogleFonts.poppins(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),

//                       const SizedBox(height: 24),

//                       /// Divider with text
//                       Row(
//                         children: [
//                           const Expanded(
//                             child: Divider(color: Colors.white70, thickness: 1),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: width * 0.04,
//                             ),
//                             child: Text(
//                               "or sigin with",
//                               style: GoogleFonts.poppins(
//                                 fontSize: 14,
//                                 color: Colors.white70,
//                               ),
//                             ),
//                           ),

//                           const Expanded(
//                             child: Divider(color: Colors.white70, thickness: 1),
//                           ),
//                         ],
//                       ),

//                       const SizedBox(height: 16),

//                       /// Social login buttons
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           _socialButton("assets/icons/google.png"),
//                           const SizedBox(width: 20),
//                           _socialButton("assets/icons/facebook.png"),
//                         ],
//                       ),

//                       const SizedBox(height: 20),
//                       Spacer(),

//                       /// Signup Row
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Don't have an account? ",
//                             style: GoogleFonts.poppins(
//                               fontSize: 13,
//                               color: Colors.white70,
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {},
//                             child: Text(
//                               "Sign up",
//                               style: GoogleFonts.poppins(
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.deepOrange,
//                                 decoration: TextDecoration.underline,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// Social Button
//   Widget _socialButton(String assetPath) {
//     return Container(
//       width: 50,
//       height: 50,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: Colors.grey.shade800,
//         boxShadow: [
//           BoxShadow(
//             blurRadius: 6,
//             color: Colors.black45,
//             offset: const Offset(2, 2),
//           ),
//         ],
//       ),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(25),
//         onTap: () {},
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Image.asset(assetPath, fit: BoxFit.contain),
//         ),
//       ),
//     );
//   }
// }

// 2
// import 'package:flutter/material.dart';
// import 'package:foodhub/widgets/custom_textformfield.dart';
// import 'package:google_fonts/google_fonts.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _topRightAnim;
//   late Animation<Offset> _bottomLeftAnim;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     );

//     _topRightAnim = Tween<Offset>(
//       begin: const Offset(1.2, -1.2), // from top right outside
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

//     _bottomLeftAnim = Tween<Offset>(
//       begin: const Offset(-1.2, 1.2), // from bottom left outside
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

//     _controller.forward(); // play once
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final width = size.width;
//     final height = size.height;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Stack(
//           clipBehavior: Clip.none,
//           children: [
//             /// Top Right Circle (animated)
//             Positioned(
//               top: -height * 0.1,
//               right: -width * 0.2,
//               child: SlideTransition(
//                 position: _topRightAnim,
//                 child: Container(
//                   width: width * 0.8,
//                   height: height * 0.4,
//                   decoration: const BoxDecoration(
//                     color: Colors.deepOrange,
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Image(
//                     image: AssetImage('assets/images/piza.png'),
//                   ),
//                 ),
//               ),
//             ),

//             /// Bottom Left Circle (animated)
//             Positioned(
//               bottom: -height * 0.1,
//               left: -width * 0.2,
//               child: SlideTransition(
//                 position: _bottomLeftAnim,
//                 child: Container(
//                   width: width * 0.8,
//                   height: height * 0.4,
//                   decoration: const BoxDecoration(
//                     color: Colors.deepOrange,
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Image(
//                     image: AssetImage('assets/images/piza.png'),
//                   ),
//                 ),
//               ),
//             ),

//             /// Scrollable Login Content
//             SingleChildScrollView(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: width * 0.08),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: height * 0.25),

//                     /// Email
//                     CustomTextformfield(
//                       hintText: "Enter your email",
//                       controller: TextEditingController(),
//                     ),
//                     const SizedBox(height: 24),

//                     /// Password
//                     CustomTextformfield(
//                       hintText: "Enter your password",
//                       controller: TextEditingController(),
//                       obscureText: true,
//                     ),

//                     /// Forgot Password
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         TextButton(
//                           onPressed: () {},
//                           child: Text(
//                             "Forgot Password?",
//                             style: GoogleFonts.poppins(
//                               color: Colors.deepOrange,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 30),

//                     /// Login button
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.deepOrange,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           padding: EdgeInsets.symmetric(
//                             vertical: height * 0.015,
//                           ),
//                           elevation: 3,
//                         ),
//                         onPressed: () {},
//                         child: Text(
//                           "Login",
//                           style: GoogleFonts.poppins(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 40),

//                     /// Divider with text
//                     Row(
//                       children: [
//                         const Expanded(
//                           child: Divider(color: Colors.grey, thickness: 1),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: width * 0.04,
//                           ),
//                           child: Text(
//                             "or sign in with",
//                             style: GoogleFonts.poppins(
//                               fontSize: 14,
//                               color: Colors.grey.shade600,
//                             ),
//                           ),
//                         ),
//                         const Expanded(
//                           child: Divider(color: Colors.grey, thickness: 1),
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 30),

//                     /// Social login buttons
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         _socialButton('assets/icons/google.png'),
//                         const SizedBox(width: 20),
//                         _socialButton('assets/icons/facebook.png'),
//                       ],
//                     ),

//                     SizedBox(height: height * 0.08),

//                     /// Signup Row
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Don't have an account? ",
//                           style: GoogleFonts.poppins(
//                             fontSize: 15,
//                             color: Colors.grey.shade600,
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {},
//                           child: Text(
//                             "Sign up",
//                             style: GoogleFonts.poppins(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.deepOrange,
//                               decoration: TextDecoration.underline,
//                               decorationColor: Colors.deepOrange,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 30),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// Social Button
//   Widget _socialButton(String assetPath) {
//     return Container(
//       width: 50,
//       height: 50,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             blurRadius: 6,
//             color: Colors.black.withOpacity(0.2),
//             offset: const Offset(2, 2),
//           ),
//         ],
//       ),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(25),
//         onTap: () {},
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Image.asset(assetPath, fit: BoxFit.contain),
//         ),
//       ),
//     );
//   }
// }

// 2
import 'package:flutter/material.dart';
import 'package:foodhub/views/auth/forgot_password.dart';
import 'package:foodhub/views/auth/layout%20decider/forgot_password_page.dart';
import 'package:foodhub/views/auth/layout%20decider/home_page.dart';
import 'package:foodhub/views/auth/layout%20decider/signup_page.dart';
import 'package:foodhub/views/auth/signup.dart';
import 'package:foodhub/views/auth/web/forget_password_web.dart';
import 'package:foodhub/views/auth/web/signup_web.dart';
import 'package:foodhub/views/customer/customer_navbar.dart';
import 'package:foodhub/views/customer/web/customer_home_web.dart';
import 'package:foodhub/widgets/custom_textformfield.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
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
                      "Sign In",
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange.shade700,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

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

                  /// Forgot Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                         Get.to(ForgotPasswordPage());
                        },
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.poppins(
                            color: Colors.deepOrange.shade600,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// Login button
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

                      onPressed: () {
                      Get.to(HomePage());
                      },
                      child: Text(
                        "Login",
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
                          "or sign in with",
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

                  SizedBox(height: height * 0.04),

                  /// Social login buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialButton('assets/icons/google.png'),
                      const SizedBox(width: 20),
                      _socialButton('assets/icons/apple.png'),
                    ],
                  ),

                  SizedBox(height: height * 0.03),

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
                          "Don't have an account? ",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        GestureDetector(
                      onTap: () {
                        Get.to(SignUpPage());
                      },
                          child: Text(
                            "Sign up",
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
