// import 'package:flutter/material.dart';
// import 'package:foodhub/widgets/custom_textformfield.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ForgotPasswordScreenWeb extends StatelessWidget {
//   const ForgotPasswordScreenWeb({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final _formkey = GlobalKey<FormState>();
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           final isWeb = constraints.maxWidth > 600;

//           if (!isWeb) {
//             return const Center(child: Text("Mobile layout here"));
//           }

//           return Form(
//             key: _formkey,
//             child: Row(
//               children: [
//                 /// LEFT SIDE (Image + tagline)
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
//                           width: constraints.maxWidth * 0.3,
//                         ),
//                         const SizedBox(height: 20),
//                         Text(
//                           "🍕 Lost Access?\nNo Worries!",
//                           style: GoogleFonts.poppins(
//                             fontSize: 26,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.deepOrange,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           "We’ll help you reset your password\nso you can get back to delicious food fast.",
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

//                 /// RIGHT SIDE (Form Card)
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
//                             child: _buildForm(context, _formkey),
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

//   Widget _buildForm(BuildContext context, GlobalKey<FormState> formkey) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Text(
//           "Forgot Password 🔑",
//           style: GoogleFonts.poppins(
//             fontSize: 26,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         const SizedBox(height: 6),
//         Text(
//           "Enter your email and we’ll send you a reset link.",
//           style: GoogleFonts.poppins(
//             fontSize: 14,
//             fontWeight: FontWeight.w400,
//             color: Colors.white70,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         const SizedBox(height: 30),

//         /// Email field
//         CustomTextformfield(
//           prefixIcon: const Icon(Icons.email),
//           hintText: "Enter your email",
//           controller: TextEditingController(),
//           validator: (value) {
//             if (value!.isEmpty) {
//               return "";
//             }
//             return null;
//           },
//         ),

//         const SizedBox(height: 20),

//         /// Reset button
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.white,
//             foregroundColor: Colors.deepOrange,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(18),
//             ),
//             padding: EdgeInsets.symmetric(vertical: 16),
//           ),
//           onPressed: () {
//             if (formkey.currentState!.validate()) {
//               print("Sent");
//             }
//           },
//           child: Text(
//             "Send Reset Link",
//             style: GoogleFonts.poppins(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// 2
import 'package:flutter/material.dart';
import 'package:foodhub/widgets/custom_textformfield.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreenWeb extends StatelessWidget {
  const ForgotPasswordScreenWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Row(
                children: [
                  /// LEFT SIDE (Image + tagline)
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

                          Text(
                            "🍕 Lost Access?\nNo Worries!",
                            style: GoogleFonts.poppins(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              "We’ll help you reset your password\nso you can get back to delicious food fast.",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[700],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// RIGHT SIDE (Form Card)
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
                              child: _buildForm(context, _formkey),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildForm(BuildContext context, GlobalKey<FormState> formkey) {
    final emailController = TextEditingController();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Forgot Password 🔑",
          style: GoogleFonts.poppins(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Text(
          "Enter your email and we’ll send you a reset link.",
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white70,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),

        /// Email field
        Theme(
          data: Theme.of(context).copyWith(
            inputDecorationTheme: const InputDecorationTheme(
              errorStyle: TextStyle(
                color:
                    Colors.white, // error text color (white to pop on orange)
                fontWeight: FontWeight.w600,
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.5),
              ),
            ),
          ),
          child: CustomTextformfield(
            prefixIcon: const Icon(Icons.email),
            hintText: "Enter your email",
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email is required";
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return "Enter a valid email";
              }
              return null;
            },
          ),
        ),

        const SizedBox(height: 20),

        /// Reset button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: () {
            if (formkey.currentState!.validate()) {
              print("Sent");
            }
          },
          child: Text(
            "Send Reset Link",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
