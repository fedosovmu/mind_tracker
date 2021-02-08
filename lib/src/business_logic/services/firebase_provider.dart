import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessments_for_day.dart';
import 'package:mind_tracker/src/business_logic/models/part_of_day.dart';


abstract class FirebaseProvider {
  static void initializeFirebaseConnection () async {
    final firebaseInitializeData = await Firebase.initializeApp();
  }

  static Future<List<MoodAssessment>> getTodayMoodAssessments () async {
    final collection = await FirebaseFirestore.instance.collection('mood_assessments_for_day').get();
    final mood_assessments_for_day_first_document = collection.docs.first.data();
    print('FIRASTORE (mood_assessments_for_day_first_document): $mood_assessments_for_day_first_document');

    final List<dynamic> mood_assessments_maps = mood_assessments_for_day_first_document['mood_assessments'];
    print('FIRESTORE (mood_assessments_maps): ${mood_assessments_maps}');

    final today_mood_assessments = mood_assessments_maps.map((moodAssessmentMap) {
      return MoodAssessment.fromMap(moodAssessmentMap);
    }).toList();

    //final moodAssessmentsForDay = MoodAssessmentsForDay.formMap(mood_assessments_for_day_first_document);
    print('FIRESTORE (moodAssessmentsForDay object) ${mood_assessments_for_day_first_document['date']}');

    return today_mood_assessments;
  }

  static void updateMoodAssessmentsForDay(MoodAssessmentsForDay moodAssessmentsForDay) async {
    print('FIRESTORE (Update mood assessments for day)');
  }
}