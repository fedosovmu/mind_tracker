import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';


abstract class FirebaseProvider {
  static void initializeFirebaseConnection () async {
    final firebaseInitializeData = await Firebase.initializeApp();
    print('FIREBASE INITIALIZED'); // TODO: Delete this line
  }

   Future<List<MoodAssessment>> getTodayMoodAssessments () async {

  }
}