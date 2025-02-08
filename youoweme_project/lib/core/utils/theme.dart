import 'package:flutter/material.dart';

class AppStyles {
  // TODO Alle kleuren erin zetten

  // BackgroundColor
  static Color backgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? const Color.fromARGB(255, 254, 247, 255)
        : const Color.fromARGB(255, 20, 20, 20);
  }

  // PrimaryColor
  static Color primaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? const Color.fromRGBO(231, 231, 231, 1)
        : const Color.fromARGB(255, 52, 52, 52);
  }

  // SecondaryColor
  static Color secondaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? const Color.fromARGB(255, 214, 214, 214)
        : const Color.fromARGB(255, 119, 119, 119);
  }

  static Color secondaryColor2(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? const Color.fromRGBO(117, 117, 117, 1)
        : Colors.black;
  }

  static Color secondaryColor3(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? const Color.fromRGBO(81, 81, 81, 1)
        : const Color.fromARGB(255, 201, 201, 201);
  }

  static Color darkText(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? const Color.fromARGB(255, 45, 45, 45)
        : const Color.fromARGB(255, 255, 255, 255);
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

  static Color colorSelectedTextSwitchButton(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? const Color.fromRGBO(72, 151, 255, 1)
        : const Color.fromARGB(255, 255, 255, 255);
  }

  static Color colorTextSwitchButton(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? const Color.fromARGB(255, 122, 122, 122)
        : const Color.fromARGB(255, 133, 133, 133);
  }
}
