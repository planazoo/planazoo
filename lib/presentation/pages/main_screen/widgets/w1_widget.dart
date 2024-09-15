import 'package:flutter/material.dart';
import '../../../../core/colors.dart';

class W1Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded( // Ensures the widget takes available space without overflowing
          child: Container(
            padding: EdgeInsets.all(8),
            color: AppColors.color1, // Background color for W1 (Light Blue)
            child: Text(
              "W1 Widget Content",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.color0, // Text color (White)
              ),
            ),
          ),
        ),
      ],
    );
  }
}
