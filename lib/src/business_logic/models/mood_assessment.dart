import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/part_of_day.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';


class MoodAssessment implements Comparable {
  final int mood;
  PartOfDay partOfDay;
  DateTime date;
  DateTime time;

  MoodAssessment({@required this.mood, this.partOfDay, this.date, this.time}) {
    if (partOfDay == null) {
      final now = DateTime.now();
      date = now.date;
      time = now;
      partOfDay = PartOfDayBuilder.fromDateTime(now);
    }
  }

  static MoodAssessment fromMap(Map<String, dynamic> moodAssessmentMap) {
    return MoodAssessment(
      date: moodAssessmentMap['date'].toString().toDateTime(),
      mood: moodAssessmentMap['mood'],
      partOfDay: PartOfDayBuilder.fromShortString(moodAssessmentMap['part_of_day']),
      time: moodAssessmentMap.containsKey('time') ? moodAssessmentMap['time'].toDate() : null,
    );
  }

  Map<String, dynamic> toMap () {
    final moodAssessmentMap = {
      'date': date.toStringDate(),
      'mood': mood,
      'part_of_day': partOfDay.toShortString(),
    };
    if (time != null) {
      moodAssessmentMap['time'] =Timestamp.fromDate(time);
    }
    return moodAssessmentMap;
  }

  @override
  String toString() {
    return toMap().toString();
  }

  @override
  int compareTo(other) {
    if (date != other.date) {
      return date.compareTo(other.date);
    } else {
      if (time != null && other.time != null) {
        return time.compareTo(other.time);
      } else {
        return partOfDay.index.compareTo(other.partOfDay.index);
      }
    }
  }
}