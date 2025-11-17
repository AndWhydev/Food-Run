// import 'package:flutter/material.dart';

// class EarningsScreen extends StatelessWidget {
//   const EarningsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.3,
//         surfaceTintColor: Colors.transparent,
//         title: const Text(
//           "Earnings",
//           style: TextStyle(fontWeight: FontWeight.w600),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(24),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: const [
//                   BoxShadow(color: Color(0x11000000), blurRadius: 10),
//                 ],
//               ),
//               child: Column(
//                 children: const [
//                   Text(
//                     "This Month",
//                     style: TextStyle(fontSize: 16, color: Colors.grey),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     "\$1,420",
//                     style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 30),
//             const Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "Recent Payouts",
//                 style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
//               ),
//             ),
//             const SizedBox(height: 16),
//             _EarningRow(date: "Oct 24, 2025", amount: "\$85"),
//             _EarningRow(date: "Oct 25, 2025", amount: "\$90"),
//             _EarningRow(date: "Oct 26, 2025", amount: "\$70"),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _EarningRow extends StatelessWidget {
//   final String date;
//   final String amount;

//   const _EarningRow({required this.date, required this.amount});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//         boxShadow: const [BoxShadow(color: Color(0x0F000000), blurRadius: 6)],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(date, style: const TextStyle(color: Colors.grey)),
//           Text(
//             amount,
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//           ),
//         ],
//       ),
//     );
//   }
// }

// 2
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EarningsScreen extends StatelessWidget {
  const EarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Colors.deepOrange;
    final Color accentColor = Colors.deepOrange;
    final Color cardColor = Colors.white;
    final Size size = MediaQuery.of(context).size;
    final double baseFont = size.width * 0.04;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // All-Time Earnings Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [primaryColor, accentColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "All-Time Earnings",
                      style: GoogleFonts.poppins(
                        color: Colors.white70,
                        fontSize: baseFont * 0.8,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "\$2,540.75",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: baseFont * 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Monthly Earnings Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "October Earnings",
                      style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: baseFont,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "\$820.50",
                      style: GoogleFonts.poppins(
                        color: accentColor,
                        fontSize: baseFont * 1.1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // Completed Orders Header
              Text(
                "Recent Payouts",
                style: GoogleFonts.poppins(
                  fontSize: baseFont,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),

              // Orders List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: primaryColor.withOpacity(0.1),
                              radius: 22,
                              child: Icon(
                                Icons.delivery_dining,
                                color: primaryColor,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Order #${index + 1012}",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: baseFont * 0.9,
                                  ),
                                ),
                                Text(
                                  "Delivered on 28 Oct, 2025",
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: baseFont * 0.7,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          "+\$${(12.5 + index * 3).toStringAsFixed(2)}",
                          style: GoogleFonts.poppins(
                            color: Colors.deepOrange,
                            fontSize: baseFont * 0.9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
