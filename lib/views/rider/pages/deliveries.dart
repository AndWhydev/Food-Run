// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class DeliveriesHistoryScreen extends StatelessWidget {
//   const DeliveriesHistoryScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final deliveries = [
//       {
//         "restaurant": "Burger Hub",
//         "date": "Oct 28, 2025",
//         "time": "6:45 PM",
//         "amount": "\$12.50",
//         "status": "Delivered",
//         "dropoff": "45B Street, Lahore",
//       },
//       {
//         "restaurant": "Pizza Mania",
//         "date": "Oct 27, 2025",
//         "time": "9:10 PM",
//         "amount": "\$18.90",
//         "status": "Delivered",
//         "dropoff": "House #12, Model Town",
//       },
//       {
//         "restaurant": "Kebab Kingdom",
//         "date": "Oct 25, 2025",
//         "time": "2:30 PM",
//         "amount": "\$15.20",
//         "status": "Cancelled",
//         "dropoff": "Block C, DHA Phase 3",
//       },
//     ];

//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // HEADER
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//               decoration: const BoxDecoration(
//                 color: Colors.deepOrange,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(20),
//                   bottomRight: Radius.circular(20),
//                 ),
//               ),
//               child: Text(
//                 "Delivery History",
//                 style: GoogleFonts.poppins(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             // HISTORY LIST
//             Expanded(
//               child: ListView.builder(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 itemCount: deliveries.length,
//                 itemBuilder: (context, index) {
//                   final delivery = deliveries[index];
//                   return _DeliveryCard(
//                     restaurant: delivery["restaurant"]!,
//                     date: delivery["date"]!,
//                     time: delivery["time"]!,
//                     amount: delivery["amount"]!,
//                     status: delivery["status"]!,
//                     dropoff: delivery["dropoff"]!,
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _DeliveryCard extends StatelessWidget {
//   final String restaurant;
//   final String date;
//   final String time;
//   final String amount;
//   final String status;
//   final String dropoff;

//   const _DeliveryCard({
//     required this.restaurant,
//     required this.date,
//     required this.time,
//     required this.amount,
//     required this.status,
//     required this.dropoff,
//   });

//   Color _statusColor() {
//     switch (status) {
//       case "Delivered":
//         return Colors.green;
//       case "Cancelled":
//         return Colors.redAccent;
//       default:
//         return Colors.orange;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.white,
//       elevation: 5,
//       margin: const EdgeInsets.only(bottom: 14),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//       shadowColor: Colors.deepOrange.withOpacity(0.3),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // HEADER ROW
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   restaurant,
//                   style: GoogleFonts.poppins(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 10,
//                     vertical: 4,
//                   ),
//                   decoration: BoxDecoration(
//                     color: _statusColor().withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Text(
//                     status,
//                     style: GoogleFonts.poppins(
//                       color: _statusColor(),
//                       fontSize: 13,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 8),

//             // DATE & TIME
//             Row(
//               children: [
//                 const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
//                 const SizedBox(width: 6),
//                 Text(
//                   "$date  |  $time",
//                   style: GoogleFonts.poppins(
//                     fontSize: 13,
//                     color: Colors.grey[600],
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 10),

//             // DROP LOCATION
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Icon(
//                   Icons.location_on,
//                   size: 16,
//                   color: Colors.deepOrange,
//                 ),
//                 const SizedBox(width: 6),
//                 Expanded(
//                   child: Text(
//                     dropoff,
//                     style: GoogleFonts.poppins(
//                       fontSize: 13,
//                       color: Colors.grey[700],
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 10),
//             Divider(color: Colors.grey[300]),

//             // AMOUNT
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Total Earned",
//                   style: GoogleFonts.poppins(
//                     fontSize: 13,
//                     color: Colors.grey[600],
//                   ),
//                 ),
//                 Text(
//                   amount,
//                   style: GoogleFonts.poppins(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.deepOrange,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// 2
import 'package:flutter/material.dart';
import 'package:foodhub/models/order_model.dart';
import 'package:foodhub/views/rider/provider/rider_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DeliveriesScreen extends StatefulWidget {
  const DeliveriesScreen({super.key});

  @override
  State<DeliveriesScreen> createState() => _DeliveriesScreenState();
}

