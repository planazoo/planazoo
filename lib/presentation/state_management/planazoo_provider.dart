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

  Future<void> fetchEvents() async {
    final snapshot = await FirebaseFirestore.instance.collection('planazoos').get();
    state = snapshot.docs.map((doc) => Planazoo.fromFirestore(doc)).toList();
  }

  Future<void> addEvent(Planazoo event) async {
    await FirebaseFirestore.instance.collection('planazoos').add(event.toFirestore());
    state = [...state, event];
  }

  Future<void> updateEvent(Planazoo event) async {
    await FirebaseFirestore.instance.collection('planazoos').doc(event.id).update(event.toFirestore());
    state = [
      for (final e in state) if (e.id == event.id) event else e,
    ];
  }

  Future<void> deleteEvent(String id) async {
    await FirebaseFirestore.instance.collection('planazoos').doc(id).delete();
    state = state.where((event) => event.id != id).toList();
  }
}

final selectedPlanazooProvider = StateProvider<Planazoo?>((ref) => null);
