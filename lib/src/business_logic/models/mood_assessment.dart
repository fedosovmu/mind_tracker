import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/event.dart';
import 'package:mind_tracker/src/business_logic/models/part_of_day.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';


class MoodAssessment implements Comparable {
  String docId;
  final int mood;
  PartOfDay partOfDay;
  DateTime date;
  DateTime time;
  List<Event> events;
  String note;

  MoodAssessment({@required this.mood, this.partOfDay, this.date, this.time, this.events, this.note, this.docId}) {
    if (partOfDay == null) {
      final now = DateTime.now();
      date = now.date;
      time = now;
      partOfDay = PartOfDayBuilder.fromDateTime(now);
    }
    if (events != null) {
      if (events.isEmpty) {
        events = null;
      }
    }
    if (note != null) {
      if (note == '') {
        note = null;
      }
    }
  }

  bool isSavedToCloudFirestore() {
    return docId != null;
  }

  static MoodAssessment fromMap(Map<String, dynamic> moodAssessmentMap, String docId) {
    return MoodAssessment(
      docId: docId,
      date: moodAssessmentMap['date'].toString().toDateTime(),
      mood: moodAssessmentMap['mood'],
      partOfDay: PartOfDayBuilder.fromShortString(moodAssessmentMap['part_of_day']),
      time: moodAssessmentMap.containsKey('time') ? moodAssessmentMap['time'].toDate() : null,
      events: moodAssessmentMap.containsKey('events') ? List<Event>.from(moodAssessmentMap['events']
              .map((e) => Event.fromMap(e))) : null,
      note: moodAssessmentMap.containsKey('note') ? moodAssessmentMap['note'] : null
    );
  }

  Map<String, dynamic> _toMap () {
    final moodAssessmentMap = {
      'date': date.toStringDate(),
      'mood': mood,
      'part_of_day': partOfDay.toShortString(),
    };
    if (time != null) {
      moodAssessmentMap['time'] = Timestamp.fromDate(time);
    }
    if (events != null) {
      moodAssessmentMap['events'] = List<dynamic>.from(events.map((e) => e.toMap()));
    }
    if (note != null) {
      moodAssessmentMap['note'] = note;
    }
    return moodAssessmentMap;
  }

  Map<String, dynamic> toMapForCreate(String uid) {
    final moodAssessmentMap = _toMap();
    moodAssessmentMap['uid'] = uid;
    return moodAssessmentMap;
  }

  Map<String, dynamic> toMapForUpdate() {
    final moodAssessmentMap = _toMap();
    if (moodAssessmentMap['events'] == null) {
      moodAssessmentMap['events'] = FieldValue.delete();
    }
    if (moodAssessmentMap['note'] == null) {
      moodAssessmentMap['note'] = FieldValue.delete();
    }
    return moodAssessmentMap;
  }

  @override
  String toString() {
    final moodAssessmentMap = _toMap();
    moodAssessmentMap['docId'] = docId;
    return moodAssessmentMap.toString();
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

  @override
  bool operator ==(Object other) {
    return other is MoodAssessment
        && docId == other.docId
        && mood == other.mood
        && note == other.note
        && ListEquality().equals(events, other.events)
        && date == other.date
        && partOfDay == other.partOfDay
        && time == other.time;
  }
}