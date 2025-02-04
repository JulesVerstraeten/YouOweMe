import 'package:flutter/material.dart';
import 'package:youoweme_project/views/widgets/bottom_navbar_with_action_button.dart';
import 'package:youoweme_project/views/widgets/floating_action_button.dart';
//import 'package:navbar_project/widgets/bottom_navbar_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButtonCenterDock(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavbarWithAction(
        page: "home",
      ),
      extendBodyBehindAppBar: false,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text('Home page'),
            ),
          ],
        ),
      ),
    );
  }
}
