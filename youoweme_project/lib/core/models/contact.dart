import 'package:flutter/material.dart';
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

  // * Get total amount and convert to string
  String getTotalAmountToString() {
    double totalAmount = 0;
    for (var transaction in _transactions.values.toList()) {
      if (transaction.giveTransactionStatus() == TransactionStatus.open) {
        totalAmount += transaction.giveAmount();
      }
    }
    String totalAmountString = totalAmount.toStringAsFixed(2);
    return "€$totalAmountString";
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
  Future<void> addTransaction(Transaction transaction) async {
    try {
      if (transaction.returnId() != null) {
        _transactions[transaction.returnId()!] = transaction;
      }
    } catch (e) {
      debugPrint("Fout: ${e.toString()}");
    }
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

  // * Give all open transactions
  List<Transaction> getAllOpenTransactions() {
    List<Transaction> openTransactions = [];
    for (Transaction transaction in _transactions.values) {
      if (transaction.getStatus() == TransactionStatus.open) {
        openTransactions.add(transaction);
      }
    }
    return openTransactions;
  }

// * Give all open transactions
  List<Transaction> getAllClosedTransactions() {
    List<Transaction> openTransactions = [];
    for (Transaction transaction in _transactions.values) {
      if (transaction.getStatus() == TransactionStatus.closed) {
        openTransactions.add(transaction);
      }
    }
    return openTransactions;
  }

  int getId() {
    return _id;
  }
}
