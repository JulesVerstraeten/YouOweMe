import 'package:flutter/material.dart';
import 'package:youoweme_project/core/models/contact.dart';
import 'package:youoweme_project/core/models/user.dart';
import 'package:youoweme_project/core/services/localService.dart';

class LocalViewModel extends ChangeNotifier {
  final LocalService _service;
  late User _user;

  LocalViewModel(this._service) {
    loadUser();
  }

  User get user => _user;

  void loadUser() {
    _user = _service.fetchUser();
    notifyListeners();
  }

  double getUserTotalAmount() {
    return _service.getUserAmount();
  }

  List<Contact> getAllContacts() {
    return _service.getAllContact();
  }

  List<Contact> getUserAllOpenTransaction() {
    return _service.getUserAllOpenTransactions();
  }
}
