const kRequiredField = 'Campo obrigatório';
const kNegativeValue = 'Não utilize valores negativos';
const kZeroValue = 'Não utilize valores iguais a 0';

class ValidatorHelper {
  static String checkValidation(String text) {
    if (text.isEmpty)
      return kRequiredField;
    else if (double.parse(text).isNegative)
      return kNegativeValue;
    else if (double.parse(text) == 0)
      return kZeroValue;
    else
      return null;
  }
}
