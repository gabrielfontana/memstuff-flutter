import 'package:intl/intl.dart';

class DateHelper {
  DateHelper._();

  static DateFormat _format = DateFormat('dd/MM/yyyy');

  static DateTime parse(String date) {
    if (date == null) return null;
    if (date.isEmpty) return null;
    if (date.length < 10) return null;
    return _format.parse(date);
  }

  static String format(DateTime date) {
    if (date == null) return '';
    return _format.format(date);
  }
}
