// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class AppTheme {
//   static ThemeData lightTheme = ThemeData(
//     fontFamily: GoogleFonts.poppins().fontFamily,
//     useMaterial3: true,
//     brightness: Brightness.light,

//     // Softer primary
//     primaryColor: const Color(0xFFFF944D),
//     scaffoldBackgroundColor: const Color(0xFFFAFAFA),

//     colorScheme: ColorScheme.fromSeed(
//       seedColor: const Color(0xFFFF944D),
//       primary: const Color(0xFFFF944D), // soft orange
//       secondary: const Color(0xFF6FCF97), // soft green
//       error: const Color(0xFFFF8A80), // soft red
//       background: const Color(0xFFFAFAFA),
//       surface: Colors.white,
//       brightness: Brightness.light,
//     ),

//     // AppBar
//     appBarTheme: const AppBarTheme(
//       elevation: 0,
//       centerTitle: true,
//       backgroundColor: Colors.white,
//       titleTextStyle: TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.w600,
//         color: Color(0xFF333333),
//       ),
//       iconTheme: IconThemeData(color: Color(0xFF333333)),
//     ),

//     // Floating Button
//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       backgroundColor: Color(0xFFFF944D),
//       foregroundColor: Colors.white,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(Radius.circular(16)),
//       ),
//     ),

//     // Buttons
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: const Color(0xFFFF944D),
//         foregroundColor: Colors.white,
//         textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
//       ),
//     ),

//     // Text
//     textTheme: const TextTheme(
//       displayLarge: TextStyle(
//         fontSize: 32,
//         fontWeight: FontWeight.bold,
//         color: Color(0xFF333333), // softer dark
//       ),
//       displayMedium: TextStyle(
//         fontSize: 24,
//         fontWeight: FontWeight.bold,
//         color: Color(0xFF333333),
//       ),
//       titleLarge: TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.w600,
//         color: Color(0xFF333333),
//       ),
//       bodyLarge: TextStyle(
//         fontSize: 16,
//         fontWeight: FontWeight.w400,
//         color: Color(0xFF4F4F4F),
//       ),
//       bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF828282)),
//       labelLarge: TextStyle(
//         fontSize: 14,
//         fontWeight: FontWeight.bold,
//         color: Colors.white,
//       ),
//     ),

//     // Input fields
//     inputDecorationTheme: InputDecorationTheme(
//       filled: true,
//       fillColor: Colors.white,
//       hintStyle: const TextStyle(color: Color(0xFF828282)),
//       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(color: Color(0xFFFF944D), width: 2),
//       ),
//     ),

//     // Bottom Navigation
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       backgroundColor: Colors.white,
//       selectedItemColor: Color(0xFFFF944D),
//       unselectedItemColor: Color(0xFF828282),
//       type: BottomNavigationBarType.fixed,
//       selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
//     ),
//   );
// }

// 2
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    useMaterial3: true,
    brightness: Brightness.light,

    // Deep Orange as primary
    primaryColor: Colors.deepOrange,
    // scaffoldBackgroundColor: const Color(0xFFFAFAFA),
    scaffoldBackgroundColor: Colors.grey[200],

    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepOrange,
      primary: Colors.deepOrange,
      secondary: Colors.orangeAccent, // keeps a lighter contrast
      error: Colors.redAccent,
      background: const Color(0xFFFAFAFA),
      surface: Colors.white,
      brightness: Brightness.light,
    ),

    // AppBar
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xFF333333),
      ),
      iconTheme: IconThemeData(color: Color(0xFF333333)),
    ),

    // Floating Button
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.deepOrange,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),

    // Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
    ),

    // Text
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color(0xFF333333),
      ),
      displayMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xFF333333),
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xFF333333),
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xFF4F4F4F),
      ),
      bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF828282)),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),

    // Input fields
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: const TextStyle(color: Color(0xFF828282)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.deepOrange, width: 2),
      ),
    ),

    // Bottom Navigation
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Color(0xFF828282),
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
    ),
  );
}
