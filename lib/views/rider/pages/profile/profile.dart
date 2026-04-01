// import 'package:flutter/material.dart';
// import 'package:foodhub/auth/providers/auth_provider.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Color primaryColor = Colors.deepOrange;
//     final Color accentColor = Colors.deepOrange;

//     return Scaffold(
//       backgroundColor: const Color(0xFFF9FAFB),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               // Compact Custom Header
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 18,
//                   horizontal: 20,
//                 ),
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [primaryColor, accentColor],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: const BorderRadius.only(
//                     bottomLeft: Radius.circular(18),
//                     bottomRight: Radius.circular(18),
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: primaryColor.withOpacity(0.3),
//                       blurRadius: 6,
//                       offset: const Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: const [
//                     Icon(Icons.person, color: Colors.white, size: 20),
//                     SizedBox(width: 8),
//                     Text(
//                       "Profile",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // Profile Info
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const CircleAvatar(
//                       radius: 42,
//                       backgroundImage: AssetImage('assets/images/boy.jpg'),
//                     ),
//                     const SizedBox(height: 10),
//                     const Text(
//                       "Ammar Hameed",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                     const Text(
//                       "Rider ID: #RDR-2025",
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                     const SizedBox(height: 20),
//                     const Divider(),

//                     // Details
//                     ListTile(
//                       leading: Icon(Icons.phone_outlined, color: accentColor),
//                       title: const Text("Phone"),
//                       subtitle: const Text("+92 300 1234567"),
//                     ),
//                     ListTile(
//                       leading: Icon(
//                         Icons.location_on_outlined,
//                         color: accentColor,
//                       ),
//                       title: const Text("Region"),
//                       subtitle: const Text("Lahore, Pakistan"),
//                     ),

//                     //
//                     ListTile(
//                       leading: Icon(Icons.lock_open, color: accentColor),
//                       title: const Text("Change Password"),
//                       subtitle: const Text("change your account password"),
//                     ),

//                     //
//                     ListTile(
//                       leading: Icon(Icons.delete_outline, color: accentColor),
//                       title: const Text("Delete Account"),
//                       subtitle: const Text("Delete your account"),
//                     ),
//                     const SizedBox(height: 30),

//                     OutlinedButton.icon(
//                       onPressed: () async {
//                         final auth = context.read<AuthProvider>();

//                         await auth.logout(); // Firebase + Google sign-out

//                         // GoRouter navigation
//                         if (context.mounted) {
//                           context.go('/login');
//                         }
//                       },
//                       icon: const Icon(Icons.logout),
//                       label: const Text("Logout"),
//                       style: OutlinedButton.styleFrom(
//                         side: BorderSide(color: accentColor),
//                         foregroundColor: accentColor,
//                         minimumSize: const Size(double.infinity, 48),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// 2
import 'package:flutter/material.dart';
import 'package:foodhub/auth/providers/auth_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<AuthProvider>(context, listen: false).loadUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final user = auth.userModel;

    print(user);

    final Color primaryColor = Colors.deepOrange;
    final Color accentColor = Colors.deepOrange;

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Top Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 20,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepOrange, Colors.orangeAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 10, bottom: 10),
                  child: Row(
                    children: [
                      const Icon(Icons.person, color: Colors.white, size: 20),
                      const SizedBox(width: 8),
                      const Text(
                        "Profile",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.white, size: 20),
                        onPressed: () => context.push("/edit-profile"),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // Profile Image
                    // CircleAvatar(
                    //   radius: 42,
                    //   backgroundImage: user?.profileImage != null
                    //       ? NetworkImage(user!.profileImage!)
                    //       : const AssetImage('assets/images/boy.jpg')
                    //             as ImageProvider,
                    // ),
                    CircleAvatar(
                      radius: 42,
                      backgroundColor: Colors.deepOrange,
                      backgroundImage:
                          user?.profileImage != null &&
                              user!.profileImage!.isNotEmpty
                          ? NetworkImage(user.profileImage!)
                          : null,
                      child:
                          (user?.profileImage == null ||
                              user!.profileImage!.isEmpty)
                          ? Text(
                              (user?.name != null && user!.name!.isNotEmpty)
                                  ? user.name![0].toUpperCase()
                                  : "?",
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                          : null,
                    ),

                    const SizedBox(height: 10),

                    // Dynamic Name
                    Text(
                      user?.name ?? "Loading...",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),

                    // Dynamic Rider ID (based on UID)
                    // Text(
                    //   user != null
                    //       ? "Rider ID: #RDR-${user.uid.substring(0, 6).toUpperCase()}"
                    //       : "Rider ID: ...",
                    //   style: const TextStyle(color: Colors.grey),
                    // ),
                    const SizedBox(height: 20),

                    const Divider(),

                    // Phone Dynamic
                    ListTile(
                      leading: Icon(Icons.phone_outlined, color: accentColor),
                      title: const Text("Phone"),
                      subtitle: Text(
                        (user?.phone != null && user!.phone.isNotEmpty)
                            ? user.phone
                            : "Add phone number",
                        style: TextStyle(
                          color: (user?.phone == null || user!.phone.isEmpty)
                              ? Colors.redAccent
                              : Colors.black87,
                        ),
                      ),
                      trailing: const Icon(Icons.chevron_right, size: 20),
                      onTap: () => context.push("/edit-profile"),
                    ),

                    // Region (static because no region stored)

                    // Change Password
                    ListTile(
                      leading: Icon(Icons.lock_open, color: accentColor),
                      title: const Text("Change Password"),
                      subtitle: const Text("change your account password"),
                      onTap: () => context.push("/change-password"),
                    ),

                    // Delete Account
                    ListTile(
                      leading: Icon(Icons.delete_outline, color: accentColor),
                      title: const Text("Delete Account"),
                      subtitle: const Text("Delete your account"),
                      onTap: () => context.push("/delete-account"),
                    ),

                    const SizedBox(height: 30),

                    // Logout Button
                    OutlinedButton.icon(
                      onPressed: () async {
                        await auth.logout();
                        if (context.mounted) {
                          context.go("/login");
                        }
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
