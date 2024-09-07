import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state_management/user_provider.dart';

class UserProfile extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: userAsyncValue.when(
        data: (user) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${user.name}', style: TextStyle(fontSize: 20)),
              Text('Email: ${user.email}', style: TextStyle(fontSize: 20)),
              Text('Role: ${user.role}', style: TextStyle(fontSize: 20)),
              Text('Status: ${user.status}', style: TextStyle(fontSize: 20)),
              // Add more fields as needed
            ],
          ),
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
