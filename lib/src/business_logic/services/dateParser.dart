import 'package:intl/intl.dart';


extension StringToDateTime on String {
  DateTime toDateTime() {
    return DateFormat('yyyy-MM-dd').parse(this);
  }
}

extension DateTimeToString on DateTime {
  String toStringDate() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  DateTime get date {
    return DateTime(this.year, this.month, this.day);
  }
}