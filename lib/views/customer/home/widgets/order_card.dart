// // lib/widgets/order_card.dart
// import 'package:flutter/material.dart';
// import 'package:foodhub/models/order_model.dart';

// class OrderCard extends StatelessWidget {
//   final OrderModel order;
//   final VoidCallback onAssign;
//   final VoidCallback onViewBids;
//   final VoidCallback onTrack;

//   const OrderCard({
//     Key? key,
//     required this.order,
//     required this.onAssign,
//     required this.onViewBids,
//     required this.onTrack,
//   }) : super(key: key);

//   Widget _statusChip(String status) {
//     Color color;
//     switch (status) {
//       case 'assigned':
//         color = Colors.orange;
//         break;
//       case 'picked':
//         color = Colors.blue;
//         break;
//       case 'inTransit':
//         color = Colors.indigo;
//         break;
//       case 'delivered':
//         color = Colors.green;
//         break;
//       case 'cancelled':
//         color = Colors.red;
//         break;
//       default:
//         color = Colors.grey;
//     }
//     return Chip(
//       label: Text(status.toUpperCase()),
//       backgroundColor: color.withOpacity(.15),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Order #${order.id}',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 _statusChip(order.status.name),
//               ],
//             ),
//             SizedBox(height: 8),
//             Text('${order.customerName} • ${order.customerPhone}'),
//             SizedBox(height: 8),
//             Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     'Pickup: ${order.pickupAddress}',
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 4),
//             Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     'Drop: ${order.dropoffAddress}',
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 8),
//             Row(
//               children: [
//                 Text('Amount: ${order.amount.toStringAsFixed(2)}'),
//                 Spacer(),
//                 TextButton.icon(
//                   onPressed: onViewBids,
//                   icon: Icon(Icons.gavel),
//                   label: Text('View Bids'),
//                 ),
//                 ElevatedButton(
//                   onPressed: onAssign,
//                   child: Text('Assign Rider'),
//                 ),
//                 SizedBox(width: 8),
//                 OutlinedButton(onPressed: onTrack, child: Text('Track')),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// 2
// lib/widgets/order_card.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodhub/models/order_model.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  final VoidCallback onAssign;
  final VoidCallback onViewBids;
  final VoidCallback onTrack;

  const OrderCard({
    Key? key,
    required this.order,
    required this.onAssign,
    required this.onViewBids,
    required this.onTrack,
  }) : super(key: key);

  Widget _statusChip(String status) {
    Color color;
    String label;
    IconData icon;

    switch (status) {
      case 'assigned':
        color = Colors.orange;
        label = 'ASSIGNED';
        icon = Icons.assignment_ind;
        break;
      case 'picked':
        color = Colors.blue;
        label = 'PICKED';
        icon = Icons.shopping_bag;
        break;
      case 'inTransit':
        color = Colors.indigo;
        label = 'IN TRANSIT';
        icon = Icons.local_shipping;
        break;
      case 'delivered':
        color = Colors.green;
        label = 'DELIVERED';
        icon = Icons.check_circle;
        break;
      case 'cancelled':
        color = Colors.red;
        label = 'CANCELLED';
        icon = Icons.cancel;
        break;
      default:
        color = Colors.deepOrange;
        label = 'PENDING';
        icon = Icons.pending;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = order.items ?? [];
    final hasBids = (order.bids ?? {}).isNotEmpty;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.deepOrange.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.deepOrange.withOpacity(0.08),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.deepOrange.withOpacity(0.05),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
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
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.orderNumber != null
                                  ? 'Order #${order.orderNumber}'
                                  : 'Order #${order.id.substring(0, 8)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 2),
                            Text(
                              '${_formatTimestamp(order.createdAt)}',
                              style: TextStyle(
                                fontSize: 11,
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
                _statusChip(order.status.name),
              ],
            ),
          ),

          // Customer Details Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.deepOrange.withOpacity(0.1),
                      child: Icon(
                        Icons.person,
                        color: Colors.deepOrange,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.customerName,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 2),
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                size: 12,
                                color: Colors.grey[600],
                              ),
                              SizedBox(width: 4),
                              Text(
                                order.customerPhone,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16),
                Divider(height: 1),
                SizedBox(height: 16),

                // Location Details
                _locationRow(
                  icon: Icons.location_on,
                  label: 'Pickup',
                  address: order.pickupAddress,
                  color: Colors.green,
                ),
                SizedBox(height: 12),
                _locationRow(
                  icon: Icons.flag,
                  label: 'Dropoff',
                  address: order.dropoffAddress,
                  color: Colors.red,
                ),

                // Items Section
                if (items.isNotEmpty) ...[
                  SizedBox(height: 16),
                  Divider(height: 1),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.shopping_bag,
                        size: 16,
                        color: Colors.deepOrange,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Order Items',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: items.map((item) {
                      final itemData = item as Map<String, dynamic>;
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.deepOrange.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                '${itemData['quantity']}x',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ),
                            SizedBox(width: 6),
                            Text(
                              itemData['name'],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],

                SizedBox(height: 16),
                Divider(height: 1),
                SizedBox(height: 12),

                // Amount and Actions
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Amount',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '\$${order.amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ],
                    ),
                    if (hasBids)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.blue.withOpacity(0.3),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.gavel, size: 14, color: Colors.blue),
                            SizedBox(width: 4),
                            Text(
                              '${(order.bids ?? {}).length} Bid(s)',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),

          // Action Buttons
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                if (hasBids)
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: onViewBids,
                      icon: Icon(Icons.gavel, size: 16),
                      label: Text('View Bids'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.blue,
                        side: BorderSide(color: Colors.blue),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                if (hasBids) SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onAssign,
                    icon: Icon(Icons.person_add, size: 16),
                    label: Text('Assign'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      elevation: 0,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                OutlinedButton(
                  onPressed: onTrack,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.deepOrange,
                    side: BorderSide(color: Colors.deepOrange),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(12),
                    minimumSize: Size(48, 48),
                  ),
                  child: Icon(Icons.location_on, size: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _locationRow({
    required IconData icon,
    required String label,
    required String address,
    required Color color,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 16, color: color),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 2),
              Text(
                address,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatTimestamp(dynamic timestamp) {
    if (timestamp == null) return 'Just now';

    try {
      final DateTime dateTime = timestamp is Timestamp
          ? timestamp.toDate()
          : DateTime.parse(timestamp.toString());

      final now = DateTime.now();
      final difference = now.difference(dateTime);

      final day = dateTime.day.toString().padLeft(2, '0');
      final month = dateTime.month.toString().padLeft(2, '0');
      final year = dateTime.year;
      final hour = dateTime.hour.toString().padLeft(2, '0');
      final minute = dateTime.minute.toString().padLeft(2, '0');
      final absolute = '$day/$month/$year $hour:$minute';

      String relative;
      if (difference.inMinutes < 1) {
        relative = 'Just now';
      } else if (difference.inMinutes < 60) {
        relative = '${difference.inMinutes}m ago';
      } else if (difference.inHours < 24) {
        relative = '${difference.inHours}h ago';
      } else {
        relative = '${difference.inDays}d ago';
      }

      return '$absolute ($relative)';
    } catch (e) {
      return 'Unknown';
    }
  }
}
