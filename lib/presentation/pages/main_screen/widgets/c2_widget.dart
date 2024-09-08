import 'package:flutter/material.dart';
import 'e2_widget.dart'; // Import E2Widget
import 'e6_widget.dart'; // Import E6Widget
import 'e7_widget.dart'; // Import E7Widget
import 'e8_widget.dart'; // Import E8Widget
import 'e9_widget.dart'; // Import E9Widget
import 'c3_widget.dart'; // Import C3Widget

class C2Widget extends StatefulWidget {
  final Function(String) onPlanSelected; // Add a callback to pass the selected plan to C3

  C2Widget({required this.onPlanSelected});

  @override
  _C2WidgetState createState() => _C2WidgetState();
}

class _C2WidgetState extends State<C2Widget> {
  String? selectedPlanazoo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        E2Widget(), // Add E2 at the top of C2
        E6Widget(), // Add E6 just below E2
        E7Widget(), // Add E7 just below E6
        E8Widget(), // Add E8 just below E7

        // Scrollable list of Planazoos in E9
        E9Widget(
          onPlanSelected: (plan) {
            setState(() {
              selectedPlanazoo = plan; // Update the selected Planazoo
            });
            widget.onPlanSelected(plan); // Pass the selected Planazoo to C3
          },
        ),
      ],
    );
  }
}
