// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:foodhub/auth/providers/auth_provider.dart';
// import 'package:foodhub/widgets/custom_textformfield.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// class SignUpScreen extends StatelessWidget {
//   SignUpScreen({super.key});

//   //
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final phoneController = TextEditingController();
//   final passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<AuthProvider>(context);
//     final size = MediaQuery.of(context).size;
//     final width = size.width;
//     final height = size.height;

//     //

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: width * 0.08),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // GestureDetector(
//                 //   onTap: () {
//                 //     context.go('/ridersignup');
//                 //   },
//                 //   child: Padding(
//                 //     padding: const EdgeInsets.symmetric(
//                 //       vertical: 20,
//                 //       horizontal: 10,
//                 //     ),
//                 //     child: Row(
//                 //       mainAxisAlignment: MainAxisAlignment.end,
//                 //       children: [
//                 //         Transform(
//                 //           alignment: Alignment.center,
//                 //           transform: Matrix4.rotationY(
//                 //             3.1416,
//                 //           ), // π radians = 180° flip
//                 //           child: const Icon(
//                 //             Icons.delivery_dining,
//                 //             size: 40,
//                 //             color: Colors.deepOrange,
//                 //           ),
//                 //         ),
//                 //       ],
//                 //     ),
//                 //   ),
//                 // ),
//                 SizedBox(height: height * 0.08),
//                 Text(
//                   "Sign Up",
//                   style: GoogleFonts.poppins(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.deepOrange.shade700,
//                   ),
//                 ),
//                 const SizedBox(height: 40),

//                 /// Name
//                 CustomTextformfield(
//                   prefixIcon: const Icon(Icons.person),
//                   hintText: "Enter your Name",
//                   controller: nameController,
//                 ),

//                 /// Email
//                 CustomTextformfield(
//                   prefixIcon: const Icon(Icons.email),
//                   hintText: "Enter your email",
//                   controller: emailController,
//                 ),

//                 /// Phone
//                 CustomTextformfield(
//                   prefixIcon: const Icon(Icons.phone),
//                   hintText: "Enter your phone number",
//                   controller: phoneController,
//                   keyboardType: TextInputType.phone,
//                 ),

//                 /// Password
//                 CustomTextformfield(
//                   prefixIcon: const Icon(Icons.lock_open),
//                   hintText: "Enter your password",
//                   controller: passwordController,
//                   obscureText: true,
//                 ),

//                 SizedBox(height: height * 0.03),

//                 /// Signup Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.deepOrange,
//                       foregroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       padding: EdgeInsets.symmetric(vertical: height * 0.018),
//                     ),
//                     onPressed: authProvider.isLoading
//                         ? null
//                         : () => authProvider.signUp(
//                             name: nameController.text.trim(),
//                             email: emailController.text.trim(),
//                             phone: phoneController.text.trim(),
//                             password: passwordController.text.trim(),
//                             context: context,
//                           ),
//                     child: authProvider.isLoading
//                         ? const CircularProgressIndicator(color: Colors.white)
//                         : Text(
//                             "Sign Up",
//                             style: GoogleFonts.poppins(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                   ),
//                 ),

//                 if (!kIsWeb)
//                   Column(
//                     children: [
//                       SizedBox(height: height * 0.03),

//                       Row(
//                         children: [
//                           const Expanded(child: Divider(color: Colors.grey)),
//                           Padding(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: width * 0.04,
//                             ),
//                             child: Text(
//                               "or continue with",
//                               style: GoogleFonts.poppins(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.grey.shade700,
//                               ),
//                             ),
//                           ),
//                           const Expanded(child: Divider(color: Colors.grey)),
//                         ],
//                       ),

//                       SizedBox(height: height * 0.02),

//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Consumer<AuthProvider>(
//                             builder: (context, authProvider, child) {
//                               return Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   authProvider.isLoading
//                                       ? const SizedBox(
//                                           width: 50,
//                                           height: 50,
//                                           child: CircularProgressIndicator(
//                                             strokeWidth: 3,
//                                             valueColor:
//                                                 AlwaysStoppedAnimation<Color>(
//                                                   Colors.deepOrange,
//                                                 ),
//                                           ),
//                                         )
//                                       : _socialButton(
//                                           "assets/icons/google.png",
//                                           context,
//                                           authProvider,
//                                         ),
//                                 ],
//                               );
//                             },
//                           ),
//                           // _socialButton('assets/icons/google.png')
//                         ],
//                       ),
//                     ],
//                   ),
//                 SizedBox(height: height * 0.03),

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Already have an account? ",
//                       style: GoogleFonts.poppins(
//                         fontSize: 14,
//                         color: Colors.grey.shade700,
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         // Get.to(() => const LoginPage());
//                         context.go('/login');
//                       },
//                       child: Text(
//                         "Login",
//                         style: GoogleFonts.poppins(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.deepOrange.shade700,
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: height * 0.05),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   /// Handle Google Sign-In
//   Future<void> _handleGoogleSignIn(
//     BuildContext context,
//     AuthProvider authProvider,
//   ) async {
//     try {
//       final userCred = await authProvider.signInWithGoogle(context);

