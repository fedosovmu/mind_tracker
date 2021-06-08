import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationsProvider {
  static FlutterLocalNotificationsPlugin _localeNotification;

  static Future<void> initialize() async {
    await _initializeLocalNotificationPlugin();
    tz.initializeTimeZones();
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
        onSelectNotification: (payload) async {
          print('Notification selected: $payload');
        }
    );
  }

  static Future<void> setNotificationTasks() async {
    //await _localeNotification.cancelAll();

    final notificationDatetime = DateTime.now().add(Duration(seconds: 5));
    _createScheduleNotification(1, notificationDatetime, payload: 'Assess mood');

    final pendingNotificationsRequests = await _localeNotification.pendingNotificationRequests();
    print('[LOCALE NOTIFICATIONS] ${pendingNotificationsRequests.map((pendingNotification) {
      return '{${pendingNotification.id}, ${pendingNotification.title}}';
    }).toList()}');
  }

  static _createScheduleNotification(int id, DateTime notificationDatetime, {String payload}) {
    final scheduledDatetime = tz.TZDateTime.from(notificationDatetime, tz.local);
    _localeNotification.zonedSchedule(
        id,
        'Оцени своё настроение',
        'Нажми для оценки',
        scheduledDatetime,
        _getNotificationDetails(),
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: false,
        payload: payload
    );
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