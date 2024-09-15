import 'package:flutter/material.dart';

class W31Widget extends StatelessWidget {
  final String? planazoo;  // Nullable planazoo

  const W31Widget({Key? key, this.planazoo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],  // Background color for the widget (light grey)
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          planazoo ?? 'No Plan Selected',  // Display the selected plan or fallback
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
