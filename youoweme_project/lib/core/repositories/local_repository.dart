import 'package:youoweme_project/core/models/contact.dart';
import 'package:youoweme_project/core/models/transaction.dart';
import 'package:youoweme_project/core/models/transaction_status.dart';
import 'package:youoweme_project/core/models/transaction_type.dart';
import 'package:youoweme_project/core/models/user.dart';

class LocalRepository {
  late User user;
  int contactId = 0;
  int transactionId = 0;

  LocalRepository() {
    user = User(id: 0);
    Contact c1 = Contact(id: contactId, name: "Jan Betere");
    contactId++;
    Contact c2 = Contact(id: contactId, name: "Peter Haargeenmeterereer");
    contactId++;
    Contact c3 = Contact(id: contactId, name: "Piet slimme");
    contactId++;
    Transaction t1 = Transaction(
        id: transactionId,
        amount: 80,
        title: "Bioscoop",
        contact: c1,
        createdAt: DateTime.now(),
        transactionStatus: TransactionStatus.open,
        transactionType: TransactionType.loan);
    transactionId++;
    Transaction t2 = Transaction(
        id: transactionId,
        amount: 120,
        title: "Bier",
        contact: c1,
        createdAt: DateTime.now(),
        transactionStatus: TransactionStatus.open,
        transactionType: TransactionType.loan);
    transactionId++;
    Transaction t3 = Transaction(
        id: transactionId,
        amount: 110,
        title: "Bier",
        contact: c2,
        createdAt: DateTime.now(),
        transactionStatus: TransactionStatus.open,
        transactionType: TransactionType.loan);
    transactionId++;
    Transaction t4 = Transaction(
        id: transactionId,
        amount: 110,
        title: "Bier",
        contact: c1,
        createdAt: DateTime.now(),
        transactionStatus: TransactionStatus.open,
        transactionType: TransactionType.loan);
    transactionId++;
    Transaction t5 = Transaction(
        id: transactionId,
        amount: 80,
        title: "Hoeren",
        contact: c1,
        createdAt: DateTime.now(),
        transactionStatus: TransactionStatus.closed,
        transactionType: TransactionType.loan);
    transactionId++;
    user.addContact(c1);
    user.addTransactionToContact(c1, t1);
    user.addTransactionToContact(c1, t2);
    user.addTransactionToContact(c1, t4);
    user.addTransactionToContact(c1, t5);
    user.addContact(c2);
    user.addTransactionToContact(c2, t3);
    user.addContact(c3);
  }

  Future<void> addTransaction(Transaction transaction) async {
    transaction.setId(transactionId);
    transactionId++;
    await transaction.getContact().addTransaction(transaction);
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
