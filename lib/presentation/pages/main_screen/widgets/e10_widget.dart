import 'package:flutter/material.dart';
import '../../../../core/colors.dart'; // Import the centralized colors

class E10Widget extends StatelessWidget {
  final String planazoo; // Planazoo to display

  E10Widget({required this.planazoo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: AppColors.color0, // Background color for E10
      child: Text(
        'Selected Planazoo: $planazoo',
        style: TextStyle(
          fontSize: 20,
          color: AppColors.color4, // Slate Gray text color
        ),
      ),
    );
  }
}

