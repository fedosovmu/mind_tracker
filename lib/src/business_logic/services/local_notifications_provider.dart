import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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
        onSelectNotification: _onSelectNotificationCallback
    );
  }

  static Future<void> _onSelectNotificationCallback(String payload) async {
    print('Notification selected $payload');
  }

  static Future<void> _setNotificationTasks() async {
    final now = DateTime.now();
    //await _localeNotification.cancelAll();

    _localeNotification.show(0, 'now', 'body', _getNotificationDetails());

    final pendingNotificationsRequests = await _localeNotification.pendingNotificationRequests();
    print('[LOCALE NOTIFICATIONS] ${pendingNotificationsRequests.map((e) => e.id)}');
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
      iOS: iosNotificationDetails
    );
  }
}