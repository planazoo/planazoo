import 'package:flutter/material.dart';
import '../../../../core/colors.dart';  // Import centralized colors

class W2Widget extends StatelessWidget {
  const W2Widget({Key? key}) : super(key: key);  // Add key parameter for performance

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,  // Fixed height for W2
      color: AppColors.color1,  // Background color for W2 (Light Blue)
      child: Center(
        child: Text(
          'W2',  // Display W2 text
          style: TextStyle(
            fontSize: 20,
            color: AppColors.color0,  // White text color
          ),
        ),
      ),
    );
  }
}
