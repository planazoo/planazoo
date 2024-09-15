import 'package:flutter/material.dart';

class W28Widget extends StatelessWidget {
  final Function(String) onPlanSelected; // Callback function for when a plan is selected

  const W28Widget({Key? key, required this.onPlanSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,  // Example: 10 plans
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Plan #$index'),
          onTap: () {
            onPlanSelected('Plan #$index'); // Notify the parent widget of the selected plan
          },
        );
      },
    );
  }
}

