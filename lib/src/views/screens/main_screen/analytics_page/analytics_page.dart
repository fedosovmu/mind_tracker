import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/screens/main_screen/analytics_page/influence_page/influence_page.dart';
import 'package:mind_tracker/src/views/screens/main_screen/analytics_page/widgets/custom_tab_bar.dart';
import 'package:mind_tracker/src/views/screens/main_screen/analytics_page/mood_chart_page/mood_chart_page.dart';


class AnalyticsPage extends StatefulWidget {

  @override
  _AnalyticsPageState createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> with TickerProviderStateMixin {
  var _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Аналитика',
      ),
      body: Column(
        children: [
          CustomTabBar(_tabController),
          Expanded(
            child: TabBarView(
              controller: _tabController,
                children: [
                  MoodChartPage(),
                  InfluencePage(),
                ]
            ),
          )
        ],
      ),
    );
  }
}