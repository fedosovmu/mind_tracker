import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/notification_time.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/custom_time_picker/widgets/custom_drum_controller.dart';


class CustomTimePickerController extends ChangeNotifier {
  int _hours;
  int _minutes;
  NotificationTime get time => NotificationTime(_hours, _minutes);
  CustomDrumController hoursDrumController;
  CustomDrumController minutesDrumController;

  CustomTimePickerController({NotificationTime initialTime}) {
    _hours = initialTime.hours;
    _minutes = initialTime.minutes;
    hoursDrumController = CustomDrumController(
        itemsCount: 24,
        initValue: _hours,
        onSelectedValueChanged: (hours) {
          _hours = hours;
          notifyListeners();
        }
    );
    minutesDrumController = CustomDrumController(
        itemsCount: 60,
        initValue: _minutes,
        onSelectedValueChanged: (minutes) {
          _minutes = minutes;
          notifyListeners();
        }
    );
  }

  void setTime(NotificationTime time) {
    if (_hours != time.hours) {
      hoursDrumController.jumpTo(time.hours);
    }
    if (_minutes != time.minutes) {
      minutesDrumController.jumpTo(time.minutes);
    }
  }
}