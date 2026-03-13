import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class GoogleAuthDb {
  // Singleton instance
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  bool _isGoogleSignInInitialized = false;
  GoogleSignInAccount? _currentUser;

  GoogleAuthDb() {
    initializeGoogleSignIn();
  }

  Future<void> initializeGoogleSignIn() async {
    try {
      // Initialize is required in v7+
      await _googleSignIn.initialize(
       clientId:
            '203614101967-sdn9q0baps1k70hf6tkg00r66bnf66l8.apps.googleusercontent.com',
        // serverClientId: 'YOUR_SERVER_CLIENT_ID', // Optional for server auth
      );
      _isGoogleSignInInitialized = true;
      log('Google Sign-In initialized successfully');

      // Start listening to authentication events with correct type
      _googleSignIn.authenticationEvents.listen(
        (GoogleSignInAuthenticationEvent event) {
          _handleAuthenticationEvent(event);
        },
        onError: (error) {
          log('Authentication error: $error');
        },
      );

      // Attempt lightweight authentication for auto sign-in
      // await _googleSignIn.attemptLightweightAuthentication();
    } catch (e) {
      log('Failed to initialize Google Sign-In: $e');
    }
  }

  // Handle authentication events (sign in/sign out)
  void _handleAuthenticationEvent(GoogleSignInAuthenticationEvent event) {
    switch (event) {
      case GoogleSignInAuthenticationEventSignIn():
        _currentUser = event.user;
        log('User signed in: ${_currentUser?.email}');
        break;
      case GoogleSignInAuthenticationEventSignOut():
        _currentUser = null;
        log('User signed out');
        break;
    }
  }

  Future<void> ensureGoogleSignInInitialized() async {
    if (!_isGoogleSignInInitialized) {
      await initializeGoogleSignIn();
    }
  }

  final List<String> userAuthenticationResult = ['email', 'profile'];

  // Updated Google Sign-In method for v7+ supporting both web and mobile
  Future<UserCredential> signInWithGoogle() async {
    if (kIsWeb) {
      // WEB: Use Firebase's signInWithPopup which handles the OAuth flow natively.
      // The google_sign_in plugin does NOT support authenticate() on web.
      log('Web platform: Using signInWithPopup');
      try {
        final GoogleAuthProvider googleProvider = GoogleAuthProvider();
        googleProvider.addScope('email');
        googleProvider.addScope('profile');
        final userCredential = await FirebaseAuth.instance.signInWithPopup(
          googleProvider,
        );
        log('Successfully signed in via popup: ${userCredential.user?.email}');
        return userCredential;
      } catch (e) {
        log('Google Sign-In Popup Error: $e');
        rethrow;
      }
    }

    // MOBILE (Android/iOS): Use google_sign_in plugin
    await ensureGoogleSignInInitialized();

    try {
      GoogleSignInAccount? account;

      if (_googleSignIn.supportsAuthenticate()) {
        log('Using authenticate() method for mobile');
        account = await _googleSignIn.authenticate(
          scopeHint: userAuthenticationResult,
        );
      } else {
        throw UnsupportedError(
          'This platform does not support authentication',
        );
      }

      // Get authentication details - SYNCHRONOUS in v7+
      final GoogleSignInAuthentication googleAuth = account.authentication;

      // Get the authorization for the required scopes
      final GoogleSignInClientAuthorization? authorization = await account
          .authorizationClient
          .authorizationForScopes(userAuthenticationResult);

      // Create Firebase credential
      final credential = GoogleAuthProvider.credential(
        accessToken: authorization?.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase
      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      log('Successfully signed in: ${userCredential.user?.email}');
      return userCredential;
    } on GoogleSignInException catch (e) {
      log('Google Sign-In Error: ${e.code.name} - ${e.description}');
      rethrow;
    } catch (error) {
      log('Google Sign-In Error: $error');
      rethrow;
    }
  }

  // Listen to authentication events (especially useful for web)
  Stream<GoogleSignInAuthenticationEvent> get authenticationStream {
    return _googleSignIn.authenticationEvents;
  }

  // Get current signed-in account (useful for web after renderButton)
  GoogleSignInAccount? get currentAccount {
    return _currentUser;
  }

  // Optional: Attempt lightweight authentication (silent sign-in)
  Future<UserCredential?> attemptLightweightAuthentication() async {
    await ensureGoogleSignInInitialized();

    try {
      final GoogleSignInAccount? account = await _googleSignIn
          .attemptLightweightAuthentication();

      if (account == null) {
        log('No existing credentials found');
        return null;
      }

      // Get authentication details - SYNCHRONOUS in v7+
      final GoogleSignInAuthentication googleAuth = account.authentication;

      // Get the authorization for the required scopes
      final GoogleSignInClientAuthorization? authorization = await account
          .authorizationClient
          .authorizationForScopes(userAuthenticationResult);

      final credential = GoogleAuthProvider.credential(
        accessToken: authorization?.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      log('Lightweight authentication failed: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
      log('Successfully signed out');
    } catch (error) {
      log('Google Sign-Out Error: $error');
      rethrow;
    }
  }

  Future<bool> isSignedIn() async {
    try {
      // Check Firebase Auth instead of Google Sign-In directly
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Check if the user signed in with Google provider
        final providerData = user.providerData;
        return providerData.any(
          (provider) => provider.providerId == 'google.com',
        );
      }
      return false;
    } catch (e) {
      log('Error checking sign-in status: $e');
      return false;
    }
  }

  // Helper method to check if authenticate is supported on this platform
  bool canUseAuthenticate() {
    return _googleSignIn.supportsAuthenticate();
  }
}
