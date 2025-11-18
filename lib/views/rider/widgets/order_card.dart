// import 'dart:ui' show FontWeight;

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class RiderOrderCard extends StatefulWidget {
//   final String restaurantName;
//   final String orderId;
//   final String pickupLocation;
//   final String dropoffLocation;
//   final String items;
//   final String total;
//   final Function(double bidAmount) onBidSubmit;
//   final String imageUrl;

//   const RiderOrderCard({
//     super.key,
//     required this.restaurantName,
//     required this.orderId,
//     required this.pickupLocation,
//     required this.dropoffLocation,
//     required this.items,
//     required this.total,
//     required this.onBidSubmit,
//     this.imageUrl = "https://cdn-icons-png.flaticon.com/512/2921/2921822.png",
//   });

//   @override
//   State<RiderOrderCard> createState() => _RiderOrderCardState();
// }

// class _RiderOrderCardState extends State<RiderOrderCard> {
//   final TextEditingController bidController = TextEditingController();

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
//                     widget.imageUrl,
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
//                       widget.restaurantName,
//                       style: GoogleFonts.poppins(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     Text(
//                       "Order #${widget.orderId}",
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

//             // 📍 Details
//             Row(
//               children: [
//                 Expanded(child: _detail("Pickup", widget.pickupLocation)),
//                 const SizedBox(width: 8),
//                 Expanded(child: _detail("Dropoff", widget.dropoffLocation)),
//               ],
//             ),

//             const SizedBox(height: 12),

//             Text(
//               widget.items,
//               style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[700]),
//             ),

//             const SizedBox(height: 12),
//             Text(
//               "Amount: ${widget.total}",
//               style: GoogleFonts.poppins(
//                 fontSize: 15,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.deepOrange,
//               ),
//             ),

//             const SizedBox(height: 16),

//             // 💸 TextField for Bidding
//             TextField(
//               controller: bidController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: "Enter your bid amount",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             // 🔘 Single Submit Button (Full Width)
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                   padding: const EdgeInsets.symmetric(vertical: 14),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 onPressed: () {
//                   if (bidController.text.isEmpty) return;
//                   double bid = double.parse(bidController.text);
//                   widget.onBidSubmit(bid);
//                 },
//                 child: Text(
//                   "Submit Bid",
//                   style: GoogleFonts.poppins(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _detail(String title, String value) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[600]),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           value,
//           style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500),
//         ),
//       ],
//     );
//   }
// }

// 2
// import 'package:flutter/material.dart';
// import 'package:foodhub/models/order_model.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';

// class RiderOrderCard extends StatefulWidget {
//   final OrderModel order;
//   final bool hasBid;
//   final Function(double bidAmount) onBidSubmit;

//   const RiderOrderCard({
//     super.key,
//     required this.order,
//     required this.hasBid,
//     required this.onBidSubmit,
//   });

//   @override
//   State<RiderOrderCard> createState() => _RiderOrderCardState();
// }

// class _RiderOrderCardState extends State<RiderOrderCard> {
//   final _bidController = TextEditingController();
//   bool _showBidInput = false;

//   @override
//   void dispose() {
//     _bidController.dispose();
//     super.dispose();
//   }

//   String _formatTime(DateTime dateTime) {
//     return DateFormat('hh:mm a').format(dateTime);
//   }

//   Color _getStatusColor() {
//     switch (widget.order.status) {
//       case 'pending':
//         return Colors.orange;
//       case 'assigned':
//         return Colors.blue;
//       case 'inTransit':
//         return Colors.purple;
//       case 'delivered':
//         return Colors.green;
//       default:
//         return Colors.grey;
//     }
//   }

//   String _getStatusText() {
//     switch (widget.order.status) {
//       case 'pending':
//         return 'New Order';
//       case 'assigned':
//         return 'Assigned';
//       case 'inTransit':
//         return 'In Transit';
//       case 'delivered':
//         return 'Delivered';
//       default:
//         return widget.order.status.toString();
//     }
//   }

//   void _submitBid() {
//     final amount = double.tryParse(_bidController.text);
//     if (amount == null || amount <= 0) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please enter a valid bid amount'),
//           backgroundColor: Colors.red,
//           behavior: SnackBarBehavior.floating,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//       );
//       return;
//     }

//     widget.onBidSubmit(amount);
//     setState(() {
//       _showBidInput = false;
//       _bidController.clear();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final itemsText = widget.order.items.isNotEmpty
//         ? widget.order.items
//               .map((item) => '${item['quantity']}x ${item['name']}')
//               .join(' • ')
//         : 'No items';

//     return Card(
//       elevation: 3,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           gradient: LinearGradient(
//             colors: [Colors.white, Colors.grey.shade50],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header with Order ID and Status
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         padding: EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           color: Colors.deepOrange.withOpacity(0.1),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Icon(
//                           Icons.receipt_long,
//                           color: Colors.deepOrange,
//                           size: 20,
//                         ),
//                       ),
//                       SizedBox(width: 10),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Order #${widget.order.id.substring(0, 8)}",
//                             style: GoogleFonts.poppins(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           Text(
//                             _formatTime(widget.order.createdAt),
//                             style: GoogleFonts.poppins(
//                               fontSize: 11,
//                               color: Colors.grey[600],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                     decoration: BoxDecoration(
//                       color: _getStatusColor().withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(20),
//                       border: Border.all(
//                         color: _getStatusColor().withOpacity(0.3),
//                       ),
//                     ),
//                     child: Text(
//                       _getStatusText(),
//                       style: GoogleFonts.poppins(
//                         fontSize: 11,
//                         fontWeight: FontWeight.w600,
//                         color: _getStatusColor(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               SizedBox(height: 16),

//               // Customer Info
//               Container(
//                 padding: EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: Colors.blue.shade50,
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: Colors.blue.shade100),
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: Colors.blue.shade100,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Icon(
//                         Icons.person,
//                         color: Colors.blue.shade700,
//                         size: 20,
//                       ),
//                     ),
//                     SizedBox(width: 12),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             widget.order.customerName,
//                             style: GoogleFonts.poppins(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           SizedBox(height: 2),
//                           Text(
//                             widget.order.customerPhone,
//                             style: GoogleFonts.poppins(
//                               fontSize: 12,
//                               color: Colors.grey[700],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               SizedBox(height: 12),

//               // Pickup Location
//               _buildLocationRow(
//                 icon: Icons.restaurant,
//                 iconColor: Colors.green,
//                 label: "Pickup",
//                 address: widget.order.pickupAddress,
//               ),

//               SizedBox(height: 8),

//               // Dropoff Location
//               _buildLocationRow(
//                 icon: Icons.location_on,
//                 iconColor: Colors.red,
//                 label: "Dropoff",
//                 address: widget.order.dropoffAddress,
//               ),

//               SizedBox(height: 12),

//               // Items
//               Container(
//                 padding: EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: Colors.orange.shade50,
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: Colors.orange.shade100),
//                 ),
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.shopping_bag,
//                       color: Colors.deepOrange,
//                       size: 20,
//                     ),
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: Text(
//                         itemsText,
//                         style: GoogleFonts.poppins(
//                           fontSize: 13,
//                           color: Colors.black87,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               SizedBox(height: 12),

//               // Order Amount
//               Container(
//                 padding: EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: Colors.green.shade50,
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: Colors.green.shade200),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.payments,
//                           color: Colors.green.shade700,
//                           size: 20,
//                         ),
//                         SizedBox(width: 10),
//                         Text(
//                           "Order Total",
//                           style: GoogleFonts.poppins(
//                             fontSize: 13,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.black87,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       "\$${widget.order.amount.toStringAsFixed(2)}",
//                       style: GoogleFonts.poppins(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.green.shade700,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               // Bid Section
//               if (widget.order.status == 'pending') ...[
//                 SizedBox(height: 16),
//                 if (widget.hasBid)
//                   Container(
//                     padding: EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: Colors.blue.shade50,
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(color: Colors.blue.shade200),
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.check_circle,
//                           color: Colors.blue.shade700,
//                           size: 20,
//                         ),
//                         SizedBox(width: 10),
//                         Text(
//                           "Bid already submitted",
//                           style: GoogleFonts.poppins(
//                             fontSize: 13,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.blue.shade700,
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 else if (_showBidInput)
//                   Container(
//                     padding: EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(color: Colors.deepOrange.shade200),
//                     ),
//                     child: Column(
//                       children: [
//                         TextField(
//                           controller: _bidController,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                             labelText: 'Your Bid Amount',
//                             prefixText: '\$ ',
//                             prefixIcon: Icon(
//                               Icons.attach_money,
//                               color: Colors.deepOrange,
//                             ),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: BorderSide(
//                                 color: Colors.deepOrange,
//                                 width: 2,
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.symmetric(
//                               horizontal: 12,
//                               vertical: 12,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: OutlinedButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     _showBidInput = false;
//                                     _bidController.clear();
//                                   });
//                                 },
//                                 style: OutlinedButton.styleFrom(
//                                   foregroundColor: Colors.grey,
//                                   side: BorderSide(color: Colors.grey.shade300),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   padding: EdgeInsets.symmetric(vertical: 12),
//                                 ),
//                                 child: Text(
//                                   'Cancel',
//                                   style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 10),
//                             Expanded(
//                               child: ElevatedButton(
//                                 onPressed: _submitBid,
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.deepOrange,
//                                   foregroundColor: Colors.white,
//                                   elevation: 0,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   padding: EdgeInsets.symmetric(vertical: 12),
//                                 ),
//                                 child: Text(
//                                   'Submit Bid',
//                                   style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   )
//                 else
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton.icon(
//                       onPressed: () {
//                         setState(() {
//                           _showBidInput = true;
//                         });
//                       },
//                       icon: Icon(Icons.gavel, size: 20),
//                       label: Text(
//                         'Place Your Bid',
//                         style: GoogleFonts.poppins(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14,
//                         ),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.deepOrange,
//                         foregroundColor: Colors.white,
//                         elevation: 2,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         padding: EdgeInsets.symmetric(vertical: 14),
//                       ),
//                     ),
//                   ),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLocationRow({
//     required IconData icon,
//     required Color iconColor,
//     required String label,
//     required String address,
//   }) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           padding: EdgeInsets.all(6),
//           decoration: BoxDecoration(
//             color: iconColor.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Icon(icon, color: iconColor, size: 18),
//         ),
//         SizedBox(width: 10),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 label,
//                 style: GoogleFonts.poppins(
//                   fontSize: 11,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.grey[600],
//                 ),
//               ),
//               SizedBox(height: 2),
//               Text(
//                 address,
//                 style: GoogleFonts.poppins(
//                   fontSize: 13,
//                   color: Colors.black87,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// 3
import 'package:flutter/material.dart';
import 'package:foodhub/models/order_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class RiderOrderCard extends StatefulWidget {
  final OrderModel order;
  final bool hasBid;
  final Function(double bidAmount) onBidSubmit;

  const RiderOrderCard({
    super.key,
    required this.order,
    required this.hasBid,
    required this.onBidSubmit,
  });

  @override
  State<RiderOrderCard> createState() => _RiderOrderCardState();
}

class _RiderOrderCardState extends State<RiderOrderCard> {
  final _bidController = TextEditingController();
  bool _showBidInput = false;

  @override
  void dispose() {
    _bidController.dispose();
    super.dispose();
  }

  String _formatTime(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  // Color _getStatusColor() {
  //   switch (widget.order.status) {
  //     case 'pending':
  //       return Colors.orange;
  //     case 'assigned':
  //       return Colors.blue;
  //     case 'inTransit':
  //       return Colors.purple;
  //     case 'delivered':
  //       return Colors.green;
  //     default:
  //       return Colors.grey;
  //   }
  // }

  // String _getStatusText() {
  //   switch (widget.order.status) {
  //     case 'pending':
  //       return 'New Order';
  //     case 'assigned':
  //       return 'Assigned';
  //     case 'inTransit':
  //       return 'In Transit';
  //     case 'delivered':
  //       return 'Delivered';
  //     default:
  //       return widget.order.status;
  //   }
  // }

  // 2
  String _getStatusText() {
    switch (widget.order.status) {
      case OrderStatus.pending:
        return 'New Order';
      case OrderStatus.assigned:
        return 'Assigned';
      case OrderStatus.inTransit:
        return 'In Transit';
      case OrderStatus.delivered:
        return 'Delivered';
      default:
        return widget.order.status.name; // fallback
    }
  }

  Color _getStatusColor() {
    switch (widget.order.status) {
      case OrderStatus.pending:
        return Colors.orange;
      case OrderStatus.assigned:
        return Colors.blue;
      case OrderStatus.inTransit:
        return Colors.purple;
      case OrderStatus.delivered:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  void _submitBid() {
    final amount = double.tryParse(_bidController.text);
    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid bid amount'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
      return;
    }

    widget.onBidSubmit(amount);
    setState(() {
      _showBidInput = false;
      _bidController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;
    final isMediumScreen = screenWidth >= 360 && screenWidth < 400;

    // Responsive sizing
    final headerFontSize = isSmallScreen ? 14.0 : 16.0;
    final timeFontSize = isSmallScreen ? 10.0 : 11.0;
    final statusFontSize = isSmallScreen ? 10.0 : 11.0;
    final contentFontSize = isSmallScreen ? 12.0 : 13.0;
    final labelFontSize = isSmallScreen ? 13.0 : 14.0;
    final amountFontSize = isSmallScreen ? 16.0 : 18.0;
    final iconSize = isSmallScreen ? 18.0 : 20.0;
    final smallIconSize = isSmallScreen ? 16.0 : 18.0;
    final padding = isSmallScreen ? 12.0 : 16.0;
    final innerPadding = isSmallScreen ? 10.0 : 12.0;

    final itemsText = widget.order.items.isNotEmpty
        ? widget.order.items
              .map((item) => '${item['quantity']}x ${item['name']}')
              .join(' • ')
        : 'No items';

    return Card(
      elevation: 3,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(isSmallScreen ? 12 : 16),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isSmallScreen ? 12 : 16),
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with Order ID and Status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(isSmallScreen ? 6 : 8),
                          decoration: BoxDecoration(
                            color: Colors.deepOrange.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(
                              isSmallScreen ? 8 : 10,
                            ),
                          ),
                          child: Icon(
                            Icons.receipt_long,
                            color: Colors.deepOrange,
                            size: iconSize,
                          ),
                        ),
                        SizedBox(width: isSmallScreen ? 8 : 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Order #${widget.order.id.substring(0, isSmallScreen ? 6 : 8)}",
                                style: GoogleFonts.poppins(
                                  fontSize: headerFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                _formatTime(widget.order.createdAt),
                                style: GoogleFonts.poppins(
                                  fontSize: timeFontSize,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isSmallScreen ? 8 : 12,
                      vertical: isSmallScreen ? 4 : 6,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor().withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: _getStatusColor().withOpacity(0.3),
                      ),
                    ),
                    child: Text(
                      _getStatusText(),
                      style: GoogleFonts.poppins(
                        fontSize: statusFontSize,
                        fontWeight: FontWeight.w600,
                        color: _getStatusColor(),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: isSmallScreen ? 12 : 16),

              // Customer Info
              Container(
                padding: EdgeInsets.all(innerPadding),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(isSmallScreen ? 10 : 12),
                  border: Border.all(color: Colors.blue.shade100),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(isSmallScreen ? 6 : 8),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.person,
                        color: Colors.blue.shade700,
                        size: iconSize,
                      ),
                    ),
                    SizedBox(width: isSmallScreen ? 10 : 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.order.customerName,
                            style: GoogleFonts.poppins(
                              fontSize: labelFontSize,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 2),
                          Text(
                            widget.order.customerPhone,
                            style: GoogleFonts.poppins(
                              fontSize: contentFontSize,
                              color: Colors.grey[700],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: isSmallScreen ? 10 : 12),

              // Pickup Location
              _buildLocationRow(
                icon: Icons.restaurant,
                iconColor: Colors.green,
                label: "Pickup",
                address: widget.order.pickupAddress,
                isSmallScreen: isSmallScreen,
                iconSize: smallIconSize,
                contentFontSize: contentFontSize,
              ),

              SizedBox(height: isSmallScreen ? 6 : 8),

              // Dropoff Location
              _buildLocationRow(
                icon: Icons.location_on,
                iconColor: Colors.red,
                label: "Dropoff",
                address: widget.order.dropoffAddress,
                isSmallScreen: isSmallScreen,
                iconSize: smallIconSize,
                contentFontSize: contentFontSize,
              ),

              SizedBox(height: isSmallScreen ? 10 : 12),

              // Items
              Container(
                padding: EdgeInsets.all(innerPadding),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(isSmallScreen ? 10 : 12),
                  border: Border.all(color: Colors.orange.shade100),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.shopping_bag,
                      color: Colors.deepOrange,
                      size: iconSize,
                    ),
                    SizedBox(width: isSmallScreen ? 8 : 10),
                    Expanded(
                      child: Text(
                        itemsText,
                        style: GoogleFonts.poppins(
                          fontSize: contentFontSize,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: isSmallScreen ? 10 : 12),

              // Order Amount
              Container(
                padding: EdgeInsets.all(innerPadding),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(isSmallScreen ? 10 : 12),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.payments,
                          color: Colors.green.shade700,
                          size: iconSize,
                        ),
                        SizedBox(width: isSmallScreen ? 8 : 10),
                        Text(
                          "Order Total",
                          style: GoogleFonts.poppins(
                            fontSize: contentFontSize,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "\$${widget.order.amount.toStringAsFixed(2)}",
                      style: GoogleFonts.poppins(
                        fontSize: amountFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade700,
                      ),
                    ),
                  ],
                ),
              ),

              // Bid Section
              // if (widget.order.status == 'pending') ...[
              if (widget.order.status == OrderStatus.pending) ...[
                SizedBox(height: isSmallScreen ? 12 : 16),
                if (widget.hasBid)
                  Container(
                    padding: EdgeInsets.all(innerPadding),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(
                        isSmallScreen ? 10 : 12,
                      ),
                      border: Border.all(color: Colors.blue.shade200),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.blue.shade700,
                          size: iconSize,
                        ),
                        SizedBox(width: isSmallScreen ? 8 : 10),
                        Expanded(
                          child: Text(
                            "Bid already submitted",
                            style: GoogleFonts.poppins(
                              fontSize: contentFontSize,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else if (_showBidInput)
                  Container(
                    padding: EdgeInsets.all(innerPadding),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        isSmallScreen ? 10 : 12,
                      ),
                      border: Border.all(color: Colors.deepOrange.shade200),
                    ),
                    child: Column(
                      children: [
                        TextField(
                          controller: _bidController,
                          keyboardType: TextInputType.number,
                          style: GoogleFonts.poppins(fontSize: contentFontSize),
                          decoration: InputDecoration(
                            labelText: 'Your Bid Amount',
                            labelStyle: GoogleFonts.poppins(
                              fontSize: contentFontSize,
                            ),
                            prefixText: '\$ ',
                            prefixIcon: Icon(
                              Icons.attach_money,
                              color: Colors.deepOrange,
                              size: iconSize,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                isSmallScreen ? 8 : 10,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                isSmallScreen ? 8 : 10,
                              ),
                              borderSide: BorderSide(
                                color: Colors.deepOrange,
                                width: 2,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: isSmallScreen ? 10 : 12,
                              vertical: isSmallScreen ? 10 : 12,
                            ),
                            isDense: isSmallScreen,
                          ),
                        ),
                        SizedBox(height: isSmallScreen ? 8 : 10),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    _showBidInput = false;
                                    _bidController.clear();
                                  });
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.grey,
                                  side: BorderSide(color: Colors.grey.shade300),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      isSmallScreen ? 8 : 10,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: isSmallScreen ? 10 : 12,
                                  ),
                                ),
                                child: Text(
                                  'Cancel',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: contentFontSize,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: isSmallScreen ? 8 : 10),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: _submitBid,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepOrange,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      isSmallScreen ? 8 : 10,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: isSmallScreen ? 10 : 12,
                                  ),
                                ),
                                child: Text(
                                  'Submit Bid',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: contentFontSize,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                else
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _showBidInput = true;
                        });
                      },
                      icon: Icon(Icons.gavel, size: iconSize),
                      label: Text(
                        'Place Your Bid',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: labelFontSize,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            isSmallScreen ? 10 : 12,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: isSmallScreen ? 12 : 14,
                        ),
                      ),
                    ),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationRow({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String address,
    required bool isSmallScreen,
    required double iconSize,
    required double contentFontSize,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(isSmallScreen ? 5 : 6),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: iconColor, size: iconSize),
        ),
        SizedBox(width: isSmallScreen ? 8 : 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: isSmallScreen ? 10 : 11,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 2),
              Text(
                address,
                style: GoogleFonts.poppins(
                  fontSize: contentFontSize,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
