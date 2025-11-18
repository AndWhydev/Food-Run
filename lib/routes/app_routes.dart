import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodhub/auth/layout%20decider/home_page.dart';
import 'package:foodhub/auth/services/auth_wrapper.dart';
import 'package:foodhub/views/onboarding/onboarding.dart';
import 'package:foodhub/views/rider/pages/nav_bar.dart';
import 'package:foodhub/views/rider/pages/profile/change_password.dart';
import 'package:foodhub/views/rider/pages/profile/delete_account.dart';
import 'package:foodhub/views/rider/pages/profile/edit_profile.dart';
import 'package:go_router/go_router.dart';
import 'package:foodhub/auth/layout%20decider/forgot_password_page.dart';
import 'package:foodhub/auth/layout%20decider/login_page.dart';
import 'package:foodhub/auth/layout%20decider/signup_page.dart';

class AppRouter {
  // static final bool _isWeb = kIsWeb;

  static final GoRouter router = GoRouter(
    // initialLocation: _isWeb ? '/login' : '/onboarding',
    initialLocation: '/auth', // make /auth the first route
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const Onboarding(),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthWrapper(), // always start here
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(path: '/signup', builder: (context, state) => const SignUpPage()),

      GoRoute(
        path: '/forget',
        builder: (context, state) => const ForgotPasswordPage(),
      ),

      // Home
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
        redirect: (context, state) {
          final user = FirebaseAuth.instance.currentUser;
          return user == null ? '/login' : null;
        },
      ),
      GoRoute(
        path: '/riderhome',
        builder: (context, state) => RiderNavBar(),
        redirect: (context, state) {
          final user = FirebaseAuth.instance.currentUser;
          return user == null ? '/login' : null;
        },
      ),

      ///
      ///
      ///
      ///
      GoRoute(
        path: '/edit-profile',
        builder: (context, state) => const EditProfileScreen(),
      ),

      GoRoute(
        path: '/change-password',
        builder: (context, state) => const ChangePasswordScreen(),
      ),

      GoRoute(
        path: '/delete-account',
        builder: (context, state) => const DeleteAccountScreen(),
      ),
    ],
  );
}
