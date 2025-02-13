// ignore_for_file: unused_field

import 'package:youoweme_project/core/models/contact.dart';
import 'package:youoweme_project/core/models/payement.dart';
import 'package:youoweme_project/core/models/transaction_status.dart';
import 'package:youoweme_project/core/models/transaction_type.dart';

class Transaction {
  final int _id;
  final double _amount;
  final String _title;
  final String? _description;
  final Contact _contact;
  final DateTime _createdAt;
  final DateTime? _paymentDay;
  final TransactionStatus _transactionStatus;
  final TransactionType _transactionType;
  final List<Payment> _payments = [];

  Transaction({
    required int id,
    required double amount,
    required String title,
    String? description,
    required Contact contact,
    required DateTime createdAt,
    DateTime? paymentDay,
    required TransactionStatus transactionStatus,
    required TransactionType transactionType,
  })  : _id = id,
        _amount = amount,
        _title = title,
        _description = description,
        _contact = contact,
        _createdAt = createdAt,
        _paymentDay = paymentDay,
        _transactionStatus = transactionStatus,
        _transactionType = transactionType;

  TransactionStatus giveTransactionStatus() {
    return _transactionStatus;
  }

  // * Gives transaction's total amount
  double giveAmount() {
    double amount = _amount;
    for (var payment in _payments) {
      amount -= payment.giveAmount();
    }
    return amount;
  }

  // * Return transaction's ID
  int returnId() {
    return _id;
  }

  TransactionStatus getStatus() {
    return _transactionStatus;
  }

  String getTitle() {
    return _title;
  }

  String getAmountString() {
    return "€$_amount";
  }

  Contact getContact() {
    return _contact;
  }
}
