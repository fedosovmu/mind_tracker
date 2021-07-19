import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/event_influence_provider.dart';
import 'package:mind_tracker/src/views/common_widgets/other/glow_disabler.dart';
import 'package:mind_tracker/src/views/screens/main_screen/events_page/influence_cards/influence_card.dart';
import 'package:provider/provider.dart';


class InfluenceCards extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;

  InfluenceCards({@required this.startDate, @required this.endDate});

  @override
  Widget build(BuildContext context) {
    return GlowDisabler(
      child: Consumer<EventInfluenceProvider>(
        builder: (context, eventInfluenceProvider, child) {
          final eventInfluenceForPeriod = eventInfluenceProvider.getEventInfluenceForPeriod(
              startDate: startDate,
              endDate: endDate
          );
          return ListView(
            children: eventInfluenceForPeriod.entries.map((item) {
              final event = item.key;
              final eventInfluence = item.value;
              return InfluenceCard(event, eventInfluence);
            }).toList()
          );
        },
      ),
    );
  }
}