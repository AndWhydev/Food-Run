import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PopularFoodsList extends StatefulWidget {
  const PopularFoodsList({super.key});

  @override
  State<PopularFoodsList> createState() => _PopularFoodsListState();
}

class _PopularFoodsListState extends State<PopularFoodsList> {
  final List<Map<String, dynamic>> foods = [
    {
      "name": "Pizza Margherita",
      "image": "https://img.icons8.com/color/96/pizza.png",
      "price": "\$12.99",
      "time": "20 min",
    },
    {
      "name": "Cheese Burger",
      "image": "https://img.icons8.com/color/96/hamburger.png",
      "price": "\$9.49",
      "time": "15 min",
    },
    {
      "name": "Fresh Salad",
      "image": "https://img.icons8.com/color/96/salad.png",
      "price": "\$7.99",
      "time": "10 min",
    },
    {
      "name": "Sushi Platter",
      "image": "https://img.icons8.com/color/96/sushi.png",
      "price": "\$14.50",
      "time": "25 min",
    },
    {
      "name": "Ice Cream",
      "image": "https://img.icons8.com/color/96/ice-cream-cone.png",
      "price": "\$5.50",
      "time": "5 min",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: foods.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final food = foods[index];

        return GestureDetector(
          onTap: () => HapticFeedback.lightImpact(),
          child: Container(
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 6,
              clipBehavior: Clip.antiAlias,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Food Image
                  Ink.image(
                    image: NetworkImage(food["image"]),
                    fit: BoxFit.cover,
                  ),

                  // Gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),

                  // Food info
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          food["name"],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${food["price"]} • ${food["time"]}",
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
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
      },
    );
  }
}
