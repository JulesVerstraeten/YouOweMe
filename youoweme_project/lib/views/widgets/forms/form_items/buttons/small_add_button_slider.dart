import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youoweme_project/core/utils/theme.dart';
import 'package:youoweme_project/viewmodels/local_viewmodel.dart';
import 'package:youoweme_project/views/sliding_pages/add_contact_page.dart';
import 'package:youoweme_project/views/sliding_pages/sliding_page.dart';

class SmallAddButtonSlider extends StatelessWidget {
  const SmallAddButtonSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LocalViewModel>(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppStyles.textFieldFill(context),
          elevation: 0,
          shape: CircleBorder(),
          padding: EdgeInsets.all(16)),
      onPressed: () {
        viewModel.selectContact(viewModel.getContact(2));
        SlidingPage().openSlidingPage(context, AddContactSlidePage());
      },
      child: Icon(
        Icons.add,
        color: AppStyles.darkText(context),
        size: 24,
      ),
    );
  }
}
