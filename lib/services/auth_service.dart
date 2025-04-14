import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Check if a user is logged in
  bool get isLoggedIn => _auth.currentUser != null;

  // Get current user email
  String? get currentUserEmail => _auth.currentUser?.email;

  // Get current user ID
  String? get currentUserId => _auth.currentUser?.uid;

  // Register with email and password
  Future<UserCredential?> register(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (_) {
      rethrow; // Rethrow to handle in the UI
    }
  }

  // Login with email and password
  Future<UserCredential?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (_) {
      rethrow; // Rethrow to handle in the UI
    }
  }

  // Reset password
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (_) {
      rethrow; // Rethrow to handle in the UI
    }
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
  }
}
