// import 'package:flutter/material.dart';

// class AdminHomeScreen extends StatelessWidget {
//   const AdminHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Color primaryColor = Colors.deepOrange.shade400;
//     final Color cardBg = Colors.white;
//     final Color bg = Colors.grey.shade100;

//     return Scaffold(
//       backgroundColor: bg,
//       appBar: AppBar(
//         title: const Text(
//           "Admin Dashboard",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//         ),
//         backgroundColor: primaryColor,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Top Greeting
//             Text(
//               "Welcome Back, Admin 👋",
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey.shade800,
//               ),
//             ),
//             const SizedBox(height: 20),

//             // Dashboard Cards
//             GridView.count(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               crossAxisCount: 2,
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//               children: [
//                 _buildDashboardCard(
//                   title: "Total Orders",
//                   value: "1,240",
//                   icon: Icons.shopping_bag,
//                   color: Colors.blue,
//                 ),
//                 _buildDashboardCard(
//                   title: "Active Orders",
//                   value: "230",
//                   icon: Icons.front_loader,
//                   color: Colors.orange,
//                 ),
//                 _buildDashboardCard(
//                   title: "Completed",
//                   value: "980",
//                   icon: Icons.check_circle,
//                   color: Colors.green,
//                 ),
//                 _buildDashboardCard(
//                   title: "Revenue",
//                   value: "\$12,340",
//                   icon: Icons.currency_bitcoin,
//                   color: Colors.purple,
//                 ),
//               ],
//             ),

//             const SizedBox(height: 30),

//             // Recent Orders Section
//             Text(
//               "Recent Orders",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey.shade800,
//               ),
//             ),
//             const SizedBox(height: 12),
//             _buildOrderTile("Pizza Margherita", "Mario’s Pizzeria", "\$15.50"),
//             _buildOrderTile("Cheese Burger", "Burger House", "\$9.99"),
//             _buildOrderTile("Chicken Shawarma", "Arabian Delight", "\$6.75"),

//             const SizedBox(height: 30),

//             // Top Restaurants Section
//             Text(
//               "Top Restaurants",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey.shade800,
//               ),
//             ),
//             const SizedBox(height: 12),
//             _buildRestaurantTile("Mario’s Pizzeria", "230 orders"),
//             _buildRestaurantTile("Burger House", "180 orders"),
//             _buildRestaurantTile("Arabian Delight", "150 orders"),
//           ],
//         ),
//       ),
//     );
//   }

//   // Dashboard Card Widget
//   Widget _buildDashboardCard({
//     required String title,
//     required String value,
//     required IconData icon,
//     required Color color,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.15),
//             blurRadius: 10,
//             spreadRadius: 2,
//           ),
//         ],
//       ),
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CircleAvatar(
//             backgroundColor: color.withOpacity(0.1),
//             child: Icon(icon, color: color),
//           ),
//           const Spacer(),
//           Text(
//             value,
//             style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//           ),
//           Text(title, style: TextStyle(color: Colors.grey.shade600)),
//         ],
//       ),
//     );
//   }

//   // Order Tile
//   Widget _buildOrderTile(String food, String restaurant, String price) {
//     return Card(
//       elevation: 2,
//       margin: const EdgeInsets.only(bottom: 12),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: ListTile(
//         leading: const CircleAvatar(
//           backgroundImage: AssetImage(
//             "assets/images/piza.png",
//             // "assets/images/food_placeholder.png",
//           ),
//         ),
//         title: Text(food, style: const TextStyle(fontWeight: FontWeight.bold)),
//         subtitle: Text(restaurant),
//         trailing: Text(
//           price,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.deepOrange,
//           ),
//         ),
//       ),
//     );
//   }

//   // Restaurant Tile
//   Widget _buildRestaurantTile(String name, String orders) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 10),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: ListTile(
//         leading: const CircleAvatar(
//           backgroundImage: AssetImage(
//             "assets/images/food1.png",
//             // "assets/images/restaurant_placeholder.png",
//           ),
//         ),
//         title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
//         subtitle: Text(orders),
//       ),
//     );
//   }
// }
