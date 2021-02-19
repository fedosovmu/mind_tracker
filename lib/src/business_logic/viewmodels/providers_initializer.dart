import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import '../services/firebase_provider.dart';
import 'mood_sssessments_provider.dart';
import 'dart:async';


abstract class ProvidersInitializer {
  static Future<MoodAssessmentsProvider> getMoodAssessmentsProvider () async {
    await FirebaseProvider.initializeFirebaseConnection();
    final moodAssessments = await FirebaseProvider.getMoodAssessments();

    return MoodAssessmentsProvider(
      moodAssessments: moodAssessments
    );
  }
}