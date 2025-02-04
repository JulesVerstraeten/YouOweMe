import 'package:flutter/material.dart';
import 'package:navbar_project/widgets/bottom_navbar/bottom_navbar_without_action.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavbarWithoutAction(page: 'none'),
    );
  }
}
