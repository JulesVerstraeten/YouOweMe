import 'package:youoweme_project/core/models/contact.dart';
import 'package:youoweme_project/core/models/user.dart';
import 'package:youoweme_project/core/repositories/localRepository.dart';

class LocalService {
  final LocalRepository _repo;

  LocalService({required LocalRepository repo}) : _repo = repo;

  double getUserAmount() {
    return _repo.getUserTotalAmount();
  }

  List<Contact> getAllContact() {
    return _repo.giveAllContacts();
  }

  User fetchUser() {
    return _repo.fetchUser();
  }

  List<Contact> getUserAllOpenTransactions() {
    return _repo.getAllUserOpenTransaction();
  }
}
