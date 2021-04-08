import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind_tracker/src/views/screens/select_events_screen/select_events_screen.dart';
import 'views/utils/theme/app_theme.dart';
import 'views/screens/onboarding_screen.dart';
import 'views/screens/mood_assessment_screen/mood_assessment_screen.dart';
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
      title: 'Mind Tracker',
      theme: appTheme,

      onGenerateRoute: (settings) {
        var screenToGo;
        switch (settings.name) {
          case '/onboarding':
            screenToGo = OnboardingScreen();
            break;
          case '/main':
            screenToGo = MainScreen();
            break;
          case '/moodAssessment/firstStart':
            screenToGo = MoodAssessmentScreen(firstStart: true);
            break;
          case '/moodAssessment/now':
            screenToGo = MoodAssessmentScreen();
            break;
          case '/moodAssessment/partOfDay':
            final Map arguments = settings.arguments;
            screenToGo = MoodAssessmentScreen(arguments: arguments);
            break;
          case '/selectEvents':
            screenToGo = SelectEventsScreen();
            break;
          default:
            screenToGo = MainScreen();
            //screenToGo = SelectEventsScreen();
            //screenToGo = OnboardingScreen();
        }
        
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return screenToGo;
        });
      },
    );
  }
}
