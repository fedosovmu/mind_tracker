import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';

import 'database_provider.dart';
import 'firebase_provider.dart';
import '../viewmodels/mood_sssessments_provider.dart';
import 'dart:async';


abstract class InitialAppDataLoader {
  static Future<MoodAssessmentsProvider> loadMoodAssessmentsProvider () async {
    await FirebaseProvider.initializeFirebaseConnection();
    final todayMoodAssessments = List<MoodAssessment>();
    return MoodAssessmentsProvider(
      moodAssessments: todayMoodAssessments
    );
  }
}