//       if (userCred != null && userCred.user != null) {
//         if (context.mounted) {
//           context.go('/home'); // Only navigate if login succeeded
//         }
//       } else {
//         debugPrint("Google Sign-In cancelled or failed");
//       }
//     } catch (e) {
//       debugPrint('Google Sign-In Error: $e');
//     }
//   }

//   /// Reusable Social Button with Asset Image
//   Widget _socialButton(
//     String assetPath,
//     BuildContext context,
//     AuthProvider authProvider,
//   ) {
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
//         onTap: () => _handleGoogleSignIn(context, authProvider),
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Image.asset(assetPath, fit: BoxFit.contain),
//         ),
//       ),
//     );
//   }
// }

// 2
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodhub/auth/providers/auth_provider.dart';
import 'package:foodhub/widgets/custom_textformfield.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  // Separate loading states
  bool _isEmailSignUpLoading = false;
  bool _isGoogleSignUpLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.08),
                Text(
                  "Sign Up",
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange.shade700,
                  ),
                ),
                const SizedBox(height: 40),

                /// Name
                CustomTextformfield(
                  prefixIcon: const Icon(Icons.person),
                  hintText: "Enter your Name",
                  controller: nameController,
                ),

                /// Email
                CustomTextformfield(
                  prefixIcon: const Icon(Icons.email),
                  hintText: "Enter your email",
                  controller: emailController,
                ),

                /// Phone
                CustomTextformfield(
                  prefixIcon: const Icon(Icons.phone),
                  hintText: "Enter your phone number",
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                ),

                /// Password
                CustomTextformfield(
                  prefixIcon: const Icon(Icons.lock_open),
                  hintText: "Enter your password",
                  controller: passwordController,
                  obscureText: true,
                ),

                SizedBox(height: height * 0.03),

                /// Signup Button
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
                    ),
                    onPressed: (_isEmailSignUpLoading || _isGoogleSignUpLoading)
                        ? null
                        : () async {
                            final name = nameController.text.trim();
                            final email = emailController.text.trim();
                            final phone = phoneController.text.trim();
                            final password = passwordController.text.trim();

                            if (name.isEmpty ||
                                email.isEmpty ||
                                phone.isEmpty ||
                                password.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please fill all fields"),
                                  backgroundColor: Colors.orange,
                                ),
                              );
                              return;
                            }

                            setState(() => _isEmailSignUpLoading = true);

                            try {
                              final authProvider = Provider.of<AuthProvider>(
                                context,
                                listen: false,
                              );

                              await authProvider.signUp(
                                name: name,
                                email: email,
                                phone: phone,
                                password: password,
                                context: context,
                              );
                            } finally {
                              if (mounted) {
                                setState(() => _isEmailSignUpLoading = false);
                              }
                            }
                          },
                    child: _isEmailSignUpLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          )
                        : Text(
                            "Sign Up",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),

                Column(
                  children: [
                    SizedBox(height: height * 0.03),

                    Row(
                      children: [
                        const Expanded(child: Divider(color: Colors.grey)),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                          ),
                          child: Text(
                            "or continue with",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                        const Expanded(child: Divider(color: Colors.grey)),
                      ],
                    ),

                    SizedBox(height: height * 0.02),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _isGoogleSignUpLoading
                            ? const SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.deepOrange,
                                  ),
                                ),
                              )
                            : _socialButton(
                                "assets/icons/google.png",
                                context,
                              ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: height * 0.03),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => context.go('/login'),
                      child: Text(
                        "Login",
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
                SizedBox(height: height * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Handle Google Sign-In
  Future<void> _handleGoogleSignIn(BuildContext context) async {
    if (_isEmailSignUpLoading || _isGoogleSignUpLoading) return;

    setState(() => _isGoogleSignUpLoading = true);

    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);

      final userCred = await authProvider.signInWithGoogle(context);

      if (userCred != null && userCred.user != null) {
        if (mounted) {
          context.go('/auth');
        }
      } else {
        debugPrint("Google Sign-In cancelled or failed");
      }
    } catch (e) {
      debugPrint('Google Sign-In Error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Google Sign-In failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isGoogleSignUpLoading = false);
      }
    }
  }

  /// Reusable Social Button with Asset Image
  Widget _socialButton(String assetPath, BuildContext context) {
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
        onTap: (_isEmailSignUpLoading || _isGoogleSignUpLoading)
            ? null
            : () => _handleGoogleSignIn(context),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(assetPath, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
