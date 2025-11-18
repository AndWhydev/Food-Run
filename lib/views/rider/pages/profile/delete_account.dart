import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodhub/auth/providers/auth_provider.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Delete Account")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Enter your password to confirm account deletion",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: passwordCtrl,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),

            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () async {
                // await provider.deleteAccount(
                //   password: passwordCtrl.text.trim(),
                //   context: context,
                // );
              },
              child: provider.isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Delete Account"),
            ),
          ],
        ),
      ),
    );
  }
}
