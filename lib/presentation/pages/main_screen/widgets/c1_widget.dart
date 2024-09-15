import 'package:flutter/material.dart';
import '../../../../core/colors.dart'; // Import centralized colors

class C1Widget extends StatelessWidget {
  const C1Widget({Key? key}) : super(key: key);  // Add key parameter

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.05, // 5% of the screen width for C1
      color: AppColors.color1, // Background color for C1 (Light Blue)
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Align at the top
        children: [
          // Row R1: W3 (Settings icon), aligned at the top
          IconButton(
            icon: Icon(Icons.person),
            color: AppColors.color0, // Color 0 (White)
            onPressed: () {
              // Implement profile action
            },
          ),

          // Row R2: W2 (Gear icon for settings)
          IconButton(
            icon: Icon(Icons.settings),
            color: AppColors.color0, // Color 0 (White)
            onPressed: () {
              // Implement settings action
            },
          ),

          Spacer(), // Use spacer to push the rest of the content down

          // Add other widgets or buttons here if needed.
        ],
      ),
    );
  }
}
