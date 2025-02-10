import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youoweme_project/core/models/transaction_status.dart';
import 'package:youoweme_project/viewmodels/navigation_viewmodel.dart';
import 'package:youoweme_project/views/widgets/invoices_itemview/invoices_itemview_contact.dart';

class InvoicesPageView extends StatelessWidget {
  const InvoicesPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationViewModel = Provider.of<NavigationViewModel>(context);

    return Flexible(
      child: PageView(
        controller: navigationViewModel.pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          InvoiceListviewContactWidget(status: TransactionStatus.open),
          InvoiceListviewContactWidget(status: TransactionStatus.closed),
        ],
      ),
    );
  }
}
