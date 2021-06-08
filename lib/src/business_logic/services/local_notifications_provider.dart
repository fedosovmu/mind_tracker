import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationsProvider {
  static FlutterLocalNotificationsPlugin _localeNotification;

  static Future<void> initialize() async {
    await _initializeLocalNotificationPlugin();
    await _setNotificationTasks();
  }

  static Future<void> _initializeLocalNotificationPlugin() async {
    final androidInitializationSettings = AndroidInitializationSettings('notification_icon');
    final iosInitializationSettings = IOSInitializationSettings();
    final initializationSettings = InitializationSettings(
        android: androidInitializationSettings,
        iOS: iosInitializationSettings
    );
    _localeNotification = FlutterLocalNotificationsPlugin();
    await _localeNotification.initialize(
        initializationSettings,
        onSelectNotification: _onSelectNotification
    );
  }

  static Future<void> _onSelectNotification(String payload) async {
    print('Notification selected: $payload');
  }

  static Future<void> _setNotificationTasks() async {
    final now = DateTime.now();
    await _localeNotification.cancelAll();

    //_localeNotification.show(0, 'now', 'body', _getNotificationDetails(), payload: 'test');

    tz.initializeTimeZones();
    final scheduledDate = tz.TZDateTime.now(tz.local).add(Duration(seconds: 5));

    _localeNotification.zonedSchedule(
      1,
      'zoned schedue',
      'body',
      scheduledDate,
      _getNotificationDetails(),
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: false,
      payload: 'test schedue'
    );

    final pendingNotificationsRequests = await _localeNotification.pendingNotificationRequests();
    print('[LOCALE NOTIFICATIONS] ${pendingNotificationsRequests.map((pendingNotification) {
      return '{${pendingNotification.id}, ${pendingNotification.title}}';
    }).toList()}');
  }

  static NotificationDetails _getNotificationDetails() {
    final androidNotificationDetails = AndroidNotificationDetails(
      'mindTrackerChannel',
      'Mind tracker assess mood notifications',
      'Channel with notifications that ask assess mood',
      importance: Importance.max,
      priority: Priority.high,
    );
    final iosNotificationDetails = IOSNotificationDetails();
    return NotificationDetails(
      android: androidNotificationDetails,
      //iOS: iosNotificationDetails
    );
  }
}