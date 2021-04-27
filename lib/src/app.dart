import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/auth_provider.dart';
import 'package:mind_tracker/src/views/screens/mood_assessment/create_user_event_title_screen.dart';
import 'package:mind_tracker/src/views/screens/other/login_screen/login_screen.dart';
import 'package:mind_tracker/src/views/screens/mood_assessment/note_screen/note_screen.dart';
import 'package:mind_tracker/src/views/screens/mood_assessment/select_events_screen/select_events_screen.dart';
import 'package:mind_tracker/src/views/screens/other/register_screen/register_screen.dart';
import 'package:mind_tracker/src/views/screens/other/settings_screen/settings_screen.dart';
import 'package:provider/provider.dart';
import 'views/utils/theme/app_theme.dart';
import 'views/screens/other/onboarding_screen.dart';
import 'views/screens/mood_assessment/mood_assessment_screen/mood_assessment_screen.dart';
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
            screenToGo = SelectEventsScreen(settings.arguments);
            break;
          case '/createUserEventTitle':
            screenToGo = CreateUserEventTitleScreen();
            break;
          case '/note':
            screenToGo = NoteScreen(settings.arguments);
            break;
          case '/settings':
            screenToGo = SettingsScreen();
            break;
          case '/login':
            screenToGo = LoginScreen();
            break;
          case '/register' :
            screenToGo = RegisterScreen();
            break;
          default:
            screenToGo = Consumer<AuthProvider>(
              builder: (context, authProvider, child) {
                if (authProvider.isAuthorized) {
                  return MainScreen();
                } else {
                  return LoginScreen();
                }
            });
        }

        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return screenToGo;
          }
        );
      },
    );
  }
}
