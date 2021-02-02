import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'views/utils/app_theme.dart';
import 'views/screens/onboarding_screen.dart';
import 'views/screens/mood_assessment_screen.dart';
import 'views/screens/main_screen/main_screen.dart';
import 'business_logic/models/today_mood_sssessments.dart';


class MindTrackerApp extends StatelessWidget {
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
      initialRoute: '/main',
      routes: {
        '/onboarding': (context) => OnboardingScreen(),
        '/moodAssessment': (context) => MoodAssessmentScreen(),
        '/moodAssessment/firstStart': (context) => MoodAssessmentScreen(firstStart: true),
        '/main': (context) => MainScreen(todayMoodAssessments: []),
      },
    );
  }
}
