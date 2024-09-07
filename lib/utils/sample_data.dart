// lib/utils/sample_data.dart

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addSampleEvent() async {
  CollectionReference events = FirebaseFirestore.instance.collection('planazoos');

  await events.add({
    'name': 'Sample Event',
    'startDate': '2024-10-01',
    'endDate': '2024-10-03',
    'participants': ['Alice', 'Bob'],
    'agenda': 'Discuss project milestones',
  });

  print('Sample event added');
}
