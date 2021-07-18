import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/events_provider.dart';
import 'package:mind_tracker/src/views/common_widgets/app_bar/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/other/glow_disabler.dart';
import 'package:mind_tracker/src/views/common_widgets/period_buttons/period_toggle_buttons.dart';
import 'package:mind_tracker/src/views/screens/main_screen/events_page/influence_card/influence_card.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:provider/provider.dart';


class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

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
            SizedBox(height: dp(16)),
            PeriodToggleButtons(
              onSelectedToggleButtonChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
            SizedBox(height: dp(16)),
            Expanded(
              child: GlowDisabler(
                child: Consumer<EventsProvider>(
                  builder: (context, eventsProvider, child) {
                    final events = eventsProvider.events;
                    return ListView(
                      children: events.map((event) {
                        return InfluenceCard(event);
                      }).toList(),
                    );
                  },
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}