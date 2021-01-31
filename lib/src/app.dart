import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'views/utils/app_theme.dart';
import 'views/screens/onboarding_screen.dart';
import 'views/screens/mood_assessment_screen.dart';
import 'views/screens/main_screen/main_screen.dart';


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
      home: OnboardingScreen(),
      //home: MoodAssessmentScreen(firstStart: true),
      //home: MainScreen(moodAssess: 5),
    );
  }
}
