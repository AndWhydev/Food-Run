// import 'package:flutter/material.dart';
// import 'package:foodhub/auth/layout%20decider/login_page.dart';
// import 'package:foodhub/auth/signup.dart';
// import 'package:foodhub/views/customer/customer_navbar.dart';
// import 'package:foodhub/widgets/custom_textformfield.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SignUpScreenWeb extends StatelessWidget {
//   const SignUpScreenWeb({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           final isWeb = constraints.maxWidth > 600;

//           if (!isWeb) {
//             return SignUpScreen();
//           }

//           return SingleChildScrollView(
//             child: Row(
//               children: [
//                 /// LEFT SIDE (Food image + tagline)
//                 Expanded(
//                   flex: 1,
//                   child: Container(
//                     color: Colors.white,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           'assets/images/piza.png',
//                           fit: BoxFit.contain,
//                           width: constraints.maxWidth * 0.4,
//                         ),
//                         const SizedBox(height: 20),
//                         Text(
//                           textAlign: TextAlign.center,
//                           "🍔 Taste the Best, Every Bite!",
//                           style: GoogleFonts.poppins(
//                             fontSize: 26,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.deepOrange,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           "Join FoodHub today & explore\nfresh meals anytime, anywhere",
//                           style: GoogleFonts.poppins(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w400,
//                             color: Colors.grey[700],
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 /// RIGHT SIDE (Signup form in card)
//                 Expanded(
//                   flex: 1,
//                   child: Container(
//                     child: Center(
//                       child: Card(
//                         color: Colors.deepOrange,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(28),
//                         ),
//                         elevation: 10,
//                         child: Padding(
//                           padding: const EdgeInsets.all(36.0),
//                           child: ConstrainedBox(
//                             constraints: const BoxConstraints(maxWidth: 420),
//                             child: _buildForm(context),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   /// Signup Form
//   Widget _buildForm(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Text(
//           "Create Account ✨",
//           style: GoogleFonts.poppins(
//             fontSize: 26,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         const SizedBox(height: 6),
//         Text(
//           "Sign up to start your food adventure",
//           style: GoogleFonts.poppins(
//             fontSize: 14,
//             fontWeight: FontWeight.w400,
//             color: Colors.white70,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         const SizedBox(height: 30),

//         /// Name
//         CustomTextformfield(
//           prefixIcon: const Icon(Icons.person),
//           hintText: "Enter your full name",
//           controller: TextEditingController(),
//         ),

//         /// Email
//         CustomTextformfield(
//           prefixIcon: const Icon(Icons.email),
//           hintText: "Enter your email",
//           controller: TextEditingController(),
//         ),

//         //
//          /// Email
//         CustomTextformfield(
//           prefixIcon: const Icon(Icons.email),
//           hintText: "Enter your Phone",
//           controller: TextEditingController(),
//         ),

//         /// Password
//         CustomTextformfield(
//           prefixIcon: const Icon(Icons.lock_open),
//           hintText: "Enter your password",
//           controller: TextEditingController(),
//           obscureText: true,
//         ),

//         /// Confirm Password
//         CustomTextformfield(
//           prefixIcon: const Icon(Icons.lock_outline),
//           hintText: "Confirm your password",
//           controller: TextEditingController(),
//           obscureText: true,
//         ),

//         const SizedBox(height: 10),

//         /// Signup Button
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.white,
//             foregroundColor: Colors.deepOrange,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(18),
//             ),
//             padding: const EdgeInsets.symmetric(vertical: 16),
//           ),
//           onPressed: () => Get.to(CustomerNavBar()),
//           child: Text(
//             "Sign Up",
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
//                 "or sign up with",
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

//         /// Already have account row
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Already have an account? ",
//               style: GoogleFonts.poppins(color: Colors.white),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Get.to(LoginPage());
//               },
//               child: Text(
//                 "Login",
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
import 'package:foodhub/auth/signup.dart';
import 'package:foodhub/widgets/custom_textformfield.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:foodhub/auth/providers/auth_provider.dart';

class SignUpScreenWeb extends StatefulWidget {
  const SignUpScreenWeb({super.key});

  @override
  State<SignUpScreenWeb> createState() => _SignUpScreenWebState();
}

class _SignUpScreenWebState extends State<SignUpScreenWeb> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool _isGoogleSignUpLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWeb = constraints.maxWidth > 600;

          if (!isWeb) {
            return SignUpScreen(); // fallback to mobile layout
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
                          width: constraints.maxWidth * 0.3,
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
                          "Join FoodRun today & explore\nfresh meals anytime, anywhere",
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
              ],
            ),
          );
        },
      ),
    );
  }

  /// Signup Form
  Widget _buildForm(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final authProvider = Provider.of<AuthProvider>(context);

    return Consumer<AuthProvider>(
      builder: (context, provider, _) {
        return Form(
          key: formKey,
          child: Column(
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
                prefixIcon: const Icon(Icons.person, color: Colors.black),
                hintText: "Enter your full name",
                controller: nameController,
                validator: (value) =>
                    value == null || value.isEmpty ? "Name is required" : null,
              ),

              /// Email
              CustomTextformfield(
                prefixIcon: const Icon(Icons.email, color: Colors.black),
                hintText: "Enter your email",
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Email is required";
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),

              /// Phone
              CustomTextformfield(
                prefixIcon: const Icon(Icons.phone, color: Colors.black),
                hintText: "Enter your phone",
                controller: phoneController,
                validator: (value) =>
                    value == null || value.isEmpty ? "Phone is required" : null,
              ),

              /// Password
              CustomTextformfield(
                prefixIcon: const Icon(Icons.lock_open, color: Colors.black),
                hintText: "Enter your password",
                controller: passwordController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),

              /// Confirm Password
              CustomTextformfield(
                prefixIcon: const Icon(Icons.lock_outline, color: Colors.black),
                hintText: "Confirm your password",
                controller: confirmPasswordController,
                obscureText: true,
                validator: (value) {
                  if (value != passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

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
                onPressed: (authProvider.isLoading || _isGoogleSignUpLoading)
                    ? null
                    : () {
                        if (formKey.currentState!.validate()) {
                          authProvider.signUp(
                            name: nameController.text.trim(),
                            email: emailController.text.trim(),
                            phone: phoneController.text.trim(),
                            password: passwordController.text.trim(),
                            context: context,
                          );
                        }
                      },
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
                   _isGoogleSignUpLoading
                  ? const SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white,
                        ),
                      ),
                    )
                  : _socialButton('assets/icons/google.png', context),
                ],
              ),
              const SizedBox(height: 20),

              /// Already have account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.go('/login');
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
          ),
        );
      },
    );
  }

  /// Social Button
  Widget _socialButton(String assetPath, BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: () => _handleGoogleSignIn(context),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(assetPath, fit: BoxFit.contain),
        ),
      ),
    );
  }

  Future<void> _handleGoogleSignIn(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (authProvider.isLoading || _isGoogleSignUpLoading) return;

    setState(() => _isGoogleSignUpLoading = true);

    try {
      final userCred = await authProvider.signInWithGoogle(context);

      if (userCred != null && userCred.user != null) {
        if (mounted) {
          context.go('/auth');
        }
      }
    } catch (e) {
      debugPrint('Google Sign-In Error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Google Sign-In failed: $e'),
            backgroundColor: Colors.white,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isGoogleSignUpLoading = false);
      }
    }
  }
}
