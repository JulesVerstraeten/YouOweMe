import 'package:flutter/material.dart';
import 'package:youoweme_project/core/utils/theme.dart';
import 'package:youoweme_project/views/sliding_pages/add_contact_page.dart';
import 'package:youoweme_project/views/sliding_pages/sliding_page.dart';

class AddButtonSlider extends StatelessWidget {
  const AddButtonSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppStyles.secondaryColor(context),
          elevation: 0,
          shape: CircleBorder(),
          padding: EdgeInsets.all(16)),
      onPressed: () {
        SlidingPage().openSlidingPage(context, ContactSlidePage());
      },
      child: Icon(
        Icons.add,
        color: AppStyles.darkText(context),
        size: 24,
      ),
    );
  }
}
