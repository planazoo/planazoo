import 'package:flutter/material.dart';
import '../../../../core/colors.dart'; // Import the centralized colors

class E7Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // E7 takes the full width of its parent (C2)
      height: 55, // Fixed height of 55 for E7
      color: AppColors.color2, // Background color for E7 (Color 2)
      padding: EdgeInsets.symmetric(horizontal: 16), // Padding for text inside E7
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Align the text to the left
        children: [
          // Text "E7"
          Text(
            'E7',
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

