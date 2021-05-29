import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/models/notification_time.dart';
import 'package:mind_tracker/src/business_logic/services/cloud_firestore_provider.dart';


class SettingsProvider extends ChangeNotifier {
  bool get hasNotifications => notificationTimes.isNotEmpty;
  List<NotificationTime> notificationTimes;

  Future<void> loadData() async {
    notificationTimes = [];
    final settings = await CloudFirestoreProvider.getSettings();
    if (settings != null) {
      _parseNotificationTimesFromSettings(settings);
    }
    notifyListeners();
    return;
  }

  void _parseNotificationTimesFromSettings(Map<String, dynamic> settings) {
    if (settings.containsKey('notification_times')) {
      notificationTimes = (settings['notification_times'] as List<dynamic>).map(
              (timeString) => NotificationTime.fromString(timeString)).toList();
    }
  }

  void setNotificationTimes(List<NotificationTime> times) {
    notificationTimes = times;
    CloudFirestoreProvider.setSettingsNotificationTimes(times);
    notifyListeners();
  }
}