import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'firebase_provider.dart';
import '../viewmodels/mood_sssessments_provider.dart';
import 'dart:async';


abstract class InitialAppDataLoader {
  static Future<MoodAssessmentsProvider> getMoodAssessmentsProvider () async {
    await FirebaseProvider.initializeFirebaseConnection();
    final todayMoodAssessments = await FirebaseProvider.getTodayMoodAssessments();

    return MoodAssessmentsProvider(
      todayMoodAssessments: todayMoodAssessments
    );
  }
}