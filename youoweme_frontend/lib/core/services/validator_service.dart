import 'package:youoweme_project/core/models/contact.dart';

class ValidatorService {
  static String? validateFieldIsNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return "Veld mag niet leeg zijn";
    }
    return null;
  }

  static String? validateInteger(String? value) {
    if (value == null || value.isEmpty) {
      return "Veld mag niet leeg zijn";
    }
    final intValue = int.tryParse(value);
    if (intValue == null) {
      return "Dit moet een cijfer zijn";
    }
    return null;
  }

  static String? validateDouble(String? value) {
    if (value == null || value.isEmpty) {
      return "Veld mag niet leeg zijn";
    }
    final doubleValue = double.tryParse(value);
    if (doubleValue == null) {
      return "Dit moet een cijfer zijn";
    }
    return null;
  }

  static String? validateContact(Contact? contact) {
    if (contact == null) return "Je moet er 1 selecteren";
    return null;
  }
}
