import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/screens/main_screen/chart_page/chart_page.dart';
import 'package:mind_tracker/src/views/screens/main_screen/events_page/events_page.dart';
import 'package:mind_tracker/src/views/screens/main_screen/widgets/custom_bottom_navigation_bar.dart';
import 'home_page/home_page.dart';
import 'calendar_page/calendar_page.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CustomBottomNavigationBar(),
        tabBuilder: _tabBuilder
    );
  }

  Widget _tabBuilder (context, index) {
    switch(index) {
      case 0:
        return HomePage();
        break;
      case 1:
        return ChartPage();
        break;
      case 2:
        return EventsPage();
        break;
      case 3:
        return CalendarPage();
        break;
    }
  }
}