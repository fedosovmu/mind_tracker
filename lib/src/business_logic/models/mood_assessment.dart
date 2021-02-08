import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/part_of_day.dart';
import 'package:intl/intl.dart';


class MoodAssessment {
  final int mood;
  PartOfDay partOfDay;
  String date;
  String time;

  MoodAssessment({@required this.mood, this.partOfDay, this.date, this.time}) {
    if (partOfDay == null) {
      final now = DateTime.now();
      date = DateFormat('yyyy-MM-dd').format(now);
      time = DateFormat('hh:mm').format(now);
      partOfDay = PartOfDayBuilder.fromDateTime(now);
    }
  }

  static MoodAssessment fromMap(Map<String, dynamic> mood_assessment_map) {
    return MoodAssessment(
      date: mood_assessment_map['date'],
      mood: mood_assessment_map['mood'],
      partOfDay: PartOfDayBuilder.fromShortString(mood_assessment_map['part_of_day']),
      time: mood_assessment_map['time'],
    );
  }

  Map<String, dynamic> toMap () {
    final mood_assessment_map = {
      'date': date,
      'mood': mood,
      'part_of_day': partOfDay.toShortString()
    };
    if (time != null) {
      mood_assessment_map['time'] = time;
    }
    return mood_assessment_map;
  }

  @override
  String toString() {
    return '{date: "$date", mood: $mood, partOfDay: "$partOfDay", time: "$time"}';
  }

}