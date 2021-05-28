import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/notification_time.dart';


class CustomTimePickerController extends ChangeNotifier {
  int _hours;
  int _minutes;
  NotificationTime get time => NotificationTime(_hours, _minutes);

  CustomTimePickerController({NotificationTime initialTime}) {
    _hours = initialTime.hours;
    _minutes = initialTime.minutes;
  }

  void changeHours(int hours) {
    _hours = hours;
    notifyListeners();
  }

  void changeMinutes(int minutes) {
    _minutes = minutes;
    notifyListeners();
  }
}