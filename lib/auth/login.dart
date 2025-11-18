// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:foodhub/auth/providers/auth_provider.dart';
// import 'package:foodhub/widgets/custom_textformfield.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   //
//     bool _isEmailLoginLoading = false;
//   bool _isGoogleLoginLoading = false;
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final height = size.height;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// Title
//               Padding(
//                 padding: EdgeInsets.only(top: height * 0.08, bottom: 24),
//                 child: Text(
//                   "Sign In",
//                   style: GoogleFonts.poppins(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.deepOrange.shade700,
//                   ),
//                 ),
//               ),

//               /// Email
//               CustomTextformfield(
//                 prefixIcon: const Icon(Icons.email_outlined),
//                 hintText: "Enter your email",
//                 controller: emailController,
//               ),
//               const SizedBox(height: 16),

//               /// Password
//               CustomTextformfield(
//                 prefixIcon: const Icon(Icons.lock_outline),
//                 hintText: "Enter your password",
//                 controller: passwordController,
//                 obscureText: true,
//               ),

//               /// Forgot Password
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: TextButton(
//                   onPressed: () => context.push('/forget'),
//                   child: Text(
//                     "Forgot Password?",
//                     style: GoogleFonts.poppins(
//                       color: Colors.deepOrange,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),

//               /// Login button
//               // SizedBox(
//               //   width: double.infinity,
//               //   child: ElevatedButton(
//               //     style: ElevatedButton.styleFrom(
//               //       backgroundColor: Colors.deepOrange,
//               //       foregroundColor: Colors.white,
//               //       shape: RoundedRectangleBorder(
//               //         borderRadius: BorderRadius.circular(16),
//               //       ),
//               //       padding: const EdgeInsets.symmetric(vertical: 14),
//               //     ),
//               //     onPressed: () {
//               //       // After successful login
//               //       context.go('/riderhome'); // same as Get.offAll(HomePage())
//               //     },
//               //     child: Text(
//               //       "Login",
//               //       style: GoogleFonts.poppins(
//               //         fontSize: 16,
//               //         fontWeight: FontWeight.bold,
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               /// Login button
//               SizedBox(
//                 width: double.infinity,
//                 child: Consumer<AuthProvider>(
//                   builder: (context, authProvider, child) {
//                     return ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.deepOrange,
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         padding: const EdgeInsets.symmetric(vertical: 14),
//                       ),
//                       onPressed: authProvider.isLoading
//                           ? null
//                           : () async {
//                               final email = emailController.text.trim();
//                               final password = passwordController.text.trim();

//                               if (email.isEmpty || password.isEmpty) {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                     content: Text(
//                                       "Please enter email and password",
//                                     ),
//                                   ),
//                                 );
//                                 return;
//                               }

//                               await authProvider.login(
//                                 email: email,
//                                 password: password,
//                                 context: context,
//                               );

//                               // context.go('/auth');
//                             },
//                       child: authProvider.isLoading
//                           ? const SizedBox(
//                               height: 20,
//                               width: 20,
//                               child: CircularProgressIndicator(
//                                 strokeWidth: 2,
//                                 valueColor: AlwaysStoppedAnimation<Color>(
//                                   Colors.white,
//                                 ),
//                               ),
//                             )
//                           : Text(
//                               "Login",
//                               style: GoogleFonts.poppins(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                     );
//                   },
//                 ),
//               ),
//               if (!kIsWeb)
//                 Column(
//                   children: [
//                     const SizedBox(height: 32),

//                     /// Divider
//                     Row(
//                       children: [
//                         const Expanded(child: Divider(color: Colors.grey)),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8),
//                           child: Text(
//                             "or sign in with",
//                             style: GoogleFonts.poppins(
//                               color: Colors.grey.shade700,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                         const Expanded(child: Divider(color: Colors.grey)),
//                       ],
//                     ),

//                     const SizedBox(height: 24),

//                     /// Social Buttons
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         // _socialButton('assets/icons/google.png')
//                         Consumer<AuthProvider>(
//                           builder: (context, authProvider, child) {
//                             return Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 authProvider.isLoading
//                                     ? const SizedBox(
//                                         width: 50,
//                                         height: 50,
//                                         child: CircularProgressIndicator(
//                                           strokeWidth: 3,
//                                           valueColor:
//                                               AlwaysStoppedAnimation<Color>(
//                                                 Colors.deepOrange,
//                                               ),
//                                         ),
//                                       )
//                                     : _socialButton(
//                                         "assets/icons/google.png",
//                                         context,
//                                         authProvider,
//                                       ),
//                               ],
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),

