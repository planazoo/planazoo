import 'package:flutter/material.dart';
import 'e13_widget.dart'; // Import the E13 (Profile Screen)
import '../../../../core/colors.dart'; // Import the centralized colors

class C1Widget extends StatefulWidget {
  @override
  _C1WidgetState createState() => _C1WidgetState();
}

class _C1WidgetState extends State<C1Widget> {
  OverlayEntry? overlayEntry;

  void toggleProfile() {
    if (overlayEntry == null) {
      overlayEntry = _createOverlayEntry();
      Overlay.of(context)!.insert(overlayEntry!);
    } else {
      overlayEntry!.remove();
      overlayEntry = null;
    }
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned(
        left: MediaQuery.of(context).size.width * 0.1, // Position based on 10% left padding
        top: 30,
        width: MediaQuery.of(context).size.width * 0.6, // 60% of the screen width
        height: MediaQuery.of(context).size.height - 40, // Full height with padding adjustment
        child: Material(
          color: AppColors.color4, // Background color for E13
          child: E13Widget(
            onClose: toggleProfile, // Close the overlay when the arrow is clicked
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.1, // 10% of the screen width for C1
      color: AppColors.color1, // Color 1 (Light Blue)
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end, // Align button at the bottom
        children: [
          IconButton(
            icon: Icon(Icons.person),
            color: AppColors.color0, // Color 0 (White)
            onPressed: toggleProfile, // Toggle the profile overlay
          ),
        ],
      ),
    );
  }
}
