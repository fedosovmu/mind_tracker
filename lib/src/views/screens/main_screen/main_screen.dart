import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/screens/main_screen/home_page/home_page.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/custom_text_styles.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_bottom_navigation_bar.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';


class MainScreen extends StatefulWidget {
  MoodAssessment _newMoodAssess;

  MainScreen({MoodAssessment newMoodAssess}) {
    _newMoodAssess = newMoodAssess;
  }

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with Content {
  @override
  Widget build(BuildContext context) {
    loadContent('homePage');
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          border: Border(top: BorderSide(color: Color(0xFF766379))),
          backgroundColor: CustomColors.purpleSuperDark,
          activeColor: CustomColors.silverWhite,
          inactiveColor: CustomColors.silverWhite,
          iconSize: dp(24),
          items: [
            BottomNavigationBarItem(
              activeIcon: Image.asset('assets/icons/home.png', height: dp(24)),
              icon: Image.asset('assets/icons/home.png', height: dp(24), color: CustomColors.purpleTextSecondary),
              title: Text('Главный', style: CustomTextStyles.basic)
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset('assets/icons/analytics.png', height: dp(24)),
              icon: Image.asset('assets/icons/analytics.png', height: dp(24), color: CustomColors.purpleTextSecondary),
              title: Text('Аналитика', style: CustomTextStyles.basic)
            ),
            BottomNavigationBarItem(
                activeIcon: Image.asset('assets/icons/settings.png', height: dp(24)),
                icon: Image.asset('assets/icons/settings.png', height: dp(24), color: CustomColors.purpleTextSecondary),
              title: Text('Календарь', style: CustomTextStyles.basic)
            )
          ],
        ),
        tabBuilder: (context, i) {
          return _buildHomePage();
        }
    );
  }

  Widget _buildHomePage() {
    return CupertinoPageScaffold(
        navigationBar: CustomAppBar(
            title: content['title']
        ),
        child: HomePage(moodAssess: widget._newMoodAssess)
    );
  }
}