// import 'package:flutter/material.dart';

// class AllOrdersPage extends StatelessWidget {
//   final List<Map<String, dynamic>> orders = [
//     {
//       "foodName": "Pizza Margherita",
//       "restaurant": "Mario’s Pizzeria",
//       "image": "assets/images/piza.png",
//       "details": "1x Pizza, 2x Burgers",
//       "address": "123 Main Street",
//       "phone": "0300-1234567",
//       "delivery": true,
//       "status": "Delivered",
//     },
//     {
//       "foodName": "Cheese Burger",
//       "restaurant": "Burger House",
//       "image": "assets/images/piza.png",
//       "details": "2x Cheese Burger, 1x Fries",
//       "address": "456 Park Avenue",
//       "phone": "0301-9876543",
//       "delivery": true,
//       "status": "On the way",
//     },
//     {
//       "foodName": "Fresh Salad",
//       "restaurant": "Green Bowl",
//       "image": "assets/images/piza.png",
//       "details": "1x Salad, 1x Cold Drink",
//       "address": "789 Market Road",
//       "phone": "0302-5555555",
//       "delivery": false,
//       "status": "Preparing",
//     },
//   ];

//   AllOrdersPage({super.key});

//   int _getStatusStep(String status) {
//     switch (status) {
//       case "Preparing":
//         return 1;
//       case "On the way":
//         return 2;
//       case "Delivered":
//         return 3;
//       default:
//         return 0; // Placed
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         title: const Text("My Orders"),
//         backgroundColor: Colors.deepOrange,
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: orders.length,
//         itemBuilder: (context, index) {
//           final order = orders[index];
//           final step = _getStatusStep(order["status"]);

//           return Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16),
//             ),
//             elevation: 4,
//             margin: const EdgeInsets.only(bottom: 16),
//             child: Padding(
//               padding: const EdgeInsets.all(14),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Food info
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(12),
//                         child: Image.asset(
//                           order["image"],
//                           height: 80,
//                           width: 80,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               order["foodName"],
//                               style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(height: 4),
//                             Row(
//                               children: [
//                                 const Icon(
//                                   Icons.restaurant,
//                                   size: 16,
//                                   color: Colors.deepOrange,
//                                 ),
//                                 const SizedBox(width: 4),
//                                 Text(
//                                   order["restaurant"],
//                                   style: const TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 10,
//                           vertical: 4,
//                         ),
//                         decoration: BoxDecoration(
//                           color: step == 3
//                               ? Colors.green[100]
//                               : Colors.orange[100],
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Text(
//                           order["status"],
//                           style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                             color: step == 3 ? Colors.green : Colors.orange,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 12),

//                   // Details
//                   _buildInfoRow(Icons.shopping_cart_outlined, order["details"]),
//                   _buildInfoRow(Icons.location_on_outlined, order["address"]),
//                   _buildInfoRow(Icons.phone_outlined, order["phone"]),
//                   _buildInfoRow(
//                     Icons.delivery_dining,
//                     order["delivery"] ? "Delivery" : "Pick up",
//                   ),

//                   const SizedBox(height: 16),

//                   // Tracking (vertical)
//                   const Text(
//                     "Tracking",
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.deepOrange,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   _buildVerticalTracking(step),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildInfoRow(IconData icon, String text) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 6),
//       child: Row(
//         children: [
//           Icon(icon, size: 18, color: Colors.deepOrange),
//           const SizedBox(width: 6),
//           Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
//         ],
//       ),
//     );
//   }

//   Widget _buildVerticalTracking(int currentStep) {
//     final steps = ["Placed", "Preparing", "On the way", "Delivered"];

//     return Column(
//       children: List.generate(steps.length, (index) {
//         final isActive = index <= currentStep;
//         return Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Circle + line
//             Column(
//               children: [
//                 CircleAvatar(
//                   radius: 10,
//                   backgroundColor: isActive ? Colors.green : Colors.grey[300],
//                   child: Icon(
//                     isActive ? Icons.check : Icons.circle,
//                     size: 12,
//                     color: Colors.white,
//                   ),
//                 ),
//                 if (index != steps.length - 1)
//                   Container(
//                     height: 40,
//                     width: 2,
//                     color: isActive ? Colors.green : Colors.grey[300],
//                   ),
//               ],
//             ),
//             const SizedBox(width: 8),
//             Padding(
//               padding: const EdgeInsets.only(top: 2),
//               child: Text(
//                 steps[index],
//                 style: TextStyle(
//                   fontSize: 13,
//                   fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
//                   color: isActive ? Colors.green : Colors.grey,
//                 ),
//               ),
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }

// 2
import 'package:flutter/material.dart';
import 'package:foodhub/views/customer/orders/order_detail.dart';

class AllOrdersPage extends StatelessWidget {
  final List<Map<String, dynamic>> orders = [
    {
      "foodName": "Pizza Margherita",
      "restaurant": "Mario’s Pizzeria",
      "image": "assets/images/piza.png",
      "details": "1x Pizza, 2x Burgers",
      "address": "123 Main Street",
      "phone": "0300-1234567",
      "delivery": true,
      "status": "Delivered",
    },
    {
      "foodName": "Cheese Burger",
      "restaurant": "Burger House",
      "image": "assets/images/piza.png",
      "details": "2x Cheese Burger, 1x Fries",
      "address": "456 Park Avenue",
      "phone": "0301-9876543",
      "delivery": true,
      "status": "On the way",
    },
    {
      "foodName": "Fresh Salad",
      "restaurant": "Green Bowl",
      "image": "assets/images/piza.png",
      "details": "1x Salad, 1x Cold Drink",
      "address": "789 Market Road",
      "phone": "0302-5555555",
      "delivery": false,
      "status": "Preparing",
    },
  ];

  AllOrdersPage({super.key});

  Color _statusColor(String status) {
    switch (status) {
      case "Delivered":
        return Colors.green;
      case "On the way":
        return Colors.orange;
      case "Preparing":
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.grey[100],
            automaticallyImplyLeading: false,
            pinned: true,
            elevation: 0,
            title: const Text(
              "My Orders",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

          // Orders list
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final order = orders[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OrderDetailPage(order: order),
                    ),
                  );
                },
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            order["image"],
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),

                        // Text content
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Food name + status
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      order["foodName"],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _statusColor(
                                        order["status"],
                                      ).withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      order["status"],
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: _statusColor(order["status"]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 4),
                              Text(
                                order["restaurant"],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                order["details"],
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                order["address"],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }, childCount: orders.length),
          ),
        ],
      ),
    );
  }
}
