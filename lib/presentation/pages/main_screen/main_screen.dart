import 'package:flutter/material.dart';
import '../main_screen/widgets/c1_widget.dart';  // C1
import '../main_screen/widgets/c2_widget.dart';  // C2
import '../main_screen/widgets/c3_widget.dart';  // C3

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? selectedPlanazoo;  // Holds the selected Planazoo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // C1 (Left Sidebar)
          const C1Widget(),  // This contains the left sidebar (W1, W2, W13, etc.)

          // C2 (Middle Section)
          Expanded(
            flex: 3,
            child: C2Widget(
              onPlanSelected: (plan) {
                setState(() {
                  selectedPlanazoo = plan;  // Update the selected Planazoo
                });
              },
            ),
          ),

          // C3 (Right Section)
          Expanded(
            flex: 5,
            child: C3Widget(
              selectedPlan: selectedPlanazoo,  // Pass the selected plan to C3
            ),
          ),
        ],
      ),
    );
  }
}
