import 'package:flutter/material.dart';
import 'package:foodhub/utils/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class WebCustomerHome extends StatelessWidget {
  const WebCustomerHome({super.key});

  Widget _navButton({
    required String label,
    required VoidCallback onPressed,
    bool isPrimary = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: TextButton(
        onPressed: onPressed,
        style:
            TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: isPrimary
                  ? AppTheme
                        .lightTheme
                        .colorScheme
                        .secondary // green highlight
                  : Colors.transparent,
              foregroundColor: isPrimary
                  ? Colors.white
                  : AppTheme.lightTheme.colorScheme.onPrimary,
            ).copyWith(
              overlayColor: WidgetStatePropertyAll(
                AppTheme.lightTheme.colorScheme.primary.withOpacity(0.1),
              ),
            ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: isPrimary
                ? Colors.white
                : AppTheme.lightTheme.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              title: Text(
                "FoodHub",
                style: GoogleFonts.pacifico(color: Colors.white, fontSize: 24),
              ),
              backgroundColor: AppTheme.lightTheme.colorScheme.primary,
              centerTitle: false,
              elevation: 2,
              actions: [
                _navButton(
                  label: "Home",
                  onPressed: () {
                    // Navigate to Home
                  },
                  isPrimary: true, // highlight Home
                ),
                _navButton(
                  label: "Orders",
                  onPressed: () {
                    // Navigate to Orders
                  },
                ),
                _navButton(
                  label: "Profile",
                  onPressed: () {
                    // Navigate to Profile
                  },
                ),
                const SizedBox(width: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
