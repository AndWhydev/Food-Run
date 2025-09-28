// import 'package:flutter/material.dart';
// import 'package:foodhub/views/customer/home/widgets/food_categories_list.dart';
// import 'package:foodhub/views/customer/home/widgets/foods.dart';

// class CustomerHomeMobileView extends StatefulWidget {
//   const CustomerHomeMobileView({super.key});

//   @override
//   State<CustomerHomeMobileView> createState() => _CustomerHomeMobileViewState();
// }

// class _CustomerHomeMobileViewState extends State<CustomerHomeMobileView> {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     var Size(:width, :height) = size;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: width * 0.02),
//             child: Column(
//               children: [
//                 // Header
//                 _header(width, height),

//                 // Search Textfield
//                 _searchTextfield(height, width),

//                 // Categories
//                 _categories(height, width),

//                 //
//                 PopularFoodsList(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Padding _categories(double height, double width) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: height * 0.01),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: width * 0.05,
//               vertical: height * 0.01,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Categories",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     // TODO: Navigate to categories page
//                   },
//                   child: Text(
//                     "See more",
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.deepOrange,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 8),
//           FoodCategoriesList(), // your horizontal list
//         ],
//       ),
//     );
//   }

//   Padding _searchTextfield(double height, double width) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: height * 0.01),
//       child: Container(
//         width: width * 0.9,
//         child: TextField(
//           decoration: InputDecoration(
//             suffixIcon: Icon(Icons.search, color: Colors.grey),
//             hintText: 'Search....',
//             contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(50), // round corners
//               borderSide: BorderSide(
//                 width: 1,
//                 color: Colors.transparent,
//               ), // visible border
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(50),
//               borderSide: BorderSide(
//                 width: 1,
//                 color: Colors.transparent,
//               ), // default state
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(50),
//               borderSide: BorderSide(
//                 width: 2,
//                 color: Colors.transparent,
//               ), // highlight on focus
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   ListTile _header(double width, double height) {
//     return ListTile(
//       contentPadding: EdgeInsets.all(0),
//       leading: CircleAvatar(
//         radius: width * 0.1,
//         backgroundImage: AssetImage("assets/images/boy.jpg"),
//       ),

//       //
//       title: Text("hello John", style: TextStyle(color: Colors.grey)),
//       subtitle: Padding(
//         padding: EdgeInsets.symmetric(vertical: height * 0.007),
//         child: Row(
//           children: [
//             Icon(Icons.location_on_outlined, color: Colors.deepOrange),
//             Text(
//               "New york City",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),

//       trailing: Padding(
//         padding: EdgeInsets.only(right: width * 0.05),
//         child: CircleAvatar(
//           backgroundColor: Colors.white,
//           child: IconButton(
//             onPressed: () {},
//             icon: Badge(child: Icon(Icons.notifications)),
//           ),
//         ),
//       ),
//     );
//   }
// }

// 2
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Main Home View
class CustomerHomeMobileView extends StatefulWidget {
  const CustomerHomeMobileView({super.key});

  @override
  State<CustomerHomeMobileView> createState() => _CustomerHomeMobileViewState();
}

class _CustomerHomeMobileViewState extends State<CustomerHomeMobileView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          // Custom App Bar
          SliverAppBar(
            expandedHeight: 120,
            floating: true,
            pinned: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.deepOrange.shade400,
                      Colors.deepOrange.shade600,
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    child: _buildHeader(),
                  ),
                ),
              ),
            ),
          ),

          // Content
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 20),

                // Search Bar
                _buildSearchBar(),

                const SizedBox(height: 24),

                // Categories Section
                _buildSectionHeader("Categories", "See all"),

                const SizedBox(height: 16),

                const FoodCategoriesList(),

                const SizedBox(height: 32),

                // Popular Foods Section
                _buildSectionHeader("Popular Today", "View all"),

                const SizedBox(height: 16),

                const PopularFoodsList(),

                const SizedBox(height: 24),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        // Profile Avatar
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/images/boy.jpg"),
          ),
        ),

        const SizedBox(width: 16),

        // Welcome Text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Good Morning!",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                "John Smith",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.white.withOpacity(0.9),
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "New York City",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Notification Button
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Stack(
              children: [
                const Icon(
                  Icons.notifications_outlined,
                  color: Colors.white,
                  size: 24,
                ),
                Positioned(
                  right: 2,
                  top: 2,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search for food, restaurants...',
          hintStyle: TextStyle(color: Colors.grey[400], fontSize: 16),
          prefixIcon: Icon(Icons.search, color: Colors.grey[400], size: 22),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear, color: Colors.grey[400]),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {});
                  },
                )
              : Icon(Icons.tune, color: Colors.grey[400], size: 22),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
        ),
        onChanged: (value) => setState(() {}),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String actionText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        TextButton(
          onPressed: () {
            // TODO: Navigate to respective page
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            actionText,
            style: TextStyle(
              color: Colors.deepOrange.shade600,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

// Enhanced Food Categories List
class FoodCategoriesList extends StatelessWidget {
  const FoodCategoriesList({super.key});

  static final List<Map<String, dynamic>> categories = [
    {
      "name": "Pizza",
      "image": "https://img.icons8.com/color/96/pizza.png",
      "color": Colors.red.shade100,
    },
    {
      "name": "Burgers",
      "image": "https://img.icons8.com/color/96/hamburger.png",
      "color": Colors.orange.shade100,
    },
    {
      "name": "Drinks",
      "image": "https://img.icons8.com/color/96/cocktail.png",
      "color": Colors.blue.shade100,
    },
    {
      "name": "Desserts",
      "image": "https://img.icons8.com/color/96/cupcake.png",
      "color": Colors.pink.shade100,
    },
    {
      "name": "Sushi",
      "image": "https://img.icons8.com/color/96/sushi.png",
      "color": Colors.green.shade100,
    },
    {
      "name": "Salads",
      "image": "https://img.icons8.com/color/96/salad.png",
      "color": Colors.teal.shade100,
    },
    {
      "name": "Sandwiches",
      "image": "https://img.icons8.com/color/96/sandwich.png",
      "color": Colors.amber.shade100,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                HapticFeedback.lightImpact();
                // TODO: Navigate to category
              },
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: category["color"],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: category["color"].withOpacity(0.4),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.network(
                        category["image"],
                        width: 32,
                        height: 32,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.fastfood,
                            size: 32,
                            color: Colors.grey[600],
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category["name"],
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Enhanced Popular Foods List
class PopularFoodsList extends StatefulWidget {
  const PopularFoodsList({super.key});

  @override
  State<PopularFoodsList> createState() => _PopularFoodsListState();
}

class _PopularFoodsListState extends State<PopularFoodsList> {
  final List<Map<String, dynamic>> foods = [
    {
      "id": 1,
      "name": "Margherita Pizza",
      "description": "Fresh tomatoes, mozzarella, basil leaves",
      "image": "https://img.icons8.com/color/96/pizza.png",
      "price": 12.99,
      "originalPrice": 15.99,
      "time": "20-25 min",
      "rating": 4.8,
      "reviews": 124,
      "isPopular": true,
    },
    {
      "id": 2,
      "name": "Classic Cheeseburger",
      "description": "Beef patty, cheese, lettuce, tomato, onion",
      "image": "https://img.icons8.com/color/96/hamburger.png",
      "price": 9.49,
      "originalPrice": null,
      "time": "15-20 min",
      "rating": 4.6,
      "reviews": 89,
      "isPopular": false,
    },
    {
      "id": 3,
      "name": "Caesar Salad",
      "description": "Fresh romaine, parmesan, croutons, caesar dressing",
      "image": "https://img.icons8.com/color/96/salad.png",
      "price": 7.99,
      "originalPrice": 9.99,
      "time": "10-15 min",
      "rating": 4.4,
      "reviews": 67,
      "isPopular": false,
    },
    {
      "id": 4,
      "name": "Sushi Deluxe Platter",
      "description": "Assorted fresh sushi and sashimi selection",
      "image": "https://img.icons8.com/color/96/sushi.png",
      "price": 24.50,
      "originalPrice": null,
      "time": "25-30 min",
      "rating": 4.9,
      "reviews": 156,
      "isPopular": true,
    },
  ];

  Set<int> favoriteItems = {};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: foods.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final food = foods[index];
        final isFavorite = favoriteItems.contains(food["id"]);

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              HapticFeedback.lightImpact();
              // TODO: Navigate to food details
            },
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Food Image
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[100],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        food["image"],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.fastfood,
                            size: 40,
                            color: Colors.grey[400],
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  // Food Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name and Popular Badge
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                food["name"],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            if (food["isPopular"])
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange.shade100,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  "Popular",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.deepOrange.shade700,
                                  ),
                                ),
                              ),
                          ],
                        ),

                        const SizedBox(height: 4),

                        // Description
                        Text(
                          food["description"],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        const SizedBox(height: 8),

                        // Rating and Time
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.amber[600],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "${food["rating"]}",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "(${food["reviews"]})",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[500],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Icon(
                              Icons.access_time,
                              size: 16,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              food["time"],
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        // Price and Actions
                        Row(
                          children: [
                            // Price
                            Row(
                              children: [
                                Text(
                                  "\$${food["price"].toStringAsFixed(2)}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                if (food["originalPrice"] != null) ...[
                                  const SizedBox(width: 8),
                                  Text(
                                    "\$${food["originalPrice"].toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ],
                              ],
                            ),

                            const Spacer(),

                            // Favorite Button
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (isFavorite) {
                                    favoriteItems.remove(food["id"]);
                                  } else {
                                    favoriteItems.add(food["id"]);
                                  }
                                });
                                HapticFeedback.lightImpact();
                              },
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite
                                    ? Colors.red
                                    : Colors.grey[400],
                                size: 20,
                              ),
                            ),

                            // Add to Cart Button
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  HapticFeedback.mediumImpact();
                                  // TODO: Add to cart
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "${food["name"]} added to cart",
                                      ),
                                      duration: const Duration(seconds: 2),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
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
