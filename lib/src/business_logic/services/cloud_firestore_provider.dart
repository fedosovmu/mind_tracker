import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mind_tracker/src/business_logic/models/event.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'package:mind_tracker/src/business_logic/services/firebase_auth_provider.dart';


class CloudFirestoreProvider {
  CloudFirestoreProvider._();

  static final _userEventsCollection = FirebaseFirestore.instance.collection('user_events');
  static final _moodAssessmentsCollection = FirebaseFirestore.instance.collection('mood_assessments');

  static Future<List<MoodAssessment>> getAllMoodAssessmentsOfAuthorizedUser () async {
    final uid = FirebaseAuthProvider.uid;
    if (uid != null) {
      final moodAssessmentsQuerySnapshot = await _moodAssessmentsCollection
          .where('uid', isEqualTo: uid).get();
      print('[FIREBASE] Mood assessments loaded (${moodAssessmentsQuerySnapshot.docs.length})');

      final List<MoodAssessment> moodAssessments = moodAssessmentsQuerySnapshot.docs.map((moodAssessmentDoc) {
        return MoodAssessment.fromMap(moodAssessmentDoc.data(), moodAssessmentDoc.id);
      }).toList();

      return moodAssessments;
    } else {
      return [];
    }
  }

  static Future<String> addMoodAssessment(MoodAssessment moodAssessment) async {
    final uid = FirebaseAuthProvider.uid;
    if (uid != null) {
      print('[FIREBASE] Add mood assessment $moodAssessment');
      var moodAssessmentMap = moodAssessment.toMap();
      moodAssessmentMap['uid'] = uid;
      final documentRef = await _moodAssessmentsCollection.add(moodAssessmentMap);
      return documentRef.id;
    } else {
      return null;
    }
  }

  static void updateMoodAssessment(MoodAssessment updatedMoodAssessment, String docId) {
    final uid = FirebaseAuthProvider.uid;
    if (uid != null) {
      print('[FIREBASE] Update mood assessment $updatedMoodAssessment');
      _moodAssessmentsCollection.doc(docId).update(updatedMoodAssessment.toMapForUpdate());
    }
  }

  static Future<List<Event>> getUserEventsOfAuthorizedUser () async {
    final uid = FirebaseAuthProvider.uid;
    if (uid != null) {
      final eventQuerySnapshot = await _userEventsCollection.where('uid', isEqualTo: uid).get();
      print('[FIREBASE] User events loaded (${eventQuerySnapshot.docs.length})');
      final List<Event> events = eventQuerySnapshot.docs.map((eventDoc) {
        return Event.fromMap(eventDoc.data()) ;
      }).toList();
      return events;
    } else {
      return [];
    }
  }

  static void addUserEvent (Event userEvent) {
    final uid = FirebaseAuthProvider.uid;
    if (uid != null) {
      print('[FIREBASE] Add user event $userEvent');
      var userEventMap = userEvent.toMap();
      userEventMap['uid'] = uid;
      _userEventsCollection.add(
          userEventMap
      );
    }
  }
}