import 'package:flutter/material.dart';

class SlidingPage {
  openSlidingPage(BuildContext context, Widget page) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Volledige hoogte mogelijk
      backgroundColor:
          Colors.transparent, // Transparante achtergrond voor effect
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.93,
          child: page,
        );
      },
    );
  }
}
