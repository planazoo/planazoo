import 'package:flutter/material.dart';
import '../../../../core/colors.dart'; // Import the centralized colors

class E12Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, // Fixed height for E12
      color: AppColors.color3, // Background color for [E12]
      child: Center(
        child: Text(
          'E12',
          style: TextStyle(
            fontSize: 20,
            color: AppColors.color0, // White text color
          ),
        ),
      ),
    );
  }
}
