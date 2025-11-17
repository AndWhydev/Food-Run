import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';
import 'package:foodhub/models/user_model.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, authSnapshot) {
        // Show loading while checking auth state
        if (authSnapshot.connectionState == ConnectionState.waiting) {
          return const _LoadingScreen();
        }

        // If no user is signed in, go to onboarding
        if (!authSnapshot.hasData || authSnapshot.data == null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) {
              if (kIsWeb) {
                context.go('/login');
              } else {
                context.go('/onboarding');
              }
            }
          });
          return const _LoadingScreen();
        }

        // User is signed in, check their role from Firestore
        final user = authSnapshot.data!;

        return StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .snapshots(),
          builder: (context, userSnapshot) {
            // Show loading while fetching user data
            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return const _LoadingScreen();
            }

            // If user document doesn't exist, go to onboarding
            if (!userSnapshot.hasData || !userSnapshot.data!.exists) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (context.mounted) {
                  if (kIsWeb) {
                    context.go('/login'); // Web → go to login
                  } else {
                    context.go('/onboarding'); // Mobile → go to onboarding
                  }
                }
              });
              return const _LoadingScreen();
            }

            // Get user data and role
            final userData = userSnapshot.data!.data() as Map<String, dynamic>;
            final userModel = UserModel.fromMap(userData, user.uid);

            // Navigate based on role
            // WidgetsBinding.instance.addPostFrameCallback((_) {
            //   if (context.mounted) {
            //     switch (userModel.role) {
            //       case UserRole.admin:
            //         context.go('/home');
            //         break;
            //       case UserRole.rider:
            //         context.go('/riderhome');
            //         break;
            //       default:
            //         context.go('/onboarding');
            //     }
            //   }
            // });
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!context.mounted) return;

              // If user has a role, navigate based on role
              if (userModel.role == UserRole.admin) {
                context.go('/home');
              } else if (userModel.role == UserRole.rider) {
                context.go('/riderhome');
              } else {
                // Default / unknown role
                if (kIsWeb) {
                  context.go('/login'); // Web → go to login
                } else {
                  context.go('/onboarding'); // Mobile → go to onboarding
                }
              }
            });

            return const _LoadingScreen();
          },
        );
      },
    );
  }
}

// Loading screen widget
class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu, size: 100, color: Colors.white),
            const SizedBox(height: 20),
            Text(
              'Food Hub',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            // CircularProgressIndicator(
            //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            // ),
          ],
        ),
      ),
    );
  }
}
