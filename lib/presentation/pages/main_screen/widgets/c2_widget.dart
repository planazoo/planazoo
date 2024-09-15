import 'package:flutter/material.dart';
import 'w2_widget.dart';  // W2 (R1, C2)
import 'w3_widget.dart';  // W3 (R1, C2)
import 'w4_widget.dart';  // W4 (R1, C2)
import 'w13_widget.dart';  // W13 (R2, C2)
import 'w26_widget.dart';  // W26 (R3, C2)
import 'w27_widget.dart';  // W27 (R4, C2)
import 'w28_widget.dart';  // W28 (Rows 5 to 12, C2)
import 'w29_widget.dart';  // W29 (Row 13, C2)

class C2Widget extends StatelessWidget {
  final Function(String) onPlanSelected;

  const C2Widget({Key? key, required this.onPlanSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row 1: W2, W3, W4 placed in C2 with the specified flex distribution
        Row(
          children: [
            // W2 takes 70% of the row's width
            Expanded(flex: 7, child: W2Widget()),  // W2 in C2 (Row 1)
            
            // W3 takes 15% of the row's width
            Expanded(flex: 1, child: W3Widget()),  // W3 in C2 (Row 1)
            
            // W4 takes 15% of the row's width
            Expanded(flex: 1, child: W4Widget()),  // W4 in C2 (Row 1)
          ],
        ),

        // Row 2: W13 in C2
        W13Widget(),

        // Row 3: W26 in C2
        W26Widget(),

        // Row 4: W27 in C2
        W27Widget(),

        // Rows 5 to 12: W28 in C2 (Scrollable Planazoo List)
        Expanded(
          flex: 9,
          child: W28Widget(
            onPlanSelected: onPlanSelected,  // Pass the callback to W28
          ),
        ),

        // Row 13: W29 in C2
        Container(
          height: 55,
          child: W29Widget(),
        ),
      ],
    );
  }
}
