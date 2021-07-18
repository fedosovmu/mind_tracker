import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/event.dart';
import 'package:mind_tracker/src/business_logic/models/event_influence.dart';
import 'package:mind_tracker/src/views/screens/main_screen/events_page/influence_cards/influence_card_light_strip.dart';
import 'package:mind_tracker/src/views/screens/main_screen/events_page/influence_cards/influence_card_event_icon.dart';
import 'package:mind_tracker/src/views/screens/main_screen/events_page/influence_cards/influence_card_title.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_shape.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class InfluenceCard extends StatelessWidget {
  final Event event;

  InfluenceCard(this.event);

  @override
  Widget build(BuildContext context) {
    final eventInfluence = EventInfluence.superUp;
    return Container(
      height: dp(72),
      width: double.infinity,
      margin: EdgeInsets.only(left: dp(16), right: dp(16), bottom: dp(8)),
      decoration: ShapeDecoration(
        color: CustomColors.purpleSuperDark,
        shape: CustomBorderShape(dp(16)),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: dp(20)),
            child: Align(
              alignment: Alignment.centerLeft,
              child: InfluenceCardEventIcon(event.icon),
            ),
          ),
          Positioned(
            top: dp(16),
            left: dp(78),
            child: Text(
              event.title,
              style: CustomTextStyles.basicH1Medium,
            )
          ),
          Positioned(
            bottom: dp(12),
            left: dp(66),
            child: InfluenceCardTitle(eventInfluence)
          ),
          Padding(
            padding: EdgeInsets.only(right: dp(3)),
            child: Align(
              alignment: Alignment.centerRight,
              child: InfluenceCardLightStrip(eventInfluence),
            ),
          ),
        ],
      )
    );
  }
}