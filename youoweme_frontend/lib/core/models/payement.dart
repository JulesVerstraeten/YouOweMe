// ignore_for_file: unused_field

import 'package:youoweme_project/core/models/transaction.dart';

class Payment {
  final int _id;
  final double _amount;
  final DateTime _date;
  final Transaction _transaction;

  Payment({
    required int id,
    required double amount,
    required DateTime date,
    required Transaction transaction,
  })  : _id = id,
        _amount = amount,
        _date = date,
        _transaction = transaction;

  double giveAmount() {
    return _amount;
  }
}
