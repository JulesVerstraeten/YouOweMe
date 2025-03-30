import 'package:flutter/material.dart';
import 'package:youoweme_project/views/widgets/bottom_navbar/bottom_navbar_without_action_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavbarWithoutAction(page: 'none'),
    );
  }
}
