import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/colors.dart'; // Import the centralized colors

class E2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser; // Get the current logged-in user

    return Container(
      width: double.infinity, // E2 takes the full width of its parent (C2)
      height: 55, // Fixed height of 40 for E2
      color: AppColors.color4, // Background color for E2 (White)
      padding: EdgeInsets.symmetric(horizontal: 16), // Padding for text inside E2
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between "Planazoos" and email
        children: [
          // Title "Planazoos"
          Text(
            'Planazoos',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.color4, // Slate Gray text color
            ),
          ),
          // User's email (if logged in)
          if (user != null)
            Text(
              user.email ?? 'No email found', // Fallback if email is null
              style: TextStyle(
                fontSize: 18,
                color: AppColors.color4, // Slate Gray text color
              ),
            ),
        ],
      ),
    );
  }
}
