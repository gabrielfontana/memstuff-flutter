const kRequiredField = 'Campo obrigatório';
const kInvalidPhone = 'Telefone inválido';
const kInvalidDate = 'Data inválida';

class ValidatorHelper {
  static String checkValidation(String text) {
    if (text.isEmpty)
      return kRequiredField;
    else
      return null;
  }

  static String checkPhone(String text) {
    if (text.isEmpty)
      return kRequiredField;
    else if (text.length != 13 && text.length != 14)
      return kInvalidPhone;
    else
      return null;
  }
}
