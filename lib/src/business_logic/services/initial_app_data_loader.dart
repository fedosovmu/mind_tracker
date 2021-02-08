import 'database_provider.dart';
import 'firebase_provider.dart';
import '../viewmodels/mood_sssessments_provider.dart';
import 'dart:async';


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
    await FirebaseProvider.initializeFirebaseConnection();
  }
}