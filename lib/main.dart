import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/services/local_notifications_provider.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/auth_provider.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/events_provider.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_assessments_provider.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/settings_provider.dart';
import 'package:provider/provider.dart';
import 'src/app.dart';


void main() async {
  print('start widgets initialization');
  WidgetsFlutterBinding.ensureInitialized();

  print('start initialize firebase');
  await Firebase.initializeApp();

  print('start creating providers');
  final moodAssessmentsProvider = MoodAssessmentsProvider();
  final eventsProvider = EventsProvider();
  final settingsProvider = SettingsProvider();
  final authProvider = AuthProvider();

  print('start initialize locale notification provider');
  LocalNotificationsProvider.initialize();

  print('start app');
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return moodAssessmentsProvider;
          }),
          ChangeNotifierProvider(create: (_) {
            return eventsProvider;
          }),
          ChangeNotifierProvider(create: (_) {
            return authProvider;
          }),
          ChangeNotifierProvider(create: (_) {
            return settingsProvider;
          })
        ],
        child: MindTrackerApp(),
      )
  );
}




