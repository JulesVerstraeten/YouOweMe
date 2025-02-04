import 'package:flutter/material.dart';
import 'package:navbar_project/core/navigation/navigation_helper.dart';

class BottomNavbarWithAction extends StatelessWidget {
  final String page;
  const BottomNavbarWithAction({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromARGB(217, 217, 217, 217),
      shape: const CircularNotchedRectangle(),
      notchMargin: 10.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Color.fromARGB(255, 64, 64, 64),
            ),
            onPressed: () {
              NavigationHelper.navigateToHome(context);
            },
            iconSize: 36,
          ),
          IconButton(
            icon: const Icon(
              Icons.groups,
              color: Color.fromARGB(255, 64, 64, 64),
            ),
            onPressed: () {
              // Add functionality for groups button
            },
            iconSize: 36,
          ),
          const SizedBox(width: 48), // Space for the FloatingActionButton
          IconButton(
            icon: const Icon(
              Icons.description,
              color: Color.fromARGB(255, 64, 64, 64),
            ),
            onPressed: () {
              // Add functionality for description button
            },
            iconSize: 36,
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Color.fromARGB(255, 64, 64, 64),
            ),
            onPressed: () {
              NavigationHelper.navigateToSetting(context);
            },
            iconSize: 36,
          ),
        ],
      ),
    );
  }
}
