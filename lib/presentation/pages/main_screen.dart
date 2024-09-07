// lib/presentation/pages/main_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/event_list.dart';
import '../widgets/event_details.dart';

class MainScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planazoo'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: EventList(),  // Left sidebar
          ),
          Expanded(
            flex: 3,
            child: EventDetails(),  // Main content area
          ),
        ],
      ),
    );
  }
}
