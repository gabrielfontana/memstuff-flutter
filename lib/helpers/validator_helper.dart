const kRequiredField = 'Campo obrigatório';

class ValidatorHelper {
  static String checkValidation(String text) {
    if (text.isEmpty)
      return kRequiredField;
    else
      return null;
  }
}
