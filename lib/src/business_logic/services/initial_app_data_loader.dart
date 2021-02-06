import 'database_provider.dart';
import '../viewmodels/mood_sssessments_provider.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


abstract class InitialAppDataLoader {
  static Future<MoodAssessmentsProvider> loadMoodAssessmentsProvider () async {
    final moodAssessments = await DatabaseProvider.db.getMoodAssessments();
    final todayMoodAssessments = MoodAssessmentsProvider(
        moodAssessments: moodAssessments
    );
    print('INITIAL DATA LOADED'); // TODO: Delete this line
    return todayMoodAssessments;
  }

  static void initializeFirebaseConnection () async {
    final firebaseInitializeData = await Firebase.initializeApp();
    print('FIREBASE INITIALIZED'); // TODO: Delete this line
    CollectionReference mood_assessments_collection = FirebaseFirestore.instance.collection('mood_assessments');
    mood_assessments_collection.get().then((data) {
      final mood_assessments = data.docs.map((e) => e.data());
      print('DOCUMENTS: $mood_assessments');
    });
    //print(mood_assessments_collection.get());

  }
}