import 'package:youoweme_project/core/exceptions/validation_exception.dart';

class ValidatorService {
  static void validateStringIsNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      throw ValidationException("Input mag niet leeg zijn");
    }
  }
}
