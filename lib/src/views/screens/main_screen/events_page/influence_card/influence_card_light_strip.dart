import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/event_influence.dart';
import 'package:mind_tracker/src/views/screens/main_screen/events_page/influence_card/influence_colors.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


class InfluenceCardLightStrip extends StatelessWidget {
  final EventInfluence eventInfluence;

  InfluenceCardLightStrip(this.eventInfluence);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dp(16),
      width: dp(3),
      decoration: BoxDecoration(
          color: influenceColors[eventInfluence],
          borderRadius: BorderRadius.all(Radius.circular(dp(2)))
      ),
    );
  }
}