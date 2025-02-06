import 'package:flutter/material.dart';

class AppStyles {
  // TODO Alle kleuren erin zetten

  // PrimaryColor
  static Color primaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? const Color.fromRGBO(231, 231, 231, 1)
        : Colors.black;
  }

// PrimaryColor
  static Color secondaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? const Color.fromRGBO(168, 168, 168, 1)
        : Colors.black;
  }

  static Color secondaryColor2(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? const Color.fromRGBO(117, 117, 117, 1)
        : Colors.black;
  }

  static Color secondaryColor3(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? const Color.fromRGBO(81, 81, 81, 1)
        : Colors.black;
  }

  static Color darkText(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? const Color.fromARGB(255, 45, 45, 45)
        : Colors.black;
  }

  static Color primaryBlue(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? const Color.fromRGBO(72, 151, 255, 1)
        : Colors.black;
  }

  static Color primaryRed(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? const Color.fromRGBO(250, 63, 67, 1)
        : Colors.black;
  }
}
