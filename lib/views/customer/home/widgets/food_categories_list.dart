import 'package:flutter/material.dart';

class FoodCategoriesList extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {"name": "Pizza", "image": "https://img.icons8.com/color/96/pizza.png"},
    {
      "name": "Burgers",
      "image": "https://img.icons8.com/color/96/hamburger.png",
    },
    {"name": "Drinks", "image": "https://img.icons8.com/color/96/cocktail.png"},
    {
      "name": "Desserts",
      "image": "https://img.icons8.com/color/96/cupcake.png",
    },
    {"name": "Sushi", "image": "https://img.icons8.com/color/96/sushi.png"},
    {"name": "Salads", "image": "https://img.icons8.com/color/96/salad.png"},
    {
      "name": "Sandwiches",
      "image": "https://img.icons8.com/color/96/sandwich.png",
    },
  ];

  FoodCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // taller to fit image + text
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.deepOrange.shade400,
                  backgroundImage: NetworkImage(category["image"]!),
                ),
                const SizedBox(height: 6),
                Text(
                  category["name"]!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
