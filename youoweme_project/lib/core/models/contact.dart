import 'package:youoweme_project/core/models/transaction.dart';
import 'package:youoweme_project/core/models/transaction_status.dart';

class Contact {
  // ignore: unused_field
  final int _id;
  String _name;
  final Map<int, Transaction> _transactions = {};

  Contact({required int id, required String name})
      : _id = id,
        _name = name;

  // * Give total amount of contact loans
  double giveTotalAmount() {
    double totalAmount = 0;
    for (var transaction in _transactions.values.toList()) {
      if (transaction.giveTransactionStatus() == TransactionStatus.open) {
        totalAmount += transaction.giveAmount();
      }
    }
    return totalAmount;
  }

  // * Give contact's name
  String giveName() {
    return _name;
  }

  // * Change contact's name
  void changeName(String newName) {
    _name = newName;
  }

  // * Add transaction to contact
  void addTransaction(Transaction transaction) {
    _transactions[transaction.returnId()] = transaction;
  }

  // * Returns contact's ID
  int returnId() {
    return _id;
  }

  bool hasOpenTransaction() {
    for (var transaction in _transactions.values) {
      if (transaction.giveTransactionStatus() == TransactionStatus.open) {
        return true;
      }
    }
    return false;
  }
}
