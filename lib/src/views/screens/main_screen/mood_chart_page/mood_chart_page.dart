import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/screens/main_screen/mood_chart_page/mood_chart_card/mood_chart_card.dart';
import 'package:mind_tracker/src/views/screens/main_screen/mood_chart_page/period_buttons/period_toggle_buttons.dart';


class MoodChartPage extends StatefulWidget {

  @override
  _MoodChartPageState createState() => _MoodChartPageState();
}

class _MoodChartPageState extends State<MoodChartPage> with TickerProviderStateMixin {
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
        title: 'График настроения',
      ),
      body: Column(
        children: [
          PeriodToggleButtons(),
          Expanded(
              child: MoodChartCard()
          ),
        ],
      )
    );
  }
}