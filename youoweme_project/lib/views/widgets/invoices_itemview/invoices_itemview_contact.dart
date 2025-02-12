import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youoweme_project/core/models/transaction.dart';
import 'package:youoweme_project/core/models/transaction_status.dart';
import 'package:youoweme_project/core/utils/theme.dart';
import 'package:youoweme_project/viewmodels/local_viewmodel.dart';

class InvoiceListviewContactWidget extends StatelessWidget {
  final TransactionStatus _status;
  const InvoiceListviewContactWidget(
      {super.key, required TransactionStatus status})
      : _status = status;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LocalViewModel>(context);
    final List<Transaction> transactions;
    if (_status == TransactionStatus.open) {
      transactions = viewModel.selectedContact!.getAllOpenTransactions();
    } else {
      transactions = viewModel.selectedContact!.getAllClosedTransactions();
    }

    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          child: ElevatedButton(
            onPressed: () {},
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
                    transaction.getTitle(),
                    style: TextStyle(
                      fontSize: 24,
                      color: AppStyles.darkText(context),
                      fontWeight: FontWeight.normal,
                    ),
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false,
                  ),
                  Row(
                    children: [
                      Text(
                        transaction.getAmountString(),
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
    );
  }
}
