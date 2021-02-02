import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'views/utils/app_theme.dart';
import 'views/screens/onboarding_screen.dart';
import 'views/screens/mood_assessment_screen.dart';
import 'views/screens/main_screen/main_screen.dart';
import 'business_logic/models/initial_app_data.dart';
import 'package:provider/provider.dart';


class MindTrackerApp extends StatelessWidget {
  final InitialAppData initialAppData;

  MindTrackerApp(InitialAppData this.initialAppData);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    SystemChrome.setSystemUIOverlayStyle(
        appSystemUiOverlayStyle
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme,
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => OnboardingScreen(),
        '/moodAssessment': (context) => MoodAssessmentScreen(),
        '/moodAssessment/firstStart': (context) => MoodAssessmentScreen(firstStart: true),
        '/main': (context) => MainScreen(todayMoodAssessments: []),
      },
    );
  }
}
