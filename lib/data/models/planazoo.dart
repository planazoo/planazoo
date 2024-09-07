// lib/data/models/planazoo.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class Planazoo {
  final String id;
  final String name;
  final DateTime date;
  final List<String> participants;
  final String agenda;

  Planazoo({
    required this.id,
    required this.name,
    required this.date,
    required this.participants,
    required this.agenda,
  });

  factory Planazoo.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Planazoo(
      id: doc.id,
      name: data['name'],
      date: (data['date'] as Timestamp).toDate(),
      participants: List<String>.from(data['participants']),
      agenda: data['agenda'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'date': Timestamp.fromDate(date),
      'participants': participants,
      'agenda': agenda,
    };
  }
}
