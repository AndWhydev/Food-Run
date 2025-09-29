// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class PopularFoodsList extends StatefulWidget {
//   const PopularFoodsList({super.key});

//   @override
//   State<PopularFoodsList> createState() => _PopularFoodsListState();
// }

// class _PopularFoodsListState extends State<PopularFoodsList> {
//   final List<Map<String, dynamic>> foods = [
//     {
//       "name": "Pizza Margherita",
//       "image": "assets/images/piza.png", // <-- using asset
//       "price": "\$12.99",
//       "time": "20-25 mins",
//       "cuisine": "Italian",
//       "rating": 4.8,
//     },
//     {
//       "name": "Cheese Burger",
//       "image": "assets/images/piza.png",
//       "price": "\$9.49",
//       "time": "15-20 mins",
//       "cuisine": "American",
//       "rating": 4.5,
//     },
//     {
//       "name": "Fresh Salad",
//       "image": "assets/images/piza.png",
//       "price": "\$7.99",
//       "time": "10 mins",
//       "cuisine": "Greek",
//       "rating": 4.3,
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     var Size(:width, :height) = size;
//     return ListView.builder(
//       padding: EdgeInsets.all(0),
//       itemCount: foods.length,
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemBuilder: (context, index) {
//         final food = foods[index];
//         return GestureDetector(
//           onTap: () => HapticFeedback.lightImpact(),
//           child: Card(
//             color: Colors.white,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16),
//             ),
//             elevation: 6,
//             clipBehavior: Clip.antiAlias,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Top Food Image
//                 SizedBox(
//                   height: height * 0.2,
//                   width: double.infinity,
//                   child: Image.asset(food["image"], fit: BoxFit.cover),
//                 ),

//                 // Food Details Below Image
//                 Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         food["name"],
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 6),

//                       // Cuisine + Rating
//                       Row(
//                         children: [
//                           Text(
//                             food["cuisine"],
//                             style: const TextStyle(
//                               fontSize: 14,
//                               color: Colors.grey,
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           const Icon(Icons.star, color: Colors.amber, size: 16),
//                           Text(
//                             food["rating"].toString(),
//                             style: const TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),

//                       const SizedBox(height: 6),

//                       // Price + Time
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             food["price"],
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.timer,
//                                 size: 16,
//                                 color: Colors.grey,
//                               ),
//                               const SizedBox(width: 4),
//                               Text(
//                                 food["time"],
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// 2
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodhub/views/customer/home/widgets/order_page.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

// ---------------- PopularFoodsList ----------------
class PopularFoodsList extends StatefulWidget {
  const PopularFoodsList({super.key});

  @override
  State<PopularFoodsList> createState() => _PopularFoodsListState();
}

class _PopularFoodsListState extends State<PopularFoodsList> {
  final List<Map<String, dynamic>> foods = [
    {
      "name": "Pizza Margherita",
      "restaurant": "Mario’s Pizzeria",
      "image": "assets/images/piza.png",
      "price": "\$12.99",
      "time": "20-25 mins",
      "cuisine": "Italian",
      "rating": 4.8,
    },
    {
      "name": "Cheese Burger",
      "restaurant": "Burger House",
      "image": "assets/images/piza.png",
      "price": "\$9.49",
      "time": "15-20 mins",
      "cuisine": "American",
      "rating": 4.5,
    },
    {
      "name": "Fresh Salad",
      "restaurant": "Green Bowl",
      "image": "assets/images/piza.png",
      "price": "\$7.99",
      "time": "10 mins",
      "cuisine": "Greek",
      "rating": 4.3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var Size(:height) = size;

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: foods.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final food = foods[index];
        return GestureDetector(
          onTap: () {
            HapticFeedback.lightImpact();
            Get.to(OrderPage(food: food));
          },
          child: Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            elevation: 5,
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: food["name"],
                  child: SizedBox(
                    height: height * 0.22,
                    width: double.infinity,
                    child: Image.asset(food["image"], fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food["restaurant"],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.deepOrange,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        food["name"],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Text(
                            food["cuisine"],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          Text(
                            food["rating"].toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            food["price"],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.timer,
                                size: 16,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                food["time"],
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
