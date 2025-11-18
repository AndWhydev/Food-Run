// import 'package:flutter/material.dart';
// import 'package:foodhub/models/order_model.dart';
// import 'package:foodhub/models/user_model.dart';
// import 'package:foodhub/providers/admin_provider.dart';
// import 'package:foodhub/views/customer/home/widgets/order_card.dart';
// import 'package:foodhub/views/customer/home/widgets/rider_tile.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AdminHomeScreen extends StatefulWidget {
//   const AdminHomeScreen({super.key});

//   @override
//   State<AdminHomeScreen> createState() => _AdminHomeScreenState();
// }

// class _AdminHomeScreenState extends State<AdminHomeScreen> {
//   late AdminProvider adminProvider;

//   @override
//   void initState() {
//     super.initState();
//     adminProvider = Provider.of<AdminProvider>(context, listen: false);
//   }

//   Widget _statsRow() {
//     return FutureBuilder(
//       future: Future.wait([
//         adminProvider.countOrdersWithStatus('pending'),
//         adminProvider.countOrdersWithStatus('assigned'),
//         adminProvider.countOrdersWithStatus('inTransit'),
//         adminProvider.countOrdersWithStatus('delivered'),
//       ]),
//       builder: (context, AsyncSnapshot<List<int>> snap) {
//         final values = snap.data ?? [0, 0, 0, 0];
//         return Row(
//           children: [
//             _smallCard('New', values[0], Colors.orange, Icons.fiber_new),
//             SizedBox(width: 12),
//             _smallCard(
//               'Assigned',
//               values[1],
//               Colors.blue,
//               Icons.assignment_ind,
//             ),
//             SizedBox(width: 12),
//             _smallCard(
//               'Active',
//               values[2],
//               Colors.purple,
//               Icons.local_shipping,
//             ),
//             SizedBox(width: 12),
//             _smallCard(
//               'Completed',
//               values[3],
//               Colors.green,
//               Icons.check_circle,
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _smallCard(String title, int count, Color color, IconData icon) {
//     return Expanded(
//       child: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [color.withOpacity(0.7), color],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: color.withOpacity(0.3),
//               blurRadius: 8,
//               offset: Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Icon(icon, color: Colors.white, size: 28),
//               SizedBox(height: 12),
//               Text(
//                 count.toString(),
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.white.withOpacity(0.9),
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _openAssignSheet(OrderModel order, List<UserModel> riders) {
//     showModalBottomSheet(
//       context: context,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (ctx) {
//         return SafeArea(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 margin: EdgeInsets.only(top: 12),
//                 width: 40,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Assign Rider',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 4),
//                     Text(
//                       'Order ID: ${order.id}',
//                       style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//                     ),
//                   ],
//                 ),
//               ),
//               Divider(height: 1),
//               Container(
//                 height: 300,
//                 child: ListView.builder(
//                   itemCount: riders.length,
//                   itemBuilder: (context, index) {
//                     final r = riders[index];
//                     return RiderTile(
//                       rider: r,
//                       onAssign: () async {
//                         Navigator.of(context).pop();
//                         await adminProvider.assignRiderToOrder(
//                           orderId: order.id,
//                           rider: r,
//                         );
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('Assigned ${r.name}'),
//                             behavior: SnackBarBehavior.floating,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _nearbyRiders() {
//     return StreamBuilder<List<UserModel>>(
//       stream: adminProvider.listenRiders(onlyOnline: true),
//       builder: (context, snap) {
//         if (snap.hasError)
//           return Container(
//             height: 120,
//             child: Center(
//               child: Text(
//                 'Error loading riders',
//                 style: TextStyle(color: Colors.red),
//               ),
//             ),
//           );
//         if (!snap.hasData)
//           return Container(
//             height: 120,
//             child: Center(child: CircularProgressIndicator()),
//           );
//         final riders = snap.data!;
//         if (riders.isEmpty)
//           return Container(
//             height: 120,
//             decoration: BoxDecoration(
//               color: Colors.grey[100],
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Center(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(Icons.person_off, size: 40, color: Colors.grey),
//                   SizedBox(height: 8),
//                   Text(
//                     'No riders online',
//                     style: TextStyle(color: Colors.grey[600]),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         return Container(
//           height: 120,
//           child: ListView.separated(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.symmetric(vertical: 8),
//             itemCount: riders.length,
//             separatorBuilder: (_, __) => SizedBox(width: 12),
//             itemBuilder: (context, i) => GestureDetector(
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (_) => AlertDialog(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     title: Row(
//                       children: [
//                         CircleAvatar(
//                           radius: 20,
//                           backgroundImage: riders[i].profileImage != null
//                               ? NetworkImage(riders[i].profileImage!)
//                               : null,
//                           child: riders[i].profileImage == null
//                               ? Icon(Icons.person, size: 20)
//                               : null,
//                         ),
//                         SizedBox(width: 12),
//                         Expanded(
//                           child: Text(
//                             riders[i].name,
//                             style: TextStyle(fontSize: 18),
//                           ),
//                         ),
//                       ],
//                     ),
//                     content: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.phone,
//                               size: 18,
//                               color: Colors.grey[600],
//                             ),
//                             SizedBox(width: 8),
//                             Text(riders[i].phone),
//                           ],
//                         ),
//                         SizedBox(height: 8),
//                         Row(
//                           children: [
//                             Icon(Icons.star, size: 18, color: Colors.amber),
//                             SizedBox(width: 8),
//                             Text('${riders[i].rating ?? 'N/A'}'),
//                           ],
//                         ),
//                       ],
//                     ),
//                     actions: [
//                       TextButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: Text('Close'),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//               child: Container(
//                 width: 90,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: Colors.grey[200]!),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.05),
//                       blurRadius: 8,
//                       offset: Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Stack(
//                       children: [
//                         CircleAvatar(
//                           radius: 30,
//                           backgroundImage: riders[i].profileImage != null
//                               ? NetworkImage(riders[i].profileImage!)
//                               : null,
//                           child: riders[i].profileImage == null
//                               ? Icon(Icons.person, size: 30)
//                               : null,
//                         ),
//                         Positioned(
//                           bottom: 0,
//                           right: 0,
//                           child: Container(
//                             width: 14,
//                             height: 14,
//                             decoration: BoxDecoration(
//                               color: Colors.green,
//                               shape: BoxShape.circle,
//                               border: Border.all(color: Colors.white, width: 2),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 8),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 4),
//                       child: Text(
//                         riders[i].name,
//                         overflow: TextOverflow.ellipsis,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final ordersStream = adminProvider.listenOrders();
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: Text(
//           'Admin Dashboard',
//           style: TextStyle(
//             color: Colors.black87,
//             fontWeight: FontWeight.bold,
//             fontSize: 22,
//           ),
//         ),
//         actions: [
//           Container(
//             margin: EdgeInsets.only(right: 8),
//             child: IconButton(
//               onPressed: _showAddOrderDialog,
//               icon: Container(
//                 padding: EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(Icons.add, color: Colors.white, size: 20),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _statsRow(),
//               SizedBox(height: 24),
//               Row(
//                 children: [
//                   Icon(Icons.motorcycle, color: Colors.blue, size: 22),
//                   SizedBox(width: 8),
//                   Text(
//                     'Nearby Riders',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 12),
//               _nearbyRiders(),
//               SizedBox(height: 24),
//               Row(
//                 children: [
//                   Icon(Icons.receipt_long, color: Colors.blue, size: 22),
//                   SizedBox(width: 8),
//                   Text(
//                     'Live Orders',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 12),
//               StreamBuilder<List<OrderModel>>(
//                 stream: ordersStream,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasError)
//                     return Container(
//                       height: 200,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Center(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Icon(
//                               Icons.error_outline,
//                               size: 48,
//                               color: Colors.red,
//                             ),
//                             SizedBox(height: 8),
//                             Text('Error loading orders'),
//                           ],
//                         ),
//                       ),
//                     );
//                   if (!snapshot.hasData)
//                     return Container(
//                       height: 200,
//                       child: Center(child: CircularProgressIndicator()),
//                     );
//                   final orders = snapshot.data!;
//                   if (orders.isEmpty)
//                     return Container(
//                       height: 200,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Center(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Icon(Icons.inbox, size: 48, color: Colors.grey),
//                             SizedBox(height: 8),
//                             Text(
//                               'No orders yet',
//                               style: TextStyle(color: Colors.grey[600]),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   return StreamBuilder<List<UserModel>>(
//                     stream: adminProvider.listenRiders(onlyOnline: true),
//                     builder: (ctx, ridersSnap) {
//                       final riders = ridersSnap.data ?? [];
//                       return ListView.separated(
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         itemCount: orders.length,
//                         separatorBuilder: (_, __) => SizedBox(height: 12),
//                         itemBuilder: (context, index) {
//                           final order = orders[index];
//                           return OrderCard(
//                             order: order,
//                             onAssign: () => _openAssignSheet(order, riders),
//                             onViewBids: () {
//                               showModalBottomSheet(
//                                 context: context,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.vertical(
//                                     top: Radius.circular(20),
//                                   ),
//                                 ),
//                                 builder: (_) {
//                                   final bids = order.bids ?? {};
//                                   if (bids.isEmpty)
//                                     return Container(
//                                       height: 200,
//                                       child: Center(
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.min,
//                                           children: [
//                                             Icon(
//                                               Icons.gavel,
//                                               size: 48,
//                                               color: Colors.grey,
//                                             ),
//                                             SizedBox(height: 8),
//                                             Text(
//                                               'No bids yet',
//                                               style: TextStyle(
//                                                 color: Colors.grey[600],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     );
//                                   return Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       Container(
//                                         margin: EdgeInsets.only(top: 12),
//                                         width: 40,
//                                         height: 4,
//                                         decoration: BoxDecoration(
//                                           color: Colors.grey[300],
//                                           borderRadius: BorderRadius.circular(
//                                             2,
//                                           ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.all(16.0),
//                                         child: Text(
//                                           'Bids Received',
//                                           style: TextStyle(
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ),
//                                       Divider(height: 1),
//                                       Flexible(
//                                         child: ListView(
//                                           shrinkWrap: true,
//                                           children: bids.entries.map((e) {
//                                             final riderId = e.key;
//                                             final map =
//                                                 Map<String, dynamic>.from(
//                                                   e.value,
//                                                 );
//                                             return ListTile(
//                                               leading: CircleAvatar(
//                                                 child: Icon(Icons.person),
//                                               ),
//                                               title: Text('Rider: $riderId'),
//                                               subtitle: Text(
//                                                 'Amount: \$${map['amount']}',
//                                               ),
//                                               trailing: ElevatedButton(
//                                                 style: ElevatedButton.styleFrom(
//                                                   shape: RoundedRectangleBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                           8,
//                                                         ),
//                                                   ),
//                                                 ),
//                                                 child: Text('Assign'),
//                                                 onPressed: () async {
//                                                   Navigator.pop(context);
//                                                   final doc =
//                                                       await FirebaseFirestore
//                                                           .instance
//                                                           .collection('users')
//                                                           .doc(riderId)
//                                                           .get();
//                                                   final rider =
//                                                       UserModel.fromMap(
//                                                         doc.data()
//                                                             as Map<
//                                                               String,
//                                                               dynamic
//                                                             >,
//                                                         doc.id,
//                                                       );
//                                                   await adminProvider
//                                                       .assignRiderToOrder(
//                                                         orderId: order.id,
//                                                         rider: rider,
//                                                       );
//                                                 },
//                                               ),
//                                             );
//                                           }).toList(),
//                                         ),
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               );
//                             },
//                             onTrack: () {
//                               showDialog(
//                                 context: context,
//                                 builder: (_) => AlertDialog(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(16),
//                                   ),
//                                   title: Row(
//                                     children: [
//                                       Icon(
//                                         Icons.location_on,
//                                         color: Colors.blue,
//                                       ),
//                                       SizedBox(width: 8),
//                                       Text('Tracking'),
//                                     ],
//                                   ),
//                                   content: Text('Open map or tracking UI here'),
//                                   actions: [
//                                     TextButton(
//                                       onPressed: () => Navigator.pop(context),
//                                       child: Text('Close'),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           );
//                         },
//                       );
//                     },
//                   );
//                 },
//               ),
//               SizedBox(height: 80),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _showAddOrderDialog,
//         icon: Icon(Icons.add),
//         label: Text('New Order'),
//         backgroundColor: Colors.blue,
//         elevation: 4,
//       ),
//     );
//   }

//   void _showAddOrderDialog() {
//     final _customerName = TextEditingController();
//     final _customerPhone = TextEditingController();
//     final _pickupAddr = TextEditingController();
//     final _dropAddr = TextEditingController();
//     final _amount = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         title: Row(
//           children: [
//             Container(
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: Colors.blue.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Icon(Icons.add_shopping_cart, color: Colors.blue),
//             ),
//             SizedBox(width: 12),
//             Text('Create Order'),
//           ],
//         ),
//         content: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: _customerName,
//                 decoration: InputDecoration(
//                   labelText: 'Customer name',
//                   prefixIcon: Icon(Icons.person_outline),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey[50],
//                 ),
//               ),
//               SizedBox(height: 12),
//               TextField(
//                 controller: _customerPhone,
//                 decoration: InputDecoration(
//                   labelText: 'Customer phone',
//                   prefixIcon: Icon(Icons.phone_outlined),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey[50],
//                 ),
//               ),
//               SizedBox(height: 12),
//               TextField(
//                 controller: _pickupAddr,
//                 decoration: InputDecoration(
//                   labelText: 'Pickup address',
//                   prefixIcon: Icon(Icons.location_on_outlined),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey[50],
//                 ),
//               ),
//               SizedBox(height: 12),
//               TextField(
//                 controller: _dropAddr,
//                 decoration: InputDecoration(
//                   labelText: 'Dropoff address',
//                   prefixIcon: Icon(Icons.flag_outlined),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey[50],
//                 ),
//               ),
//               SizedBox(height: 12),
//               TextField(
//                 controller: _amount,
//                 decoration: InputDecoration(
//                   labelText: 'Amount',
//                   prefixIcon: Icon(Icons.attach_money),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey[50],
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(ctx),
//             child: Text('Cancel'),
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//             ),
//             onPressed: () async {
//               final map = {
//                 'customerName': _customerName.text,
//                 'customerPhone': _customerPhone.text,
//                 'pickupLocation': GeoPoint(0, 0),
//                 'pickupAddress': _pickupAddr.text,
//                 'dropoffLocation': GeoPoint(0, 0),
//                 'dropoffAddress': _dropAddr.text,
//                 'items': [],
//                 'amount': double.tryParse(_amount.text) ?? 0,
//                 'status': 'pending',
//                 'createdAt': Timestamp.now(),
//               };
//               await adminProvider.createOrder(map);
//               Navigator.pop(ctx);
//             },
//             child: Text('Create Order', style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }
// }

// 2
import 'package:flutter/material.dart';
import 'package:foodhub/models/order_model.dart';
import 'package:foodhub/models/user_model.dart';
import 'package:foodhub/providers/admin_provider.dart';
import 'package:foodhub/views/customer/home/widgets/create_order.dart';
import 'package:foodhub/views/customer/home/widgets/order_card.dart';
import 'package:foodhub/views/customer/home/widgets/rider_tile.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  late AdminProvider adminProvider;

  @override
  void initState() {
    super.initState();
    adminProvider = Provider.of<AdminProvider>(context, listen: false);
  }

  Widget _statsRow() {
    return FutureBuilder(
      future: Future.wait([
        adminProvider.countOrdersWithStatus('pending'),
        adminProvider.countOrdersWithStatus('assigned'),
        adminProvider.countOrdersWithStatus('inTransit'),
        adminProvider.countOrdersWithStatus('delivered'),
      ]),
      builder: (context, AsyncSnapshot<List<int>> snap) {
        final values = snap.data ?? [0, 0, 0, 0];
        return Column(
          children: [
            Row(
              children: [
                _smallCard(
                  'New',
                  values[0],
                  Colors.orange.shade600,
                  Icons.fiber_new,
                ),
                SizedBox(width: 10),
                _smallCard(
                  'Assigned',
                  values[1],
                  Colors.deepOrange.shade700,
                  Icons.assignment_ind,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                _smallCard(
                  'Active',
                  values[2],
                  Colors.deepOrange.shade500,
                  Icons.local_shipping,
                ),
                SizedBox(width: 10),
                _smallCard(
                  'Completed',
                  values[3],
                  Colors.green.shade600,
                  Icons.check_circle,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _smallCard(String title, int count, Color color, IconData icon) {
    return Expanded(
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.15),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
          border: Border.all(color: color.withOpacity(0.2), width: 1.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(icon, color: color, size: 24),
                  ),
                  Text(
                    count.toString(),
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ],
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openAssignSheet(OrderModel order, List<UserModel> riders) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Assign Rider',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Order ID: ${order.id}',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Divider(height: 1),
              Container(
                height: 300,
                child: ListView.builder(
                  itemCount: riders.length,
                  itemBuilder: (context, index) {
                    final r = riders[index];
                    return RiderTile(
                      rider: r,
                      onAssign: () async {
                        Navigator.of(context).pop();
                        await adminProvider.assignRiderToOrder(
                          orderId: order.id,
                          rider: r,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Assigned ${r.name}'),
                            backgroundColor: Colors.deepOrange,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _nearbyRiders() {
    return StreamBuilder<List<UserModel>>(
      stream: adminProvider.listenRiders(onlyOnline: true),
      builder: (context, snap) {
        if (snap.hasError)
          return Container(
            height: 120,
            child: Center(
              child: Text(
                'Error loading riders',
                style: TextStyle(color: Colors.red),
              ),
            ),
          );
        if (!snap.hasData)
          return Container(
            height: 120,
            child: Center(
              child: CircularProgressIndicator(color: Colors.deepOrange),
            ),
          );
        final riders = snap.data!;
        if (riders.isEmpty)
          return Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person_off, size: 40, color: Colors.grey),
                  SizedBox(height: 8),
                  Text(
                    'No riders online',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          );
        return Container(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: riders.length,
            separatorBuilder: (_, __) => SizedBox(width: 12),
            itemBuilder: (context, i) => GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    title: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: riders[i].profileImage != null
                              ? NetworkImage(riders[i].profileImage!)
                              : null,
                          child: riders[i].profileImage == null
                              ? Icon(Icons.person, size: 20)
                              : null,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            riders[i].name,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              size: 18,
                              color: Colors.grey[600],
                            ),
                            SizedBox(width: 8),
                            Text(riders[i].phone),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.star, size: 18, color: Colors.amber),
                            SizedBox(width: 8),
                            Text('${riders[i].rating ?? 'N/A'}'),
                          ],
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'Close',
                          style: TextStyle(color: Colors.deepOrange),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.deepOrange.withOpacity(0.2)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepOrange.withOpacity(0.08),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.deepOrange.shade50,
                          backgroundImage: riders[i].profileImage != null
                              ? NetworkImage(riders[i].profileImage!)
                              : null,
                          child: riders[i].profileImage == null
                              ? Icon(
                                  Icons.person,
                                  size: 30,
                                  color: Colors.deepOrange,
                                )
                              : null,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 14,
                            height: 14,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        riders[i].name,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ordersStream = adminProvider.listenOrders();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrange,
        title: Text(
          'FoodHub (Admin)',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 12),
            child: IconButton(
              onPressed: _navigateToCreateOrder,
              icon: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.add, color: Colors.white, size: 20),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _statsRow(),
              SizedBox(height: 24),
              Row(
                children: [
                  Icon(Icons.motorcycle, color: Colors.deepOrange, size: 22),
                  SizedBox(width: 8),
                  Text(
                    'Nearby Riders',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              _nearbyRiders(),
              SizedBox(height: 24),
              Row(
                children: [
                  Icon(Icons.receipt_long, color: Colors.deepOrange, size: 22),
                  SizedBox(width: 8),
                  Text(
                    'Live Orders',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              StreamBuilder<List<OrderModel>>(
                stream: ordersStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError)
                    return Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 48,
                              color: Colors.red,
                            ),
                            SizedBox(height: 8),
                            Text('Error loading orders'),
                          ],
                        ),
                      ),
                    );
                  if (!snapshot.hasData)
                    return Container(
                      height: 200,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.deepOrange,
                        ),
                      ),
                    );
                  final orders = snapshot.data!;
                  if (orders.isEmpty)
                    return Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.inbox, size: 48, color: Colors.grey),
                            SizedBox(height: 8),
                            Text(
                              'No orders yet',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                    );
                  return StreamBuilder<List<UserModel>>(
                    stream: adminProvider.listenRiders(onlyOnline: true),
                    builder: (ctx, ridersSnap) {
                      final riders = ridersSnap.data ?? [];
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: orders.length,
                        separatorBuilder: (_, __) => SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final order = orders[index];
                          return OrderCard(
                            order: order,
                            onAssign: () => _openAssignSheet(order, riders),
                            onViewBids: () {
                              showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                builder: (_) {
                                  final bids = order.bids ?? {};
                                  if (bids.isEmpty)
                                    return Container(
                                      height: 200,
                                      child: Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.gavel,
                                              size: 48,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              'No bids yet',
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 12),
                                        width: 40,
                                        height: 4,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius: BorderRadius.circular(
                                            2,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          'Bids Received',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Divider(height: 1),
                                      Flexible(
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: bids.entries.map((e) {
                                            final riderId = e.key;
                                            final map =
                                                Map<String, dynamic>.from(
                                                  e.value,
                                                );
                                            return ListTile(
                                              leading: CircleAvatar(
                                                backgroundColor:
                                                    Colors.deepOrange.shade50,
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.deepOrange,
                                                ),
                                              ),
                                              // title: Text('Rider: $riderId'),
                                              title: Text(
                                                'Rider: ${riders.firstWhere(
                                                  (r) => r.uid == riderId,
                                                  // orElse: () => UserModel(uid: riderId, name: 'Unknown Rider'), // fallback
                                                ).name}',
                                              ),
                                              subtitle: Text(
                                                'Amount: \$${map['amount']}',
                                              ),
                                              trailing: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.deepOrange,
                                                  foregroundColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                  ),
                                                ),
                                                child: Text('Assign'),
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                  final doc =
                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection('users')
                                                          .doc(riderId)
                                                          .get();
                                                  final rider =
                                                      UserModel.fromMap(
                                                        doc.data()
                                                            as Map<
                                                              String,
                                                              dynamic
                                                            >,
                                                        doc.id,
                                                      );
                                                  await adminProvider
                                                      .assignRiderToOrder(
                                                        orderId: order.id,
                                                        rider: rider,
                                                      );
                                                },
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            onTrack: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  title: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.deepOrange,
                                      ),
                                      SizedBox(width: 8),
                                      Text('Tracking'),
                                    ],
                                  ),
                                  content: Text('Open map or tracking UI here'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(
                                        'Close',
                                        style: TextStyle(
                                          color: Colors.deepOrange,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToCreateOrder() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateOrderScreen()),
    );
  }
}
