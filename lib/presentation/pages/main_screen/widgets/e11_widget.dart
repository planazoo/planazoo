import 'package:flutter/material.dart';
import '../../../../core/colors.dart'; // Import the centralized colors

class E11Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.color2, // Background color for [E11]
      child: Center(
        child: Text(
          'E11',
          style: TextStyle(
            fontSize: 20,
            color: AppColors.color0, // White text color
          ),
        ),
      ),
    );
  }
}
