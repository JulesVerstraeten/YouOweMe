import 'package:flutter/material.dart';

class SlidingPage {
  openSlidingPage(BuildContext context, Widget page) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: page,
        );
      },
    );
  }
}
