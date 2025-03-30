import 'package:flutter/material.dart';

class NavigationViewModel extends ChangeNotifier {
  final PageController pageController = PageController();

  void goToFirstPage() {
    pageController.previousPage(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  void goToSecondPage() {
    pageController.nextPage(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
