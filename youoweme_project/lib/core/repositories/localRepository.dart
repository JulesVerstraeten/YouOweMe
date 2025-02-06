import 'package:youoweme_project/core/models/contact.dart';
import 'package:youoweme_project/core/models/transaction.dart';
import 'package:youoweme_project/core/models/transaction_status.dart';
import 'package:youoweme_project/core/models/transaction_type.dart';
import 'package:youoweme_project/core/models/user.dart';

class LocalRepository {
  late User user;

  LocalRepository() {
    user = User(id: 0);
    Contact c1 = Contact(id: 0, name: "Jan");
    Contact c2 = Contact(id: 1, name: "Peter");
    Contact c3 = Contact(id: 2, name: "Piet");
    Transaction t1 = Transaction(
        id: 0,
        amount: 80,
        title: "Bioscoop",
        createdAt: DateTime.now(),
        transactionStatus: TransactionStatus.open,
        transactionType: TransactionType.loan);

    Transaction t2 = Transaction(
        id: 1,
        amount: 120,
        title: "Bier",
        createdAt: DateTime.now(),
        transactionStatus: TransactionStatus.open,
        transactionType: TransactionType.loan);
    Transaction t3 = Transaction(
        id: 2,
        amount: 110,
        title: "Bier",
        createdAt: DateTime.now(),
        transactionStatus: TransactionStatus.open,
        transactionType: TransactionType.loan);
    user.addContact(c1);
    user.addTransactionToContact(c1, t1);
    user.addTransactionToContact(c1, t2);
    user.addContact(c2);
    user.addTransactionToContact(c2, t3);
    user.addContact(c3);
  }

  List<Contact> giveAllContacts() {
    return user.giveAllContacts();
  }

  double getUserTotalAmount() {
    return user.getTotalAmount();
  }

  List<Contact> getAllUserOpenTransaction() {
    return user.giveAllContactsWithOpenTransaction();
  }

  User fetchUser() {
    return user;
  }
}