//               const SizedBox(height: 32),

//               /// Signup
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Don't have an account? ",
//                     style: GoogleFonts.poppins(
//                       fontSize: 14,
//                       color: Colors.grey.shade700,
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () => context.go('/signup'),
//                     child: Text(
//                       "Sign up",
//                       style: GoogleFonts.poppins(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.deepOrange.shade700,
//                         decoration: TextDecoration.underline,
//                         decorationColor: Colors.deepOrange,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   /// Social Button
//   /// Handle Google Sign-In
//   Future<void> _handleGoogleSignIn(
//     BuildContext context,
//     AuthProvider authProvider,
//   ) async {
//     try {
//       final userCred = await authProvider.signInWithGoogle(context);

//       if (userCred != null && userCred.user != null) {
//         if (context.mounted) {
//           context.go('/auth'); // Only navigate if login succeeded
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
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Separate loading states
  bool _isEmailLoginLoading = false;
  bool _isGoogleLoginLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Padding(
                padding: EdgeInsets.only(top: height * 0.08, bottom: 24),
                child: Text(
                  "Sign In",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange.shade700,
                  ),
                ),
              ),

              /// Email
              CustomTextformfield(
                prefixIcon: const Icon(Icons.email_outlined),
                hintText: "Enter your email",
                controller: emailController,
              ),
              const SizedBox(height: 16),

              /// Password
              CustomTextformfield(
                prefixIcon: const Icon(Icons.lock_outline),
                hintText: "Enter your password",
                controller: passwordController,
                obscureText: true,
              ),

              /// Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => context.push('/forget'),
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.poppins(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
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
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: (_isEmailLoginLoading || _isGoogleLoginLoading)
                      ? null
                      : () async {
                          final email = emailController.text.trim();
                          final password = passwordController.text.trim();

                          if (email.isEmpty || password.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Please enter email and password",
                                ),
                              ),
                            );
                            return;
                          }

                          setState(() => _isEmailLoginLoading = true);

                          try {
                            final authProvider = Provider.of<AuthProvider>(
                              context,
                              listen: false,
                            );

                            await authProvider.login(
                              email: email,
                              password: password,
                              context: context,
                            );
                          } finally {
                            if (mounted) {
                              setState(() => _isEmailLoginLoading = false);
                            }
                          }
                        },
                  child: _isEmailLoginLoading
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
                          "Login",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),

              if (!kIsWeb)
                Column(
                  children: [
                    const SizedBox(height: 32),

                    /// Divider
                    Row(
                      children: [
                        const Expanded(child: Divider(color: Colors.grey)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "or sign in with",
                            style: GoogleFonts.poppins(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Expanded(child: Divider(color: Colors.grey)),
                      ],
                    ),

                    const SizedBox(height: 24),

                    /// Social Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _isGoogleLoginLoading
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
                            : _socialButton("assets/icons/google.png", context),
                      ],
                    ),
                  ],
                ),

              const SizedBox(height: 32),

              /// Signup
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.go('/signup'),
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
            ],
          ),
        ),
      ),
    );
  }

  /// Handle Google Sign-In
  Future<void> _handleGoogleSignIn(BuildContext context) async {
    if (_isEmailLoginLoading || _isGoogleLoginLoading) return;

    setState(() => _isGoogleLoginLoading = true);

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
        setState(() => _isGoogleLoginLoading = false);
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
        onTap: (_isEmailLoginLoading || _isGoogleLoginLoading)
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
