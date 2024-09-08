import 'package:flutter/material.dart';
import 'e10_widget.dart';
import 'e11_widget.dart';
import 'e12_widget.dart';
import 'e3_widget.dart';
import 'e5_widget.dart';
import '../../../../core/colors.dart'; // Import the centralized colors

class C3Widget extends StatelessWidget {
  final String? selectedPlanazoo; // Selected Planazoo

  C3Widget({this.selectedPlanazoo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        E3Widget(), // Header

        // Row 1: [E10] and [E11]
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                child: selectedPlanazoo != null
                    ? E10Widget(planazoo: selectedPlanazoo!) // Display Planazoo details
                    : Container(
                        color: AppColors.color0,
                        child: Center(child: Text("No Planazoo Selected")), // Placeholder when no plan is selected
                      ),
              ),
              Expanded(child: E11Widget()), // Right column in first row
            ],
          ),
        ),

        Expanded(flex: 2, child: E12Widget()), // Full-width row
        E5Widget(), // Footer
      ],
    );
  }
}
