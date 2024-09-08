// lib/presentation/state_management/planazoo_provider.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/planazoo.dart';

// Provider to manage a list of Planazoo events
final planazooProvider = StateNotifierProvider<PlanazooNotifier, List<Planazoo>>((ref) {
  return PlanazooNotifier();
});

class PlanazooNotifier extends StateNotifier<List<Planazoo>> {
  PlanazooNotifier() : super([]);

  // Fetch all Planazoo events from Firestore
  Future<void> fetchEvents() async {
    final snapshot = await FirebaseFirestore.instance.collection('planazoos').get();
    state = snapshot.docs.map((doc) => Planazoo.fromFirestore(doc)).toList();
  }

  // Add a new Planazoo event
  Future<void> addEvent(Planazoo event) async {
    await FirebaseFirestore.instance.collection('planazoos').add(event.toFirestore());  // Use toFirestore()
    state = [...state, event];
  }

  // Update an existing Planazoo event
  Future<void> updateEvent(Planazoo event) async {
    await FirebaseFirestore.instance.collection('planazoos').doc(event.id).update(event.toFirestore());  // Use toFirestore()
    state = [
      for (final e in state) if (e.id == event.id) event else e,
    ];
  }

  // Delete a Planazoo event
  Future<void> deleteEvent(String id) async {
    await FirebaseFirestore.instance.collection('planazoos').doc(id).delete();
    state = state.where((event) => event.id != id).toList();
  }
}

// Provider to track the currently selected Planazoo
final selectedPlanazooProvider = StateProvider<Planazoo?>((ref) => null);
