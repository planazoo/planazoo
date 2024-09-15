import 'package:flutter/material.dart';
import '../../../../core/colors.dart'; // Import centralized colors

class W17Widget extends StatelessWidget {
  const W17Widget({super.key});  // Use 'super.key' shorthand

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55, // Fixed height for W17
      color: AppColors.color4, // Background color for W17 (Slate Gray)
      child: Center(
        child: Text(
          'W17',
          style: TextStyle(
            fontSize: 20,
            color: AppColors.color0, // White text color
          ),
        ),
      ),
    );
  }
}
