// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.3,
//         title: const Text(
//           "Profile",
//           style: TextStyle(fontWeight: FontWeight.w600),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           children: [
//             const CircleAvatar(
//               radius: 48,
//               backgroundImage: AssetImage('assets/images/boy.jpg'),
//             ),
//             const SizedBox(height: 12),
//             const Text(
//               "Ammar Hameed",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//             ),
//             const Text(
//               "Rider ID: #RDR-2025",
//               style: TextStyle(color: Colors.grey),
//             ),
//             const SizedBox(height: 24),
//             const Divider(),
//             const SizedBox(height: 8),
//             ListTile(
//               leading: const Icon(Icons.phone_outlined),
//               title: const Text("Phone"),
//               subtitle: const Text("+92 300 1234567"),
//             ),
//             ListTile(
//               leading: const Icon(Icons.location_on_outlined),
//               title: const Text("Region"),
//               subtitle: const Text("Lahore, Pakistan"),
//             ),
//             const Spacer(),
//             OutlinedButton.icon(
//               onPressed: () {},
//               icon: const Icon(Icons.logout),
//               label: const Text("Logout"),
//               style: OutlinedButton.styleFrom(
//                 side: const BorderSide(color: Colors.black),
//                 foregroundColor: Colors.black,
//                 minimumSize: const Size(double.infinity, 50),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// 2
import 'package:flutter/material.dart';
import 'package:foodhub/views/onboarding/onboarding.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Colors.deepOrange;
    final Color accentColor = Colors.deepOrange;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Compact Custom Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [primaryColor, accentColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.3),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(Icons.person, color: Colors.white, size: 20),
                    SizedBox(width: 8),
                    Text(
                      "Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Profile Info
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 42,
                      backgroundImage: AssetImage('assets/images/boy.jpg'),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Ammar Hameed",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const Text(
                      "Rider ID: #RDR-2025",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    const Divider(),

                    // Details
                    ListTile(
                      leading: Icon(Icons.phone_outlined, color: accentColor),
                      title: const Text("Phone"),
                      subtitle: const Text("+92 300 1234567"),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.location_on_outlined,
                        color: accentColor,
                      ),
                      title: const Text("Region"),
                      subtitle: const Text("Lahore, Pakistan"),
                    ),
                    const SizedBox(height: 30),

                    // Logout Button
                    OutlinedButton.icon(
                      onPressed: () {
                        Get.offUntil(
                          MaterialPageRoute(builder: (_) => const Onboarding()),
                          (route) => false,
                        );
                      },
                      icon: const Icon(Icons.logout),
                      label: const Text("Logout"),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: accentColor),
                        foregroundColor: accentColor,
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
