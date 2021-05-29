import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/models/notification_time.dart';


class SettingsProvider extends ChangeNotifier {
  bool _isHasSettingsDoc = false;

  Future<void> loadData() async {
    //load data
    notifyListeners();
    return;
  }

  bool get hasNotifications => notificationTimes.isNotEmpty;
  List<NotificationTime> notificationTimes = [];

  void setNotificationTimes(List<NotificationTime> times) {
    notificationTimes = times;
    notifyListeners();
  }
}