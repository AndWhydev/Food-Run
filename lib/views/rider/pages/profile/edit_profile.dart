import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodhub/auth/providers/auth_provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    final user = context.read<AuthProvider>().userModel;
    nameCtrl.text = user?.name ?? "";
    phoneCtrl.text = user?.phone ?? "";
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: phoneCtrl,
              decoration: const InputDecoration(labelText: "Phone Number"),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () async {
                await provider.updateProfile(
                  name: nameCtrl.text.trim(),
                  phone: phoneCtrl.text.trim(),
                  context: context,
                );
              },
              child: provider.isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
