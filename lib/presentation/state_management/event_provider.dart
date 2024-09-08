// lib/presentation/state_management/event_provider.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/event.dart';  // Import the Event model

// Provider to manage a list of Event events
final eventProvider = StateNotifierProvider<EventNotifier, List<Event>>((ref) {
  return EventNotifier();
});

class EventNotifier extends StateNotifier<List<Event>> {
  EventNotifier() : super([]);

  // Fetch all Event events from Firestore
  Future<void> fetchEvents() async {
    final snapshot = await FirebaseFirestore.instance.collection('events').get();
    state = snapshot.docs.map((doc) => Event.fromFirestore(doc)).toList();
  }

  // Add a new Event
  Future<void> addEvent(Event event) async {
    await FirebaseFirestore.instance.collection('events').add(event.toFirestore());
    state = [...state, event];
  }

  // Update an existing Event
  Future<void> updateEvent(Event event) async {
    await FirebaseFirestore.instance.collection('events').doc(event.id).update(event.toFirestore());
    state = [
      for (final e in state) if (e.id == event.id) event else e,
    ];
  }

  // Delete an Event
  Future<void> deleteEvent(String id) async {
    await FirebaseFirestore.instance.collection('events').doc(id).delete();
    state = state.where((event) => event.id != id).toList();
  }
}

// Provider to track the currently selected Event
final selectedEventProvider = StateProvider<Event?>((ref) => null);
