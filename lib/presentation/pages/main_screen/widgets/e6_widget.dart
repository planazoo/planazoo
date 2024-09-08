import 'package:flutter/material.dart';
import '../../../../core/colors.dart'; // Import the centralized colors

class E6Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // E6 takes the full width of its parent (C2)
      height: 55, // Fixed height of 55 for E6
      color: AppColors.color1, // Background color for E6 (Color 1)
      padding: EdgeInsets.symmetric(horizontal: 16), // Padding for text inside E6
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Align the text to the left
        children: [
          // Text "E6"
          Text(
            'E6',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.color0, // Color 0 (White) text color
            ),
          ),
        ],
      ),
    );
  }
}
