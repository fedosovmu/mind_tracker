import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/services/firebase_auth_provider.dart';
import 'package:mind_tracker/src/business_logic/services/cloud_firestore_provider.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/events_provider.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_assessments_provider.dart';
import 'package:provider/provider.dart';
import 'src/app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  FirebaseAuthProvider.initializeListeners();
  final moodAssessmentsProvider = MoodAssessmentsProvider();
  final events = await CloudFirestoreProvider.getEvents();
  final eventsProvider = EventsProvider(events);

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




