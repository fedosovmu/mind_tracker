import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/services/firebase_provider.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/events_provider.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_sssessments_provider.dart';
import 'package:provider/provider.dart';
import 'src/app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FirebaseProvider.initializeFirebaseConnection();
  final moodAssessmentsProvider = await MoodAssessmentsProvider.loadDataAndCreateProvider();
  final eventsProvider = await EventsProvider.loadDataAndCreateProvider();

  print('=== EVENTS === ${eventsProvider.events}');

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return moodAssessmentsProvider;
          }),
          ChangeNotifierProvider(create: (_) {
            return eventsProvider;
          })
        ],
        child: MindTrackerApp(),
      )
  );
}




