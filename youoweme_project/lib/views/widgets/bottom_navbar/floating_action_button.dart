import 'package:flutter/material.dart';
import 'package:youoweme_project/core/utils/theme.dart';
import 'package:youoweme_project/views/sliding_pages/add_transaction_slidepage.dart';

class FloatingActionButtonCenterDock extends StatelessWidget {
  const FloatingActionButtonCenterDock({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionPage = AddTransactionSlidePage();
    return SizedBox(
      width: 65,
      height: 65,
      child: FloatingActionButton(
        backgroundColor: AppStyles.primaryColor(context),
        shape: const CircleBorder(),
        elevation: 0,
        child: Icon(
          Icons.add,
          size: 40,
          color: AppStyles.secondaryColor3(context),
        ),
        onPressed: () {
          // Handle the floating action button press here
          transactionPage.showSlidingPage(context);
        },
      ),
    );
  }
}
