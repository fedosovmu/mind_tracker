import 'package:flutter/cupertino.dart';
import 'package:mind_tracker/src/business_logic/models/part_of_day.dart';


class MoodAssessment {
  final int mood;
  PartOfDay partOfDay;
  DateTime time;

  MoodAssessment({@required this.mood, this.partOfDay, this.time}) {
    if (partOfDay == null) {
      if (time == null) {
        time = DateTime.now();
      }
      partOfDay = PartOfDayBuilder.fromDateTime(time);
    }
  }

  static MoodAssessment fromMap(Map<String, dynamic> mood_assessment_map) {
    return MoodAssessment(
      mood: mood_assessment_map['mood'],
      partOfDay: PartOfDayBuilder.fromShortString(mood_assessment_map['part_of_day']),
    );
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