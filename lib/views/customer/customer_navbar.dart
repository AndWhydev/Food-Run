// import 'package:flutter/material.dart';
// import 'package:foodhub/controllers/nav_controller.dart';
// import 'package:foodhub/views/customer/home/widgets/customer_home_mob.dart';
// import 'package:foodhub/views/customer/orders/all_orders.dart';
// import 'package:foodhub/views/customer/profile/profile.dart';
// import 'package:get/get.dart';

// class CustomerNavBar extends StatelessWidget {
//   CustomerNavBar({super.key});

//   final NavController navController = Get.put(NavController());

//   final List<Widget> _pages = [
//     AdminHomeScreen(),
//     AllOrdersPage(),
//     UserProfileScreen(),
//   ];

//   Widget _buildNavItem({
//     required IconData icon,
//     required String label,
//     required int index,
//     required int selectedIndex,
//     required BuildContext context,
//   }) {
//     final bool isSelected = selectedIndex == index;
//     final theme = Theme.of(context);

//     if (isSelected) {
//       // Capsule: orange circle + label
//       return GestureDetector(
//         onTap: () => navController.changeIndex(index),
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 250),
//           padding: const EdgeInsets.symmetric(horizontal: 6),
//           decoration: BoxDecoration(
//             color: theme.colorScheme.primary.withOpacity(
//               0.2,
//             ), // light orange pill
//             borderRadius: BorderRadius.circular(30),
//           ),
//           child: Row(
//             children: [
//               Container(
//                 width: 40,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: theme.colorScheme.primary, // dark orange circle
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(icon, color: Colors.white, size: 22),
//               ),
//               const SizedBox(width: 8),
//               Text(
//                 label,
//                 style: TextStyle(
//                   color: theme.colorScheme.primary,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(width: 10),
//             ],
//           ),
//         ),
//       );
//     } else {
//       // Unselected: only grey icon
//       return GestureDetector(
//         onTap: () => navController.changeIndex(index),
//         child: Container(
//           width: 40,
//           height: 40,
//           alignment: Alignment.center,
//           child: Icon(icon, color: Colors.grey, size: 26),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       int selectedIndex = navController.selectedIndex.value;
//       final theme = Theme.of(context);

//       return Scaffold(
//         extendBody: true,
//         body: _pages[selectedIndex],

//         bottomNavigationBar: SafeArea(
//           top: false,
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Container(
//               // height: 70,
//               decoration: BoxDecoration(
//                 color:
//                     theme.bottomNavigationBarTheme.backgroundColor ??
//                     Colors.white,
//                 borderRadius: BorderRadius.circular(30),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 8,
//                     spreadRadius: 1,
//                     offset: const Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     _buildNavItem(
//                       icon: Icons.home,
//                       label: "Home",
//                       index: 0,
//                       selectedIndex: selectedIndex,
//                       context: context,
//                     ),
//                     _buildNavItem(
//                       icon: Icons.shopping_cart,
//                       label: "Search",
//                       index: 1,
//                       selectedIndex: selectedIndex,
//                       context: context,
//                     ),

//                     _buildNavItem(
//                       icon: Icons.person,
//                       label: "Profile",
//                       index: 2,
//                       selectedIndex: selectedIndex,
//                       context: context,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }

// 2
import 'package:flutter/material.dart';
import 'package:foodhub/views/customer/home/widgets/customer_home_mob.dart';
import 'package:foodhub/views/rider/pages/profile/profile.dart';

class CustomerNavBar extends StatefulWidget {
  const CustomerNavBar({super.key});

  @override
  State<CustomerNavBar> createState() => _CustomerNavBarState();
}

class _CustomerNavBarState extends State<CustomerNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    AdminHomeScreen(),
    // AllOrdersPage(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required BuildContext context,
  }) {
    final bool isSelected = _selectedIndex == index;
    final theme = Theme.of(context);

    if (isSelected) {
      // Capsule: orange circle + label
      return GestureDetector(
        onTap: () => _onItemTapped(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(0.2),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 22),
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      );
    } else {
      // Unselected: only grey icon
      return GestureDetector(
        onTap: () => _onItemTapped(index),
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          child: Icon(icon, color: Colors.grey, size: 26),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      extendBody: true,
      body: _pages[_selectedIndex],
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              color:
                  theme.bottomNavigationBarTheme.backgroundColor ??
                  Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(
                    icon: Icons.home,
                    label: "Home",
                    index: 0,
                    context: context,
                  ),
                  // _buildNavItem(
                  //   icon: Icons.shopping_cart,
                  //   label: "Orders",
                  //   index: 1,
                  //   context: context,
                  // ),
                  _buildNavItem(
                    icon: Icons.person,
                    label: "Profile",
                    index: 1,
                    context: context,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
