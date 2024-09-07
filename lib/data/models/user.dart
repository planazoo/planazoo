import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String role;
  final String status;
  final String? group;
  final Map<String, dynamic> notificationPreferences;
  final List<String> activityLog;
  final String timezone;
  final Timestamp lastActive;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.status,
    this.group,
    required this.notificationPreferences,
    required this.activityLog,
    required this.timezone,
    required this.lastActive,
  });

  factory User.fromFirestore(Map<String, dynamic> data) {
    return User(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      role: data['role'] ?? '',
      status: data['status'] ?? '',
      group: data['group'],
      notificationPreferences: data['notificationPreferences'] ?? {},
      activityLog: List<String>.from(data['activityLog'] ?? []),
      timezone: data['timezone'] ?? '',
      lastActive: data['lastActive'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'status': status,
      'group': group,
      'notificationPreferences': notificationPreferences,
      'activityLog': activityLog,
      'timezone': timezone,
      'lastActive': lastActive,
    };
  }
}
