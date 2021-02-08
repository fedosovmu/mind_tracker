import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';


abstract class FirebaseProvider {
  static final _mood_assessments_collection = FirebaseFirestore.instance.collection('mood_assessments');

  static void initializeFirebaseConnection () async {
    final firebaseInitializeData = await Firebase.initializeApp();
  }

  static Future<List<MoodAssessment>> getTodayMoodAssessments () async {
    final todayMoodAssessmentsQuerySnapshot = await FirebaseFirestore.instance.collection('mood_assessments')
        //.where('user_id', isEqualTo: 'DocumentReference(users/test_user)')
        .where('date', isEqualTo: '2021-02-09').get();

    final List<MoodAssessment> todayMoodAssessments = todayMoodAssessmentsQuerySnapshot.docs.map((mood_assessment_doc) {
      return MoodAssessment.fromMap(mood_assessment_doc.data());
    }).toList();

    return todayMoodAssessments;
  }

  static void AddMoodAssessment(MoodAssessment moodAssessment) {
    _mood_assessments_collection.add(
        moodAssessment.toMap()
    ).then((value) => print('=== NEW DOC ADDED'));
    print('===== ${MoodAssessment(mood: 4).toMap()}');
  }
}