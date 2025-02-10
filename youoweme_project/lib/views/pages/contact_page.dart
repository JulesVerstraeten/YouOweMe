import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youoweme_project/core/utils/theme.dart';
import 'package:youoweme_project/viewmodels/local_viewmodel.dart';
import 'package:youoweme_project/views/widgets/bottom_navbar/bottom_navbar_with_action_button.dart';
import 'package:youoweme_project/views/widgets/bottom_navbar/floating_action_button.dart';
import 'package:youoweme_project/views/widgets/pageview/contact_pageview.dart';
import 'package:youoweme_project/views/widgets/toggle_button/toggle_transaction_state.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LocalViewModel>(context);
    final selectedContact = viewModel.selectedContact;

    return Scaffold(
      backgroundColor: AppStyles.backgroundColor(context),
      // * Bottom navigation bar
      floatingActionButton: FloatingActionButtonCenterDock(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavbarWithAction(
        page: "home",
      ),
      extendBodyBehindAppBar: false,
      body: SafeArea(
        child: Column(
          children: [
            // * Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              // margin: EdgeInsets.all(16),
              // decoration: BoxDecoration(
              //     color: AppStyles.primaryColor(context),
              //     borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selectedContact!.giveName(),
                    style: TextStyle(
                      color: AppStyles.darkText(context),
                      fontSize: 34,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Totaal: ${selectedContact.getTotalAmountToString()}",
                    style: TextStyle(
                      color: AppStyles.darkText(context),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            //* Toggle State
            ToggleTransactionState(),
            // * Invoices
            InvoicesPageView(),
          ],
        ),
      ),
    );
  }
}
