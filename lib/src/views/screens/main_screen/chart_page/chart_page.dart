import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/screens/main_screen/chart_page/mood_chart_card/mood_chart_card.dart';
import 'package:mind_tracker/src/views/screens/main_screen/chart_page/period_buttons/period_toggle_buttons.dart';


class ChartPage extends StatefulWidget {

  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> with TickerProviderStateMixin {
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
        title: 'График',
      ),
      body: Column(
        children: [
          PeriodToggleButtons(),
          MoodChartCard(),
        ],
      )
    );
  }
}