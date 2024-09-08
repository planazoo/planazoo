import 'package:cloud_firestore/cloud_firestore.dart';  // Import for Firestore and Timestamp

class Event {
  final String id;
  final String name;
  final Timestamp startDate;
  final Timestamp endDate;
  final List<String> participants;

  Event({
    required this.id,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.participants,
  });

  // Convert Event object to a map for Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'startDate': startDate,
      'endDate': endDate,
      'participants': participants,
    };
  }

  // Convert Event object to a map (toMap)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'startDate': startDate,
      'endDate': endDate,
      'participants': participants,
    };
  }

  // Factory method to create Event from Firestore document (fromFirestore)
  factory Event.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;

    return Event(
      id: doc.id,
      name: data['name'] ?? '',
      startDate: data['startDate'] ?? Timestamp.now(),
      endDate: data['endDate'] ?? Timestamp.now(),
      participants: List<String>.from(data['participants'] ?? []),
    );
  }
}
