import 'package:flutter/material.dart';
import '../../../../core/colors.dart'; // Import the centralized colors

class W30Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55, // Fixed height for the footer
      color: AppColors.color4, // Background color for [W30] (Slate Gray)
      child: Center(
        child: Text(
          'Footer: W30', // Footer label
          style: TextStyle(
            fontSize: 20,
            color: AppColors.color0, // White text color
          ),
        ),
      ),
    );
  }
}
