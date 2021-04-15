import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mind_tracker/src/business_logic/models/event.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'package:mind_tracker/src/business_logic/services/firebase_auth_provider.dart';


abstract class FirestoreProvider {
  static final _eventsCollection = FirebaseFirestore.instance.collection('events');
  static final _moodAssessmentsCollection = FirebaseFirestore.instance.collection('mood_assessments');
  static UserCredential _userCredential;

  static Future<void> initializeFirebaseConnection () async {
    final firebaseInitializeData = await Firebase.initializeApp();
    _userCredential = await FirebaseAuthProvider.signInAnonymously();
  }

  static Future<List<MoodAssessment>> getAllMoodAssessmentsOfAuthorizedUser () async {
    final moodAssessmentsQuerySnapshot = await _moodAssessmentsCollection
        .where('user_id', isEqualTo: _userCredential.user.uid).get();

    final List<MoodAssessment> moodAssessments = moodAssessmentsQuerySnapshot.docs.map((mood_assessment_doc) {
      return MoodAssessment.fromMap(mood_assessment_doc.data());
    }).toList();

    return moodAssessments;
  }

  static void addMoodAssessment(MoodAssessment moodAssessment) {
    var moodAssessmentMap = moodAssessment.toMap();
    moodAssessmentMap['user_id'] = _userCredential.user.uid;
    _moodAssessmentsCollection.add(
        moodAssessmentMap
    ).then((value) => print('=== FIREBASE ADD ($moodAssessment)'));
  }


  static Future<List<Event>> getEvents () async {
    final eventQuerySnapshot = await _eventsCollection.get();
    print('=== EVENTS LOADED');
    print('=== ${eventQuerySnapshot.docs.first.data()}');
    final List<Event> events = eventQuerySnapshot.docs.map((eventDoc) {
      return Event.fromMap(eventDoc.data()) ;
    }).toList();
    return events;
  }
}