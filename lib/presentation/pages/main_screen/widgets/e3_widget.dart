import 'package:flutter/material.dart';
import '../../../../core/colors.dart'; // Import the centralized colors

class E3Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55, // Fixed height for the header
      color: AppColors.color0, // Background color for [E3] (White)
      child: Center(
        child: Text(
          'Header: E3',
          style: TextStyle(
            fontSize: 20,
            color: AppColors.color4, // Slate Gray text color
          ),
        ),
      ),
    );
  }
}
