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
  static const List<int> periods = [7, 14, 28, 40];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now().date;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'График',
      ),
      body: Column(
        children: [
          PeriodToggleButtons(
            onSelectedToggleButtonChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          ChartCard(
            startDate: today.subtract(Duration(days: periods[_selectedIndex])),
            endDate: today,
          ),
        ],
      )
    );
  }
}