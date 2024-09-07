// lib/presentation/widgets/event_list.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state_management/planazoo_provider.dart';

class EventList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(planazooProvider);

    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return ListTile(
          title: Text(event.name),
          onTap: () {
            ref.read(selectedPlanazooProvider.notifier).state = event;
          },
        );
      },
    );
  }
}
