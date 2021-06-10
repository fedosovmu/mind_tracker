import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mind_tracker/src/app.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationsProvider {
  static FlutterLocalNotificationsPlugin _localNotification;
  static NotificationAppLaunchDetails launchDetails;

  static Future<void> initialize() async {
    await _initializeLocalNotificationPlugin();
    tz.initializeTimeZones();
  }

  static Future<void> _initializeLocalNotificationPlugin() async {
    final androidInitializationSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iosInitializationSettings = IOSInitializationSettings();
    final initializationSettings = InitializationSettings(
        android: androidInitializationSettings,
        iOS: iosInitializationSettings
    );
    _localNotification = FlutterLocalNotificationsPlugin();
    await _localNotification.initialize(
        initializationSettings,
        onSelectNotification: _onSelectNotification
    );

    final pendingNotificationsRequests = await _localNotification.pendingNotificationRequests();
    print('[LOCAL NOTIFICATIONS] ${pendingNotificationsRequests.map((pendingNotification) {
      return '{${pendingNotification.id}, ${pendingNotification.payload}}';
    }).toList()}');

    launchDetails = await _localNotification.getNotificationAppLaunchDetails();
    print('[LOCAL NOTIFICATIONS] did notification launch app: ${launchDetails.didNotificationLaunchApp}');
  }

  static void showNotification() {
    _localNotification.show(0, 'Test', 'body', _getNotificationDetails());
  }

  static Future<void> _onSelectNotification (String payload) async {
    print('[NOTIFICATION]: $payload');
    final context = App.navigatorKey.currentContext;
    Navigator.of(context).pushNamed('/moodAssessment', arguments: {'startMode': 'now'});
  }

  static Future<void> cancelAllNotifications() async {
    await _localNotification.cancelAll();
  }

  static createDelayedNotification(int id, DateTime notificationTime) {
    final scheduledDatetime = tz.TZDateTime.from(notificationTime, tz.local);
    _localNotification.zonedSchedule(
        id,
        'Оцени своё настроение',
        'Нажми для оценки',
        scheduledDatetime,
        _getNotificationDetails(),
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: false,
        payload: '${notificationTime}'
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