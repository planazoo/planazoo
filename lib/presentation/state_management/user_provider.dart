import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/user.dart'; // Update the import path as needed

final userProvider = StreamProvider.autoDispose<User>((ref) {
  final firestore = FirebaseFirestore.instance;
  final userId = 'some_user_id'; // Replace with dynamic user ID

  // Stream to fetch user data from Firestore
  return firestore.collection('users').doc(userId).snapshots().map((snapshot) {
    if (snapshot.exists) {
      return User.fromFirestore(snapshot.data()!);
    } else {
      throw Exception('User not found');
    }
  });
});
