import 'package:flutter/material.dart';

class NavigationHelper {
  // * Navigate to home
  static void navigateToHome(BuildContext context) {
    if (ModalRoute.of(context)?.settings.name != '/home') {
      Navigator.pushNamed(context, '/home');
    }
  }

  // * Navigate to settings
  static void navigateToSetting(BuildContext context) {
    if (ModalRoute.of(context)?.settings.name != '/settings') {
      Navigator.pushNamed(context, '/settings');
    }
  }
}
