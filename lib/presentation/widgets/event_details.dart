// lib/presentation/widgets/event_details.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state_management/planazoo_provider.dart';

class EventDetails extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedEvent = ref.watch(selectedPlanazooProvider);

    if (selectedEvent == null) {
      return Center(child: Text('No event selected'));
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            selectedEvent.name,
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 8),
          Text('Date: ${selectedEvent.date}', style: Theme.of(context).textTheme.subtitle1),
          SizedBox(height: 16),
          Text('Participants: ${selectedEvent.participants.join(", ")}'),
          SizedBox(height: 16),
          Text('Agenda: ${selectedEvent.agenda}'),
        ],
      ),
    );
  }
}
