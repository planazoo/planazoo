import 'package:flutter/material.dart';
import '../../../../core/colors.dart';

class W27Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      color: AppColors.color2, // Background color (Color2)
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'W27', // Display "W27" (or another label if needed)
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.color0, // Text color (White)
            ),
          ),
          // Additional UI elements can be added here
        ],
      ),
    );
  }
}
