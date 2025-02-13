import 'package:youoweme_project/core/models/contact.dart';
import 'package:youoweme_project/core/models/transaction.dart';
import 'package:youoweme_project/core/models/transaction_status.dart';
import 'package:youoweme_project/core/models/transaction_type.dart';
import 'package:youoweme_project/core/models/user.dart';

class LocalRepository {
  late User user;

  LocalRepository() {
    user = User(id: 0);
    Contact c1 = Contact(id: 0, name: "Jan Betere");
    Contact c2 = Contact(id: 1, name: "Peter Haargeenmeterereer");
    Contact c3 = Contact(id: 2, name: "Piet slimme");
    Transaction t1 = Transaction(
        id: 0,
        amount: 80,
        title: "Bioscoop",
        contact: c1,
        createdAt: DateTime.now(),
        transactionStatus: TransactionStatus.open,
        transactionType: TransactionType.loan);
    Transaction t2 = Transaction(
        id: 1,
        amount: 120,
        title: "Bier",
        contact: c1,
        createdAt: DateTime.now(),
        transactionStatus: TransactionStatus.open,
        transactionType: TransactionType.loan);
    Transaction t3 = Transaction(
        id: 2,
        amount: 110,
        title: "Bier",
        contact: c2,
        createdAt: DateTime.now(),
        transactionStatus: TransactionStatus.open,
        transactionType: TransactionType.loan);
    Transaction t4 = Transaction(
        id: 3,
        amount: 110,
        title: "Bier",
        contact: c1,
        createdAt: DateTime.now(),
        transactionStatus: TransactionStatus.open,
        transactionType: TransactionType.loan);
    Transaction t5 = Transaction(
        id: 4,
        amount: 80,
        title: "Hoeren",
        contact: c1,
        createdAt: DateTime.now(),
        transactionStatus: TransactionStatus.closed,
        transactionType: TransactionType.loan);
    user.addContact(c1);
    user.addTransactionToContact(c1, t1);
    user.addTransactionToContact(c1, t2);
    user.addTransactionToContact(c1, t4);
    user.addTransactionToContact(c1, t5);
    user.addContact(c2);
    user.addTransactionToContact(c2, t3);
    user.addContact(c3);
  }

  User fetchUser() {
    return user;
  }

  Future<List<Contact>> giveAllContacts() async {
    return user.giveAllContacts();
  }

  String getUserTotalAmount() {
    return user.getTotalAmount();
  }

  Future<List<Contact>> getAllContactsWithOpenTransaction() async {
    return user.giveAllContactsWithOpenTransaction();
  }
}
