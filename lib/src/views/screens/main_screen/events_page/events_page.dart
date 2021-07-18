import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/app_bar/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/period_buttons/period_toggle_buttons.dart';
import 'package:mind_tracker/src/views/screens/main_screen/events_page/influence_cards/influence_cards.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';


class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> with SingleTickerProviderStateMixin {
  static const List<int> periods = [7, 15, 29, 57];
  int _selectedIndex = 0;

  Widget _buildInfluenceCards (BuildContext context) {
    final today = DateTime.now().date;
    final startDate = today.subtract(Duration(days: periods[_selectedIndex] - 1));
    final endDate = today;
    return InfluenceCards(startDate: startDate, endDate: endDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'События',
      ),
      body: Container(
        color: CustomColors.purpleDark,
        child: Column(
          children: [
            PeriodToggleButtons(
              onSelectedToggleButtonChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
            SizedBox(height: dp(16)),
            Expanded(
              child: _buildInfluenceCards(context)
            )
          ],
        ),
      ),
    );
  }
}