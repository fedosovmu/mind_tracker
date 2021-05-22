

class NotificationTime {
  final int hours;
  final int minutes;

  NotificationTime(this.hours, this.minutes);

  NotificationTime.fromString(String notificationTimeString)
      : hours = int.parse(notificationTimeString.split(':').first),
        minutes = int.parse(notificationTimeString.split(':').last);

  @override
  String toString() {
    return '$hours:$minutes';
  }

  DateTime toDateTime() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, hours, minutes);
  }
}