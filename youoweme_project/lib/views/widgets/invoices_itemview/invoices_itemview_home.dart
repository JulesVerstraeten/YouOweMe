import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youoweme_project/core/utils/navigations/navigation_helper.dart';
import 'package:youoweme_project/core/utils/theme.dart';
import 'package:youoweme_project/viewmodels/local_viewmodel.dart';

class InvoiceListviewWidget extends StatelessWidget {
  const InvoiceListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LocalViewModel>(context);

    return Expanded(
      child: ListView.builder(
        itemCount: viewModel.contacts.length - 1,
        itemBuilder: (context, index) {
          final contact = viewModel.contactsWithOpenTransaction[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: ElevatedButton(
              onPressed: () {
                viewModel.selectContact(contact);
                NavigationHelper.navigateToContact(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppStyles.primaryColor(context),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      contact.giveName(),
                      style: TextStyle(
                        fontSize: 24,
                        color: AppStyles.darkText(context),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          contact.getTotalAmountToString(),
                          style: TextStyle(
                            fontSize: 24,
                            color: AppStyles.darkText(context),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14, 0, 0, 0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: AppStyles.darkText(context),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
