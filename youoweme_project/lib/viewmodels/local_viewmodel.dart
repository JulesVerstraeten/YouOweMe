import 'package:flutter/material.dart';
import 'package:youoweme_project/core/models/contact.dart';
import 'package:youoweme_project/core/models/user.dart';
import 'package:youoweme_project/core/repositories/local_repository.dart';

class LocalViewModel extends ChangeNotifier {
  final LocalRepository _repo;

  LocalViewModel({required LocalRepository repo}) : _repo = repo;

  User? _user;
  List<Contact> _contacts = [];
  List<Contact> _contactsWithOpenTransaction = [];
  late Contact? _selectedContact;

  User? get user => _user;
  List<Contact> get contacts => _contacts;
  List<Contact> get contactsWithOpenTransaction => _contactsWithOpenTransaction;
  Contact? get selectedContact => _selectedContact;

  Future<void> fetchData() async {
    _user = _repo.fetchUser();
    _contacts = await _repo.giveAllContacts();
    _contactsWithOpenTransaction =
        await _repo.getAllContactsWithOpenTransaction();
    notifyListeners();
  }

  String getTotalAmountToString() {
    String amount = _repo.getUserTotalAmount();
    return amount;
  }

  void selectContact(Contact contact) {
    _selectedContact = contact;
    notifyListeners();
  }
}
