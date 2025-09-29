import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodhub/views/customer/home/widgets/foods.dart';

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
            automaticallyImplyLeading: false,
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
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 70),
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
                _buildSectionHeader("Popular", "View all"),

                PopularFoodsList(),

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
