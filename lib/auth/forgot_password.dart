// import 'package:flutter/material.dart';
// import 'package:foodhub/widgets/custom_textformfield.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';
// import 'package:foodhub/auth/providers/auth_provider.dart'; // 👈 Import your provider

// class ForgotPasswordScreen extends StatelessWidget {
//   ForgotPasswordScreen({super.key});

//   final emailController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final height = size.height;

//     // Get provider instance
//     final authProvider = Provider.of<AuthProvider>(context, listen: false);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           onPressed: () => context.pop(),
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//         ),
//       ),
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// Title
//               Padding(
//                 padding: EdgeInsets.only(top: height * 0.01, bottom: 8),
//                 child: Text(
//                   "Forgot Password",
//                   style: GoogleFonts.poppins(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.deepOrange.shade700,
//                   ),
//                 ),
//               ),

//               Text(
//                 "Enter your email and we’ll send you a link to reset your password.",
//                 style: GoogleFonts.poppins(
//                   fontSize: 14,
//                   color: Colors.grey.shade700,
//                   height: 1.5,
//                 ),
//               ),

//               const SizedBox(height: 32),

//               /// Email Field
//               CustomTextformfield(
//                 prefixIcon: const Icon(Icons.email_outlined),
//                 hintText: "Enter your email",
//                 controller: emailController,
//               ),

//               const SizedBox(height: 32),

//               /// Reset Password Button
//               Consumer<AuthProvider>(
//                 builder: (context, provider, _) {
//                   return SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.deepOrange,
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         padding: const EdgeInsets.symmetric(vertical: 14),
//                       ),
//                       onPressed: provider.isLoading
//                           ? null
//                           : () {
//                               final email = emailController.text.trim();
//                               if (email.isEmpty) {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                     content: Text("Please enter your email"),
//                                   ),
//                                 );
//                                 return;
//                               }
//                               provider.resetPassword(email, context);
//                             },
//                       child: provider.isLoading
//                           ? const SizedBox(
//                               height: 20,
//                               width: 20,
//                               child: CircularProgressIndicator(
//                                 strokeWidth: 2,
//                                 color: Colors.white,
//                               ),
//                             )
//                           : Text(
//                               "Reset Password",
//                               style: GoogleFonts.poppins(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// 2
import 'package:flutter/material.dart';
import 'package:foodhub/widgets/custom_textformfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:foodhub/auth/providers/auth_provider.dart'; // 👈 Import your provider

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>(); // ✅ Correct naming

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey, // ✅ Attach key to Form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                Padding(
                  padding: EdgeInsets.only(top: height * 0.01, bottom: 8),
                  child: Text(
                    "Forgot Password",
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange.shade700,
                    ),
                  ),
                ),

                Text(
                  "Enter your email and we’ll send you a link to reset your password.",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 32),

                /// Email Field
                CustomTextformfield(
                  prefixIcon: const Icon(Icons.email_outlined),
                  hintText: "Enter your email",
                  controller: emailController,
                  validator: (value) {
                    // ✅ Add validation
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 32),

                /// Reset Password Button
                Consumer<AuthProvider>(
                  builder: (context, provider, _) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: provider.isLoading
                            ? null
                            : () {
                                if (formKey.currentState!.validate()) {
                                  final email = emailController.text.trim();
                                  provider.resetPassword(email, context);
                                }
                              },
                        child: provider.isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.deepOrange,
                                ),
                              )
                            : Text(
                                "Send Reset Link",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
