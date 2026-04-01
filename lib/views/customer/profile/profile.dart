import 'package:flutter/material.dart';
import 'package:foodhub/auth/providers/auth_provider.dart';
import 'package:foodhub/models/user_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<AuthProvider>(
          builder: (context, auth, child) {
            final user = auth.userModel;
            return Column(
              children: [
                _buildProfileHeader(user),
                const SizedBox(height: 20),
                _buildMenuList(context, user),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfileHeader(UserModel? user) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.deepOrange),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              backgroundImage: user?.profileImage != null
                  ? NetworkImage(user!.profileImage!)
                  : const AssetImage('assets/images/boy.jpg') as ImageProvider,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            user?.name ?? 'Guest User',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            user?.email ?? 'No email available',
            style: const TextStyle(fontSize: 14, color: Colors.white70),
          ),
          if (user?.phone != null && user!.phone.isNotEmpty) ...[
            const SizedBox(height: 5),
            Text(
              user.phone,
              style: const TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ],
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildMenuList(BuildContext context, UserModel? user) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildMenuItem(
            icon: Icons.person,
            title: 'Edit Profile',
            onTap: () => context.push('/edit-profile'),
          ),

          _buildMenuItem(
            icon: Icons.favorite,
            title: 'Favorites',
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.location_on,
            title: 'Delivery Address',
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.payment,
            title: 'Payment Methods',
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.help,
            title: 'Help & Support',
            onTap: () {},
          ),
          // _buildMenuItem(
          //   icon: Icons.logout,
          //   title: 'Logout',
          //   onTap: () {
          //     // Get.offUntil(
          //     //   MaterialPageRoute(builder: (_) => const Onboarding()),
          //     //   (route) => false,
          //     // );
          //   },
          //   textColor: Colors.red,
          // ),
          _buildMenuItem(
            icon: Icons.logout,
            title: 'Logout',
            textColor: Colors.red,
            onTap: () async {
              final auth = context.read<AuthProvider>();

              await auth.logout(); // Firebase + Google sign-out

              // GoRouter navigation
              if (context.mounted) {
                context.go('/login');
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? textColor,
  }) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: textColor ?? Colors.deepOrange),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: textColor ?? Colors.black87,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
      ),
    );
  }
}
