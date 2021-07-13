import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mind_tracker/src/app.dart';
import 'package:mind_tracker/src/business_logic/models/event.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'package:mind_tracker/src/business_logic/models/notification_time.dart';
import 'package:mind_tracker/src/business_logic/services/firebase_auth_provider.dart';


class CloudFirestoreProvider {
  CloudFirestoreProvider._();

  static final _moodAssessmentsCollection = FirebaseFirestore.instance.collection('mood_assessments');
  static Future<List<MoodAssessment>> getAllMoodAssessmentsOfAuthorizedUser () async {
    final uid = FirebaseAuthProvider.uid;
    final moodAssessmentsQuerySnapshot = await _moodAssessmentsCollection
        .where('uid', isEqualTo: uid).get();
    print('[FIREBASE] Mood assessments loaded (${moodAssessmentsQuerySnapshot.docs.length})');

    final List<MoodAssessment> moodAssessments = moodAssessmentsQuerySnapshot.docs.map((moodAssessmentDoc) {
      return MoodAssessment.fromMap(moodAssessmentDoc.data(), moodAssessmentDoc.id);
    }).toList();

    return moodAssessments;
  }

  static Future<String> createMoodAssessment(MoodAssessment moodAssessment) async {
    final uid = FirebaseAuthProvider.uid;
    print('[FIREBASE] Create mood assessment $moodAssessment');
    var moodAssessmentMap = moodAssessment.toMapForCreate(uid);
    final documentRef = await _moodAssessmentsCollection.add(moodAssessmentMap);
    return documentRef.id;
  }

  static void updateMoodAssessment(MoodAssessment updatedMoodAssessment, String docId) {
    print('[FIREBASE] Update mood assessment $updatedMoodAssessment');
    _moodAssessmentsCollection.doc(docId).update(updatedMoodAssessment.toMapForUpdate());
  }

  static void deleteMoodAssessment(MoodAssessment moodAssessmentForDelete) {
    print('[FIREBASE] Delete mood assessment $moodAssessmentForDelete');
    _moodAssessmentsCollection.doc(moodAssessmentForDelete.docId).delete();
  }

  static final _userEventsCollection = FirebaseFirestore.instance.collection('user_events');
  static Future<List<Event>> getUserEventsOfAuthorizedUser () async {
    final uid = FirebaseAuthProvider.uid;
    final eventQuerySnapshot = await _userEventsCollection.where('uid', isEqualTo: uid).get();
    print('[FIREBASE] User events loaded (${eventQuerySnapshot.docs.length})');
    final List<Event> events = eventQuerySnapshot.docs.map((eventDoc) {
      return Event.fromMap(eventDoc.data()) ;
    }).toList();
    return events;
  }

  static void addUserEvent (Event userEvent) {
    final uid = FirebaseAuthProvider.uid;
    print('[FIREBASE] Add user event $userEvent');
    var userEventMap = userEvent.toMap();
    userEventMap['uid'] = uid;
    _userEventsCollection.add(
        userEventMap
    );
  }

  static final _settingsCollection = FirebaseFirestore.instance.collection('settings');
  static Map<String, dynamic> _getStartAppInformation() {
    return {
      'app_version':  MindTrackerApp.version,
      'email': FirebaseAuthProvider.email,
      'platform': Platform.isAndroid ? 'Android' : (Platform.isIOS ? 'IOS' : Platform.environment),
      'start_time': DateTime.now(),
    };
  }

  static Future<bool> createSettingsDocIfNotExists() async {
    final uid = FirebaseAuthProvider.uid;
    final settingsDoc = await _settingsCollection.doc(uid).get();
    if (!settingsDoc.exists) {
      _settingsCollection.doc(uid).set(
          {
            'last_start_app_information': _getStartAppInformation()
          }
      );
      return true;
    }
    return false;
  }

  static Future<void> updateSettingsLastStartAppInformation() async {
    final uid = FirebaseAuthProvider.uid;
    final settingsMap = {
      'last_start_app_information': _getStartAppInformation()
    };
    await _settingsCollection.doc(uid).update(settingsMap);
    return;
  }

  static void updateSettingsNotificationTimes(List<NotificationTime> times) {
    final uid = FirebaseAuthProvider.uid;
    print('[FIREBASE] Create default settings document');
    final settingsMap = {
      'notification_times': times.map((e) => e.toString()).toList(),
    };
    _settingsCollection.doc(uid).update(settingsMap);
  }

  static Future<Map<String, dynamic>> getSettings() async {
    final uid = FirebaseAuthProvider.uid;
    final settingsDoc = await _settingsCollection.doc(uid).get();
    final settings = settingsDoc.data();
    print('[FIRABASE] Settings loaded $settings}');
    return settings;
  }
}