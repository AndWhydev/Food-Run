// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class OrderCard extends StatelessWidget {
//   final String restaurantName;
//   final String orderId;
//   final String pickupLocation;
//   final String dropoffLocation;
//   final String items;
//   final String total;
//   final VoidCallback onAccept;
//   final VoidCallback onCancel;
//   final String imageUrl;

//   const OrderCard({
//     super.key,
//     required this.restaurantName,
//     required this.orderId,
//     required this.pickupLocation,
//     required this.dropoffLocation,
//     required this.items,
//     required this.total,
//     required this.onAccept,
//     required this.onCancel,
//     this.imageUrl =
//         "https://cdn-icons-png.flaticon.com/512/2921/2921822.png", // default restaurant icon
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.white,
//       elevation: 6,
//       margin: const EdgeInsets.only(bottom: 16),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       shadowColor: Colors.deepOrange.withOpacity(0.3),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // 🏪 Restaurant Header
//             Row(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Image.network(
//                     imageUrl,
//                     height: 50,
//                     width: 50,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       restaurantName,
//                       style: GoogleFonts.poppins(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     Text(
//                       "Order #$orderId",
//                       style: GoogleFonts.poppins(
//                         fontSize: 13,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),

//             const SizedBox(height: 12),
//             Divider(color: Colors.grey[300]),

//             // 📦 Order Details
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 _orderDetail("Pickup", pickupLocation),
//                 _orderDetail("Dropoff", dropoffLocation),
//               ],
//             ),

//             const SizedBox(height: 12),
//             Text(
//               items,
//               style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[700]),
//             ),

//             const SizedBox(height: 12),
//             Text(
//               "Total: $total",
//               style: GoogleFonts.poppins(
//                 fontSize: 15,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.deepOrange,
//               ),
//             ),

//             const SizedBox(height: 16),

//             // 🟢 Buttons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.redAccent,
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     onPressed: onCancel,
//                     child: Text(
//                       "Cancel",
//                       style: GoogleFonts.poppins(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     onPressed: onAccept,
//                     child: Text(
//                       "Accept",
//                       style: GoogleFonts.poppins(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _orderDetail(String title, String value) {
//     return Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[600]),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             value,
//             style: GoogleFonts.poppins(
//               fontSize: 13,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// 2
import 'dart:ui' show FontWeight;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderCard extends StatefulWidget {
  final String restaurantName;
  final String orderId;
  final String pickupLocation;
  final String dropoffLocation;
  final String items;
  final String total;
  final Function(double bidAmount) onBidSubmit;
  final String imageUrl;

  const OrderCard({
    super.key,
    required this.restaurantName,
    required this.orderId,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.items,
    required this.total,
    required this.onBidSubmit,
    this.imageUrl = "https://cdn-icons-png.flaticon.com/512/2921/2921822.png",
  });

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  final TextEditingController bidController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 6,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      shadowColor: Colors.deepOrange.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🏪 Restaurant Header
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.imageUrl,
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.restaurantName,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Order #${widget.orderId}",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),
            Divider(color: Colors.grey[300]),

            // 📍 Details
            Row(
              children: [
                Expanded(child: _detail("Pickup", widget.pickupLocation)),
                const SizedBox(width: 8),
                Expanded(child: _detail("Dropoff", widget.dropoffLocation)),
              ],
            ),

            const SizedBox(height: 12),

            Text(
              widget.items,
              style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[700]),
            ),

            const SizedBox(height: 12),
            Text(
              "Amount: ${widget.total}",
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.deepOrange,
              ),
            ),

            const SizedBox(height: 16),

            // 💸 TextField for Bidding
            TextField(
              controller: bidController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter your bid amount",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // 🔘 Single Submit Button (Full Width)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (bidController.text.isEmpty) return;
                  double bid = double.parse(bidController.text);
                  widget.onBidSubmit(bid);
                },
                child: Text(
                  "Submit Bid",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detail(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[600]),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
