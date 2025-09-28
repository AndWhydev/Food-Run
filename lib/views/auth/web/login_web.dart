// import 'package:flutter/material.dart';
// import 'package:foodhub/views/auth/forgot_password.dart';
// import 'package:foodhub/views/auth/signup.dart';
// import 'package:foodhub/views/customer/customer_navbar.dart';
// import 'package:foodhub/widgets/custom_textformfield.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// class LoginScreenWeb extends StatelessWidget {
//   const LoginScreenWeb({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.white,
//       backgroundColor: Colors.white,
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           final isWeb = constraints.maxWidth > 600;

//           if (!isWeb) {
//             // 👉 fallback to mobile view
//             return const Center(child: Text("Mobile layout here"));
//           }

//           return Row(
//             children: [
//               /// LEFT SIDE (Pizza image)
//               Expanded(
//                 flex: 1,
//                 child: Container(
//                   color: Colors.white,
//                   child: Center(
//                     child: Image.asset(
//                       'assets/images/piza.png',
//                       fit: BoxFit.contain,
//                       width: constraints.maxWidth * 0.4,
//                     ),
//                   ),
//                 ),
//               ),

//               /// RIGHT SIDE (Login form in card)
//               Expanded(
//                 flex: 1,
//                 child: Container(
//                   // color: Colors.deepOrange.shade50,
//                   child: Center(
//                     child: Card(
//                       color: Colors.deepOrange,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(24),
//                       ),
//                       elevation: 8,
//                       child: Padding(
//                         padding: const EdgeInsets.all(32.0),
//                         child: ConstrainedBox(
//                           constraints: const BoxConstraints(maxWidth: 400),
//                           child: _buildForm(context),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   /// Login Form
//   Widget _buildForm(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Text(
//           "Sign In",
//           style: GoogleFonts.poppins(
//             fontSize: 28,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         const SizedBox(height: 30),

//         /// Email
//         CustomTextformfield(
//           prefixIcon: const Icon(Icons.email, color: Colors.white),
//           hintText: "Enter your email",
//           controller: TextEditingController(),
//         ),

//         /// Password
//         CustomTextformfield(
//           prefixIcon: const Icon(Icons.lock_open, color: Colors.white),
//           hintText: "Enter your password",
//           controller: TextEditingController(),
//           obscureText: true,
//         ),

//         Align(
//           alignment: Alignment.centerRight,
//           child: TextButton(
//             onPressed: () => Get.to(const ForgotPasswordScreen()),
//             child: Text(
//               "Forgot Password?",
//               style: GoogleFonts.poppins(
//                 color: Colors.white70,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ),

//         /// Login Button
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.white,
//             foregroundColor: Colors.deepOrange,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16),
//             ),
//             padding: const EdgeInsets.symmetric(vertical: 16),
//           ),
//           onPressed: () => Get.to(CustomerNavBar()),
//           child: Text(
//             "Login",
//             style: GoogleFonts.poppins(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),

//         const SizedBox(height: 20),

//         /// Divider with text
//         Row(
//           children: [
//             const Expanded(child: Divider(color: Colors.white70)),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child: Text(
//                 "or sign in with",
//                 style: GoogleFonts.poppins(color: Colors.white),
//               ),
//             ),
//             const Expanded(child: Divider(color: Colors.white70)),
//           ],
//         ),
//         const SizedBox(height: 20),

//         /// Social buttons
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _socialButton('assets/icons/google.png'),
//             const SizedBox(width: 20),
//             _socialButton('assets/icons/apple.png'),
//           ],
//         ),

//         const SizedBox(height: 20),

//         /// Sign up row
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Don't have an account? ",
//               style: GoogleFonts.poppins(color: Colors.white),
//             ),
//             GestureDetector(
//               onTap: () => Get.to(const SignUpScreen()),
//               child: Text(
//                 "Sign up",
//                 style: GoogleFonts.poppins(
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                   decoration: TextDecoration.underline,
//                   decorationColor: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   /// Social Button
//   Widget _socialButton(String assetPath) {
//     return Container(
//       width: 50,
//       height: 50,
//       decoration: const BoxDecoration(
//         shape: BoxShape.circle,
//         color: Colors.white,
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
import 'package:foodhub/views/auth/signup.dart';
import 'package:foodhub/views/auth/web/forget_password_web.dart';
import 'package:foodhub/views/auth/web/signup_web.dart';
import 'package:foodhub/views/customer/customer_navbar.dart';
import 'package:foodhub/widgets/custom_textformfield.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreenWeb extends StatelessWidget {
  const LoginScreenWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWeb = constraints.maxWidth > 600;

          if (!isWeb) {
            return const Center(child: Text("Mobile layout here"));
          }

          return Row(
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
          );
        },
      ),
    );
  }

  /// Login Form
  Widget _buildForm(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
          controller: TextEditingController(),
        ),

        /// Password
        CustomTextformfield(
          prefixIcon: const Icon(Icons.lock_open),
          hintText: "Enter your password",
          controller: TextEditingController(),
          obscureText: true,
        ),

        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              final orientation = MediaQuery.of(context).orientation;
              if (orientation == Orientation.portrait) {
                Get.to(() => const ForgotPasswordScreen());
              } else {
                Get.to(() => const ForgotPasswordScreenWeb());
              }
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
          onPressed: () => Get.to(CustomerNavBar()),
          child: Text(
            "Login",
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
                "or sign in with",
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
                final orientation = MediaQuery.of(context).orientation;
                if (orientation == Orientation.portrait) {
                  Get.to(() => const SignUpScreen());
                } else {
                  Get.to(() => const SignUpScreenWeb());
                }
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
