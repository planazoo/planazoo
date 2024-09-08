import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/colors.dart'; 
import '../../state_management/auth_provider.dart'; // Import the userRoleProvider
import 'widgets/c1_widget.dart';
import 'widgets/c2_widget.dart';
import 'widgets/c3_widget.dart';

class MainScreen extends ConsumerStatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  String? selectedPlanazoo; // State to track selected Planazoo

  @override
  Widget build(BuildContext context) {
    final userRoleAsyncValue = ref.watch(userRoleProvider);

    return Scaffold(
      body: userRoleAsyncValue.when(
        data: (role) {
          return Container(
            color: AppColors.color0, // Full screen background color (White)
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10), // Margins for C0
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.color0, // Background color of C0
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  if (role == 'admin') ...[
                    // Admin-only functionality (e.g., manage users, create events)
                    Text("Admin Controls"),
                  ],
                  if (role == 'editor') ...[
                    // Editor functionality (e.g., edit events)
                    Text("Editor Controls"),
                  ],
                  if (role == 'viewer') ...[
                    // Viewer functionality (read-only)
                    Text("Viewer Mode"),
                  ],
                  Expanded(
                    child: Row(
                      children: [
                        // C1 takes 5% of the screen width
                        Container(
                          width: MediaQuery.of(context).size.width * 0.05, 
                          child: C1Widget(),
                        ),
                        // C2 takes 30% of the screen width
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3, 
                          child: C2Widget(
                            onPlanSelected: (plan) {
                              setState(() {
                                selectedPlanazoo = plan; // Update the selected Planazoo
                              });
                            },
                          ),
                        ),
                        // C3 takes the remaining space
                        Expanded(
                          child: C3Widget(
                            selectedPlanazoo: selectedPlanazoo, // Pass selected Planazoo to C3
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error loading role: $error')),
      ),
    );
  }
}
