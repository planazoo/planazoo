import 'package:flutter/material.dart';
import '../../../../core/colors.dart'; // Import the centralized colors

class E5Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55, // Fixed height for the footer
      color: AppColors.color4, // Background color for [E5] (Slate Gray)
      child: Center(
        child: Text(
          'Footer: E5',
          style: TextStyle(
            fontSize: 20,
            color: AppColors.color0, // White text color
          ),
        ),
      ),
    );
  }
}
