

class NotificationTime {
  final int hours;
  final int minutes;

  NotificationTime(this.hours, this.minutes);

  NotificationTime.fromString(String notificationTimeString)
      : hours = int.parse(notificationTimeString.split(':').first),
        minutes = int.parse(notificationTimeString.split(':').last);

  @override
  String toString() {
    return hours.toString().padLeft(2,'0') + ':' + minutes.toString().padLeft(2,'0');
  }

  DateTime toDateTime() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, hours, minutes);
  }
}