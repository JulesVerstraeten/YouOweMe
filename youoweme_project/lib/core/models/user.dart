import 'package:youoweme_project/core/models/contact.dart';
import 'package:youoweme_project/core/models/transaction.dart';

class User {
  // ignore: unused_field
  final int _id;
  final Map<int, Contact> _contacts = {};

  User({required int id}) : _id = id;

  List<Contact> giveAllContacts() {
    return _contacts.values.toList();
  }

  List<Contact> giveAllContactsWithOpenTransaction() {
    List<Contact> contactsWithOpenTransaction = [];
    for (var contact in _contacts.values.toList()) {
      if (contact.hasOpenTransaction()) {
        contactsWithOpenTransaction.add(contact);
      }
    }
    return contactsWithOpenTransaction;
  }

  void addContact(Contact contact) {
    _contacts[contact.returnId()] = contact;
  }

  void addTransactionToContact(Contact contact, Transaction transaction) {
    _contacts[contact.returnId()]?.addTransaction(transaction);
  }

  String getTotalAmount() {
    double amount = 0;
    for (var contact in _contacts.values) {
      amount += contact.giveTotalAmount();
    }
    String amountString = amount.toStringAsFixed(2);
    return "€$amountString";
  }
}