class _DeliveriesScreenState extends State<DeliveriesScreen> {
  String _selectedTab = 'active'; // active, completed, all

  @override
  Widget build(BuildContext context) {
    final riderProvider = Provider.of<RiderProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepOrange, Colors.orangeAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.local_shipping,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        "My Deliveries",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // TAB BUTTONS
                  Row(
                    children: [
                      _buildTabButton('Active', 'active'),
                      SizedBox(width: 8),
                      _buildTabButton('Completed', 'completed'),
                      SizedBox(width: 8),
                      _buildTabButton('All', 'all'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ORDERS LIST
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  setState(() {});
                  await Future.delayed(Duration(milliseconds: 500));
                },
                color: Colors.deepOrange,
                child: _buildOrdersList(riderProvider),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String label, String value) {
    final isSelected = _selectedTab == value;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTab = value;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.deepOrange : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrdersList(RiderProvider riderProvider) {
    return StreamBuilder<List<OrderModel>>(
      stream: _getOrdersStream(riderProvider),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: Colors.deepOrange),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.red.shade200),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.error_outline, size: 48, color: Colors.red),
                    SizedBox(height: 12),
                    Text(
                      'Error loading deliveries',
                      style: GoogleFonts.poppins(
                        color: Colors.red.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        final orders = snapshot.data ?? [];

        if (orders.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _selectedTab == 'active'
                            ? Icons.inbox_outlined
                            : Icons.history,
                        size: 64,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      _selectedTab == 'active'
                          ? 'No active deliveries'
                          : 'No delivery history',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      _selectedTab == 'active'
                          ? 'Your assigned orders will appear here'
                          : 'Completed deliveries will show here',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          itemCount: orders.length,
          separatorBuilder: (_, __) => SizedBox(height: 12),
          itemBuilder: (context, index) {
            final order = orders[index];
            return _DeliveryCard(
              order: order,
              onStatusUpdate: () {
                setState(() {});
              },
            );
          },
        );
      },
    );
  }

  Stream<List<OrderModel>> _getOrdersStream(RiderProvider riderProvider) {
    if (_selectedTab == 'active') {
      return riderProvider.listenMyOrders();
    } else if (_selectedTab == 'completed') {
      return riderProvider.listenCompletedOrders();
    } else {
      return riderProvider.listenAllMyOrders();
    }
  }
}

class _DeliveryCard extends StatelessWidget {
  final OrderModel order;
  final VoidCallback onStatusUpdate;

  const _DeliveryCard({required this.order, required this.onStatusUpdate});

  Color _statusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.assigned:
        return Colors.blue;
      case OrderStatus.inTransit:
        return Colors.orange;
      case OrderStatus.delivered:
        return Colors.green;
      case OrderStatus.cancelled:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _statusLabel(OrderStatus status) {
    switch (status) {
      case OrderStatus.assigned:
        return 'Assigned';
      case OrderStatus.inTransit:
        return 'In Transit';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.cancelled:
        return 'Cancelled';
      default:
        return status.toString().split('.').last;
    }
  }

  IconData _statusIcon(OrderStatus status) {
    switch (status) {
      case OrderStatus.assigned:
        return Icons.assignment;
      case OrderStatus.inTransit:
        return Icons.local_shipping;
      case OrderStatus.delivered:
        return Icons.check_circle;
      case OrderStatus.cancelled:
        return Icons.cancel;
      default:
        return Icons.info;
    }
  }

  String _formatTimestamp(dynamic timestamp) {
    if (timestamp == null) return 'N/A';

    try {
      DateTime dateTime;
      if (timestamp is DateTime) {
        dateTime = timestamp;
      } else {
        dateTime = timestamp.toDate();
      }
      return DateFormat('MMM dd, yyyy • hh:mm a').format(dateTime);
    } catch (e) {
      return 'N/A';
    }
  }

