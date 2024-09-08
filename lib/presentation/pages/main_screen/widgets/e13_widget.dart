import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/colors.dart';

class E13Widget extends StatelessWidget {
  final VoidCallback onClose; // Callback to close the profile screen

  const E13Widget({required this.onClose}); // Constructor for handling close action

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser; // Get the current logged-in user

    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection('users').doc(user?.uid).get(), // Fetch user document from Firestore
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator()); // Show loading indicator while fetching data
        }

        if (snapshot.hasError || !snapshot.hasData || !snapshot.data!.exists) {
          return Center(child: Text('Error loading user data')); // Show error message if there's an issue
        }

        final userData = snapshot.data!.data() as Map<String, dynamic>;

        return Container(
          color: AppColors.color4, // Background color for E13 (Slate Gray)
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Close button (left arrow)
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: onClose, // Call the close function
              ),
              // Display user fields
              Text(
                'Name: ${userData['name'] ?? 'Unknown'}',
                style: TextStyle(fontSize: 18, color: AppColors.color0),
              ),
              SizedBox(height: 8),
              Text(
                'Email: ${userData['email'] ?? 'Unknown'}',
                style: TextStyle(fontSize: 18, color: AppColors.color0),
              ),
              SizedBox(height: 8),
              Text(
                'Role: ${userData['role'] ?? 'Unknown'}',
                style: TextStyle(fontSize: 18, color: AppColors.color0),
              ),
              SizedBox(height: 8),
              // Add any other user fields you want to display
            ],
          ),
        );
      },
    );
  }
}
