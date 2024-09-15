import 'package:flutter/material.dart';
import 'w5_widget.dart';  // W5 (Row 1, C3)
import 'w6_widget.dart';  // W6 (Row 1, C3)
import 'w7_widget.dart';  // W7 (Row 1, C3)
import 'w8_widget.dart';  // W8 (Row 1, C3)
import 'w9_widget.dart';  // W9 (Row 1, C3)
import 'w10_widget.dart';  // W10 (Row 1, C3)
import 'w11_widget.dart';  // W11 (Row 1, C3)
import 'w12_widget.dart';  // W12 (Row 1, C3)
import 'w14_widget.dart';  // W14 (Row 2, C3)
import 'w15_widget.dart';  // W15 (Row 2, C3)
import 'w16_widget.dart';  // W16 (Row 2, C3)
import 'w17_widget.dart';  // W17 (Row 2, C3)
import 'w18_widget.dart';  // W18 (Row 2, C3)
import 'w19_widget.dart';  // W19 (Row 2, C3)
import 'w20_widget.dart';  // W20 (Row 2, C3)
import 'w21_widget.dart';  // W21 (Row 2, C3)
import 'w22_widget.dart';  // W22 (Row 2, C3)
import 'w23_widget.dart';  // W23 (Row 2, C3)
import 'w24_widget.dart';  // W24 (Row 2, C3)
import 'w30_widget.dart';  // W30 (Row 13, C3)
import 'w31_widget.dart';  // W31 (Rows 3-12, C3)

class C3Widget extends StatelessWidget {
  final String? selectedPlan;  // This holds the selected Planazoo

  const C3Widget({Key? key, required this.selectedPlan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row 1: Add widgets from W5 to W12 in a horizontal row
        Row(
          children: [
            Flexible(child: W5Widget()),
            Flexible(child: W6Widget()),
            Flexible(child: W7Widget()),
            Flexible(child: W8Widget()),
            Flexible(child: W9Widget()),
            Flexible(child: W10Widget()),
            Flexible(child: W11Widget()),
            Flexible(child: W12Widget()),
          ],
        ),

        // Row 2: Add widgets from W14 to W24 in a horizontal row (W25 is hidden)
        Row(
          children: [
            Flexible(child: W14Widget()),
            Flexible(child: W15Widget()),
            Flexible(child: W16Widget()),
            Flexible(child: W17Widget()),
            Flexible(child: W18Widget()),
            Flexible(child: W19Widget()),
            Flexible(child: W20Widget()),
            Flexible(child: W21Widget()),
            Flexible(child: W22Widget()),
            Flexible(child: W23Widget()),
            Flexible(child: W24Widget()),
          ],
        ),

        // Rows 3 to 12: Show W31 (Main Planazoo details)
        Expanded(
          flex: 9,
          child: W31Widget(
            planazoo: selectedPlan,  // Pass the selected plan
          ),
        ),

        // Row 13: Add W30 at the bottom of C3
        Container(
          height: 55,
          child: W30Widget(),
        ),
      ],
    );
  }
}
