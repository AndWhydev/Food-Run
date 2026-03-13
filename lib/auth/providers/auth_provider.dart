
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodhub/auth/providers/google_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:foodhub/models/user_model.dart';
import 'package:foodhub/widgets/custom_dialog.dart';
import 'package:foodhub/widgets/error_custom_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart'; // Import the GoogleAuthDb

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleAuthDb _googleAuthDb = GoogleAuthDb(); // Initialize GoogleAuthDb


  //
  UserModel? userModel;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }


  //
    // CALL THIS ON APP START
  Future<void> loadUser() async {
    final user = _auth.currentUser;
    if (user == null) return;

    //
    final uid = user.uid;

    final snap = await _firestore.collection("users").doc(user.uid).get();
    if (snap.exists) {
      // userModel = UserModel.fromMap(snap.data()!, );
      userModel = UserModel.fromMap(snap.data()!, uid);
      notifyListeners();
    }
  }

  /// Get Device Type Dynamically
  String getDeviceType() {
    if (kIsWeb) return "web";
    if (Platform.isAndroid) return "android";
    if (Platform.isIOS) return "ios";
    return "unknown";
  }

  // ---------------------------------------------------------------------------
  // SIGN UP
  // ---------------------------------------------------------------------------
  Future<void> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
    required BuildContext context,
  }) async {
    try {
      _setLoading(true);

      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      String? fcmToken;
      if (!kIsWeb) {
        fcmToken = await FirebaseMessaging.instance.getToken();
      }

      UserModel user = UserModel(
        uid: userCredential.user!.uid,
        name: name,
        email: email,
        phone: phone,
        role: UserRole.rider,
        profileImage: null,
        location: null,
        online: true,
        rating: 0,
        totalDeliveries: 0,
        fcmToken: fcmToken,
        deviceType: getDeviceType(),
        lastActive: Timestamp.now(),
        badgeCount: 0,
      );

      await _firestore.collection('users').doc(user.uid).set(user.toMap());

      showMyCustomDialog(
        context,
        title: "Sign Up",
        message: "Account Created Successfully",
        redirectPath: '/login',
      );
    } on FirebaseAuthException catch (e) {
      showErrorDialog(context, title: "Signup failed", message: "${e.message}");
    } finally {
      _setLoading(false);
    }
  }

  // ---------------------------------------------------------------------------
  // LOGIN
  // ---------------------------------------------------------------------------
  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      _setLoading(true);

      UserCredential cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      String? fcmToken;
      if (!kIsWeb) {
        fcmToken = await FirebaseMessaging.instance.getToken();
      }

      await _firestore.collection('users').doc(cred.user!.uid).update({
        'lastActive': Timestamp.now(),
        'fcmToken': fcmToken,
        'online': true,
        'deviceType': getDeviceType(),
      });

      //
      context.go('/auth');

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Login successful!")));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? "Login failed")));
    } finally {
      _setLoading(false);
    }
  }

  // ---------------------------------------------------------------------------
  // GOOGLE SIGN-IN / SIGN-UP - UPDATED TO USE GoogleAuthDb
  // ---------------------------------------------------------------------------
  Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    try {
      _setLoading(true);

      final userCred = await _googleAuthDb.signInWithGoogle();

      // If userCred is null, user cancelled
      if (userCred.user == null) {
        return null;
      }

      // Save/update Firestore user data
      final userDoc = await _firestore
          .collection("users")
          .doc(userCred.user!.uid)
          .get();
      if (!userDoc.exists) {
        String? fcmToken;
        if (!kIsWeb) {
          fcmToken = await FirebaseMessaging.instance.getToken();
        }

        final newUser = UserModel(
          uid: userCred.user!.uid,
          name: userCred.user?.displayName ?? "",
          email: userCred.user?.email ?? "",
          phone: userCred.user?.phoneNumber ?? "",
          role: UserRole.rider,
          profileImage: userCred.user?.photoURL,
          location: null,
          online: true,
          rating: 0,
          totalDeliveries: 0,
          fcmToken: fcmToken,
          deviceType: getDeviceType(),
          lastActive: Timestamp.now(),
          badgeCount: 0,
        );
        await _firestore
            .collection('users')
            .doc(newUser.uid)
            .set(newUser.toMap());
      } else {
        String? fcmToken;
        if (!kIsWeb) {
          fcmToken = await FirebaseMessaging.instance.getToken();
        }
        final Map<String, dynamic> updateData = {
          'online': true,
          'lastActive': Timestamp.now(),
          'deviceType': getDeviceType(),
        };
        if (fcmToken != null) updateData['fcmToken'] = fcmToken;
        await _firestore.collection('users').doc(userCred.user!.uid).update(updateData);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Google Sign-In Successful")),
      );

      return userCred; // ✅ RETURN userCredential
    } catch (e) {
      showErrorDialog(
        context,
        title: "Google Sign-In Failed",
        message: e.toString(),
      );
      return null; // ✅ return null if error or cancel
    } finally {
      _setLoading(false);
    }
  }

  // ---------------------------------------------------------------------------
  // ATTEMPT LIGHTWEIGHT AUTHENTICATION (Silent Sign-In)
  // ---------------------------------------------------------------------------
  Future<void> attemptSilentSignIn() async {
    try {
      UserCredential? userCred = await _googleAuthDb
          .attemptLightweightAuthentication();

      if (userCred != null && userCred.user != null) {
        // Update user status in Firestore
        await _firestore.collection('users').doc(userCred.user!.uid).update({
          'online': true,
          'lastActive': Timestamp.now(),
          'deviceType': getDeviceType(),
        });
      }
    } catch (e) {
      // Silent sign-in failed, user needs to sign in manually
      debugPrint('Silent sign-in failed: $e');
    }
  }

  // ---------------------------------------------------------------------------
  // RESET PASSWORD
  // ---------------------------------------------------------------------------
  Future<void> resetPassword(String email, BuildContext context) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);

      showMyCustomDialog(
        context,
        title: "Forgot Password",
        message: "Password Reset Email Sent Successfully",
        redirectPath: '/login',
      );
    } catch (e) {
      showMyCustomDialog(context, title: "Error", message: e.toString());
    }
  }

  // ---------------------------------------------------------------------------
  // CHANGE PASSWORD
  // ---------------------------------------------------------------------------
  Future<void> changePassword(String newPassword, BuildContext context) async {
    try {
      await _auth.currentUser?.updatePassword(newPassword);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password updated successfully")),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error updating password: $e")));
    }
  }

  // ---------------------------------------------------------------------------
  // UPDATE PROFILE
  // ---------------------------------------------------------------------------
  Future<void> updateProfile({
    required String name,
    String? phone,
    String? imageUrl,
    required BuildContext context,
  }) async {
    try {
      final uid = _auth.currentUser?.uid;
      if (uid == null) return;

      await _firestore.collection('users').doc(uid).update({
        'name': name,
        if (phone != null) 'phone': phone,
        if (imageUrl != null) 'profileImage': imageUrl,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile updated successfully")),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error updating profile: $e")));
    }
  }

  // ---------------------------------------------------------------------------
  // LOGOUT - UPDATED TO USE GoogleAuthDb
  // ---------------------------------------------------------------------------
  Future<void> logout() async {
    final uid = _auth.currentUser?.uid;

    if (uid != null) {
      await _firestore.collection('users').doc(uid).update({
        'online': false,
        'lastActive': Timestamp.now(),
      });
    }

    // Use GoogleAuthDb for sign-out
    await _googleAuthDb.signOut();
  }

  // ---------------------------------------------------------------------------
  // CHECK IF USER IS SIGNED IN WITH GOOGLE
  // ---------------------------------------------------------------------------
  Future<bool> isSignedInWithGoogle() async {
    return await _googleAuthDb.isSignedIn();
  }

  // ---------------------------------------------------------------------------
  // GET GOOGLE AUTHENTICATION STREAM
  // ---------------------------------------------------------------------------
  Stream<GoogleSignInAuthenticationEvent> get googleAuthStream {
    return _googleAuthDb.authenticationStream;
  }
}
