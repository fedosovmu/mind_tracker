import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mind_tracker/src/business_logic/models/event.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'package:mind_tracker/src/business_logic/services/firebase_auth_provider.dart';


class CloudFirestoreProvider {
  CloudFirestoreProvider._();

  static final _eventsCollection = FirebaseFirestore.instance.collection('events');
  static final _moodAssessmentsCollection = FirebaseFirestore.instance.collection('mood_assessments');

  static Future<List<MoodAssessment>> getAllMoodAssessmentsOfAuthorizedUser () async {
    final uid = FirebaseAuthProvider.uid;
    if (uid != null) {
      final moodAssessmentsQuerySnapshot = await _moodAssessmentsCollection
          .where('user_id', isEqualTo: uid).get();

      final List<MoodAssessment> moodAssessments = moodAssessmentsQuerySnapshot.docs.map((mood_assessment_doc) {
        return MoodAssessment.fromMap(mood_assessment_doc.data());
      }).toList();

      return moodAssessments;
    } else {
      return [];
    }
  }

  static void addMoodAssessment(MoodAssessment moodAssessment) {
    final uid = FirebaseAuthProvider.uid;
    if (uid != null) {
      var moodAssessmentMap = moodAssessment.toMap();
      print('$moodAssessmentMap');
      moodAssessmentMap['user_id'] = uid;
      _moodAssessmentsCollection.add(
          moodAssessmentMap
      ).then((value) => print('=== FIREBASE ADD ($moodAssessment)'));
    }
  }

  static Future<List<Event>> getUserEventsOfAuthorizedUser () async {
    final uid = FirebaseAuthProvider.uid;
    if (uid != null) {
      final eventQuerySnapshot = await _eventsCollection.where('user_id', isEqualTo: uid).get();
      print('=== USER EVENTS LOADED (${eventQuerySnapshot.docs.length})');
      final List<Event> events = eventQuerySnapshot.docs.map((eventDoc) {
        return Event.fromMap(eventDoc.data()) ;
      }).toList();
      return events;
    } else {
      return [];
    }
  }
}