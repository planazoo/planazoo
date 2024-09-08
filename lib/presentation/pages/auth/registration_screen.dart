import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../state_management/auth_provider.dart';

class RegistrationScreen extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final firebaseAuth = ref.read(firebaseAuthProvider);

                try {
                  // Create user with Firebase Auth
                  UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                  final User? user = userCredential.user;

                  if (user != null) {
                    // Write additional user data to Firestore
                    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
                      'email': user.email,
                      'role': 'viewer', // Default role can be set here (e.g., 'viewer', 'editor', 'admin')
                      'status': 'active', // User's current status
                      'groups': [], // Initialize an empty list for groups
                      'notificationPreferences': {'emailEnabled': true}, // Default notification preference
                      'lastActive': FieldValue.serverTimestamp(), // Last active time
                      'createdAt': FieldValue.serverTimestamp(), // Timestamp for account creation
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Account created successfully!')),
                    );
                    Navigator.pop(context); // Navigate back to login screen
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Registration failed: $e')),
                  );
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
