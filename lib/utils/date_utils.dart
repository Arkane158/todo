import 'package:intl/intl.dart';

class MyDateUtils {
  static String formatTaskDate(DateTime dateTime) {
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(dateTime);
  }
}

extension DateTimeExtension on DateTime {
  DateTime extractDateOnly() {
    return DateTime(year, month, day);
  }
  
}
