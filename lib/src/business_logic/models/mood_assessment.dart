import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/part_of_day.dart';
import 'package:mind_tracker/src/business_logic/services/dateParser.dart';


class MoodAssessment implements Comparable {
  final int mood;
  PartOfDay partOfDay;
  String date; //TODO: convert to DateTime
  Timestamp time; //TODO: convert to DateTime

  MoodAssessment({@required this.mood, this.partOfDay, this.date, this.time}) {
    if (partOfDay == null) {
      final now = DateTime.now();
      date = now.toStringDate();
      time = Timestamp.fromDate(now);
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
      'part_of_day': partOfDay.toShortString(),
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