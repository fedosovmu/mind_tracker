import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';


abstract class FirebaseProvider {
  static final _mood_assessments_collection = FirebaseFirestore.instance.collection('mood_assessments');
  static UserCredential _userCredential;

  static void initializeFirebaseConnection () async {
    final firebaseInitializeData = await Firebase.initializeApp();
    _userCredential = await FirebaseAuth.instance.signInAnonymously();
    print('=== USER: ${_userCredential.user.uid}');
  }

  static Future<List<MoodAssessment>> getAllMoodAssessmentsOfUser () async {
    final moodAssessmentsQuerySnapshot = await _mood_assessments_collection
        .where('user_id', isEqualTo: _userCredential.user.uid).get();

    final List<MoodAssessment> moodAssessments = moodAssessmentsQuerySnapshot.docs.map((mood_assessment_doc) {
      return MoodAssessment.fromMap(mood_assessment_doc.data());
    }).toList();

    return moodAssessments;
  }

  static void addMoodAssessment(MoodAssessment moodAssessment) {
    var moodAssessmentMap = moodAssessment.toMap();
    moodAssessmentMap['user_id'] = _userCredential.user.uid;
    _mood_assessments_collection.add(
        moodAssessmentMap
    ).then((value) => print('=== FIREBASE ADD ($moodAssessment)'));
  }
}