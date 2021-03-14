import 'package:intl/intl.dart';


extension StringExtension on String {
  DateTime toDateTime() {
    return DateFormat('yyyy-MM-dd').parse(this);
  }
}

extension DateTimeExtension on DateTime {
  String toStringDate() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  DateTime get date {
    return DateTime(this.year, this.month, this.day);
  }
}