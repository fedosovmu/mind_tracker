import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';


abstract class FirebaseProvider {
  static void initializeFirebaseConnection () async {
    final firebaseInitializeData = await Firebase.initializeApp();
  }

  static Future<List<MoodAssessment>> getTodayMoodAssessments () async {
    final collection = await FirebaseFirestore.instance.collection('mood_assessments_for_day').get();
    final today_mood_assessments_map = collection.docs.first.data();
    print('FIRASTORE: $today_mood_assessments_map');
    final mood_assessments = today_mood_assessments_map['mood_assessments'];
    print('FIRESTORE, MOOD ASSESSMENTS: $mood_assessments');
    final mood_assessment_map = mood_assessments[2];
    final mood_assessment = MoodAssessment.fromMap(mood_assessment_map);
    print('MOOD ASSESSMENT: $mood_assessment');
  }
}