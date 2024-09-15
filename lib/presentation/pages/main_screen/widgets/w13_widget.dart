import 'package:flutter/material.dart';
import '../../../../core/colors.dart'; // Import centralized colors

class W13Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55, // Fixed height for W13
      color: AppColors.color4, // Background color for W13 (Slate Gray)
      child: Center(
        child: Text(
          'W13',
          style: TextStyle(
            fontSize: 20,
            color: AppColors.color0, // White text color
          ),
        ),
      ),
    );
  }
}
