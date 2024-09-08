import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore import
import 'package:flutter/material.dart';
import '../../../../core/colors.dart'; // Import the centralized colors

class E9Widget extends StatefulWidget {
  final Function(String) onPlanSelected; // Callback to pass selected Planazoo

  E9Widget({required this.onPlanSelected});

  @override
  _E9WidgetState createState() => _E9WidgetState();
}

class _E9WidgetState extends State<E9Widget> {
  int? _selectedIndex; // Track the selected index

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('planazoos').snapshots(), // Fetch planazoos from Firestore
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Show loading indicator
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error fetching Planazoos'));
          }

          final planazooDocs = snapshot.data?.docs ?? [];

          return ListView.builder(
            itemCount: planazooDocs.length,
            itemBuilder: (context, index) {
              final planazooData = planazooDocs[index];
              final planazooName = planazooData['name']; // Assuming 'name' is the field for Planazoo name

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index; // Update the selected index
                  });
                  widget.onPlanSelected(planazooName); // Pass selected Planazoo
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: _selectedIndex == index ? AppColors.color1 : AppColors.color0, // Change background on selection
                  child: Text(
                    planazooName,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.color4, // Slate Gray text color
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
