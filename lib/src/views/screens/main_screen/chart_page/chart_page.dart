import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/screens/main_screen/chart_page/chart_card/chart_card.dart';
import 'package:mind_tracker/src/views/screens/main_screen/chart_page/period_buttons/period_toggle_buttons.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';


class ChartPage extends StatefulWidget {

  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now().date;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'График',
      ),
      body: Column(
        children: [
          PeriodToggleButtons(),
          ChartCard(
            startDate: today.subtract(Duration(days: 7)),
            endDate: today,
          ),
        ],
      )
    );
  }
}