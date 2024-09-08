import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

// This provider listens to the auth state (whether a user is logged in or not)
final authStateProvider = StreamProvider<User?>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return firebaseAuth.authStateChanges();
});

// Fetch user role from Firestore
final userRoleProvider = FutureProvider<String?>((ref) async {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  final User? user = firebaseAuth.currentUser;

  if (user != null) {
    // Fetch user document from Firestore
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    
    if (userDoc.exists) {
      // Return the user's role if the document exists
      return userDoc['role'] as String?;
    } else {
      // Handle the case where the document does not exist
      print("User document does not exist in Firestore.");
      return null;
    }
  }

  return null; // User not logged in or role not found
});

// Function for signing in with email and password
final signInProvider = Provider((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Error signing in: $e");
      return null;
    }
  }

  return signIn;
});

// Function for signing out
final signOutProvider = Provider((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  return signOut;
});
