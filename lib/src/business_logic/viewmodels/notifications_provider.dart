import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/models/notification_time.dart';
import 'package:mind_tracker/src/business_logic/services/cloud_firestore_provider.dart';
import 'package:mind_tracker/src/business_logic/services/local_notifications_provider.dart';


class NotificationsProvider extends ChangeNotifier {
  bool get didNotificationLaunchApp => LocalNotificationsProvider.launchDetails.didNotificationLaunchApp;
  bool get hasNotifications => notificationTimes.isNotEmpty;
  List<NotificationTime> notificationTimes;

  Future<void> loadData() async {
    await LocalNotificationsProvider.initialize();
    notificationTimes = [];
    final settings = await CloudFirestoreProvider.getSettings();
    if (settings != null) {
      _parseNotificationTimesFromSettings(settings);
      _setNotificationTasks();
    }
    notifyListeners();
    return;
  }

  void setOnSelectNotification(BuildContext context) {
    LocalNotificationsProvider.setOnSelectNotification(() {
      final routeName = ModalRoute.of(context).settings.name;
      final availableScreens = ['/main', '/settings', '/notification'];
      print('[ROUTE NAME] $routeName');
      if (availableScreens.contains(routeName)) {
        Navigator.of(context).pushNamed('/moodAssessment', arguments: {'startMode': 'now'});
      }
    });
  }

  void _parseNotificationTimesFromSettings(Map<String, dynamic> settings) {
    if (settings.containsKey('notification_times')) {
      notificationTimes = (settings['notification_times'] as List<dynamic>).map(
              (timeString) => NotificationTime.fromString(timeString)).toList();
    }
  }

  void _setNotificationTasks() {
    LocalNotificationsProvider.cancelAllNotifications();
    if (notificationTimes.isNotEmpty) {
      final now = DateTime.now();
      int notificationId = 0;
      for (int dayNumber = 0; dayNumber < DateTime.daysPerWeek; dayNumber++) {
        notificationTimes.forEach((notificationTime) {
            final delayedNotificationTime = DateTime(now.year, now.month, now.day,
                notificationTime.hours, notificationTime.minutes).add(Duration(days: dayNumber));
            if (delayedNotificationTime.isAfter(now))
              LocalNotificationsProvider.createDelayedNotification(notificationId++, delayedNotificationTime);
          }
        );
      }
    }
  }

  void setNotificationTimes(List<NotificationTime> times) {
    notificationTimes = times;
    CloudFirestoreProvider.setSettingsNotificationTimes(times);
    _setNotificationTasks();
    notifyListeners();
  }
}