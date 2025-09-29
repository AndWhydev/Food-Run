import 'package:flutter/material.dart';

class FoodCategoriesGridWeb extends StatelessWidget {
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

  FoodCategoriesGridWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Adaptive column count based on screen width
          int crossAxisCount = (constraints.maxWidth ~/ 160).clamp(2, 6);

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), // page scroll only
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return InkWell(
                onTap: () {
                  // handle click
                },
                borderRadius: BorderRadius.circular(16),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.deepOrange.shade50,
                          backgroundImage: NetworkImage(category["image"]!),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          category["name"]!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