  double _getBidAmount(OrderModel order, BuildContext context) {
    // final riderProvider = Provider.of<RiderProvider>(
    //   navigatorKey.currentContext!,
    //   listen: false,
    // );
    final riderProvider = Provider.of<RiderProvider>(context, listen: false);

    final riderId = riderProvider.riderId;

    if (order.bids != null && order.bids!.containsKey(riderId)) {
      final bidData = order.bids![riderId] as Map<String, dynamic>;
      return (bidData['amount'] as num?)?.toDouble() ?? 0.0;
    }
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final riderProvider = Provider.of<RiderProvider>(context, listen: false);
    final bidAmount = _getBidAmount(order, context);

    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER - ORDER ID & STATUS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.receipt_long,
                        color: Colors.deepOrange,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order #${order.id.substring(0, 8)}',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          _formatTimestamp(order.createdAt),
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: _statusColor(order.status).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _statusIcon(order.status),
                        size: 14,
                        color: _statusColor(order.status),
                      ),
                      SizedBox(width: 4),
                      Text(
                        _statusLabel(order.status),
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: _statusColor(order.status),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 14),
            Divider(color: Colors.grey[200], height: 1),
            SizedBox(height: 14),

            // CUSTOMER INFO
            Row(
              children: [
                Icon(Icons.person, size: 18, color: Colors.grey[600]),
                SizedBox(width: 8),
                Text(
                  order.customerName ?? 'Customer',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            // DELIVERY ADDRESS
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.location_on, size: 18, color: Colors.deepOrange),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivery Address',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        order.dropoffAddress ?? 'No address provided',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.black87,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            // ORDER ITEMS
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.shopping_bag,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Order Items',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  // ...order.items.map((item) {
                  //   return Padding(
                  //     padding: const EdgeInsets.only(bottom: 4),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Expanded(
                  //           child: Text(
                  //             '${item.quantity}x ${item.name}',
                  //             style: GoogleFonts.poppins(
                  //               fontSize: 13,
                  //               color: Colors.black87,
                  //             ),
                  //           ),
                  //         ),
                  //         Text(
                  //           '\$${item.price.toStringAsFixed(2)}',
                  //           style: GoogleFonts.poppins(
                  //             fontSize: 13,
                  //             fontWeight: FontWeight.w500,
                  //             color: Colors.black87,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   );
                  // }).toList(),

                  //
                  ...(order.items as List<dynamic>).map((item) {
                    final itemMap = item as Map<String, dynamic>;
                    final quantity = itemMap['quantity'] ?? 1;
                    final name = itemMap['name'] ?? 'Unknown Item';
                    final price = (itemMap['price'] as num?)?.toDouble() ?? 0.0;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${quantity}x $name',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Text(
                            // '\${price.toStringAsFixed(2)}',
                            "\$ ${price.toStringAsFixed(2)}",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),

            SizedBox(height: 14),
            Divider(color: Colors.grey[200], height: 1),
            SizedBox(height: 14),

            // TOTALS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order Total',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      '\$${order.amount.toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                if (bidAmount > 0)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Your Earnings',
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            color: Colors.green[700],
                          ),
                        ),
                        Text(
                          '\$${bidAmount.toStringAsFixed(2)}',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),

            // ACTION BUTTONS
            if (order.status == OrderStatus.assigned ||
                order.status == OrderStatus.inTransit) ...[
              SizedBox(height: 16),
              _buildActionButtons(context, riderProvider, order),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    RiderProvider riderProvider,
    OrderModel order,
  ) {
    if (order.status == OrderStatus.assigned) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () async {
            try {
              await riderProvider.startDelivery(order.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.white),
                      SizedBox(width: 12),
                      Text(
                        'Delivery started!',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
              onStatusUpdate();
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error: $e'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          icon: Icon(Icons.play_arrow, size: 20),
          label: Text(
            'Start Delivery',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
          ),
        ),
      );
    } else if (order.status == OrderStatus.inTransit) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () async {
            // Show confirmation dialog
            final confirm = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                title: Text(
                  'Complete Delivery',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                content: Text(
                  'Have you successfully delivered this order?',
                  style: GoogleFonts.poppins(),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.poppins(color: Colors.grey),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Confirm',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );

            if (confirm == true) {
              try {
                await riderProvider.completeDelivery(order.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.white),
                        SizedBox(width: 12),
                        Text(
                          'Delivery completed successfully!',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
                onStatusUpdate();
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error: $e'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            }
          },
          icon: Icon(Icons.check_circle, size: 20),
          label: Text(
            'Complete Delivery',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
          ),
        ),
      );
    }

    return SizedBox.shrink();
  }
}

// Global navigator key for context access
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
