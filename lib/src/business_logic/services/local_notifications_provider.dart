import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationsProvider {
  static FlutterLocalNotificationsPlugin _localeNotification;

  static void initialize() {
    final androidInitializationSettings = AndroidInitializationSettings('launch_image');
    final iosInitializationSettings = IOSInitializationSettings();
    final initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings
    );
    _localeNotification = FlutterLocalNotificationsPlugin();
    _localeNotification.initialize(
      initializationSettings,
      onSelectNotification: (payload) async {
        print('Notification pressed');
      }
    );
    showNotification();
  }

  static Future showNotification() async {
    final androidNotificationDetails = AndroidNotificationDetails(
        'MoodAssessments',
        'Assess mood notifications',
        'Notifications that ask assess mood'
    );
    final iosNotificationDetails = IOSNotificationDetails();
    final notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails
    );
    await _localeNotification.show(0, 'Оцени своё настроение', 'Нажмите для оценки', notificationDetails, payload: '20:00');
    //final now = DateTime.now();
    //final scheduleDateTime = tz.TZDateTime(tz.local, now.year, now.month, now.day, now.hour, 14);
    //_localeNotification.zonedSchedule(0, 'Title', 'body', scheduleDateTime, notificationDetails,
    //    uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    //    androidAllowWhileIdle: true);

  }
}