

enum PartOfDay {morning, day, evening, night}


class MoodAssessment {
  final int mood;
  PartOfDay partOfDay;
  DateTime time;

  MoodAssessment({this.mood}) {
    time = DateTime.now();
    _setPartOfDay(time);
  }

  void _setPartOfDay(DateTime time) {
    final hours = time.hour;
    if (hours >= 6 && hours <= 12) {
      partOfDay = PartOfDay.morning;
    } else if (hours > 12 && hours < 18) {
      partOfDay = PartOfDay.day;
    } else if (hours >= 18 && hours < 24) {
      partOfDay = PartOfDay.evening;
    } else {
      partOfDay = PartOfDay.night;
    }
  }

  String getTime() {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    return '$hours:$minutes';
  }

  Map<String, dynamic> toMap() {
    return {
      'mood': mood,
      'partOfDay': partOfDay,
      'time': time,
    };
  }

  @override
  String toString() {
    return '{mood: $mood, partOfDay: "$partOfDay", time: "$time"}';
  }

}