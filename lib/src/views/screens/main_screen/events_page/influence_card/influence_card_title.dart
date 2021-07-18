import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/event_influence.dart';
import 'package:mind_tracker/src/views/screens/main_screen/events_page/influence_card/influence_colors.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class InfluenceCardTitle extends StatelessWidget {
  static const _eventInfluenceTitles = {
    EventInfluence.superUp: 'Сильно улучьшается',
    EventInfluence.up: 'Улучьшается',
    EventInfluence.neutral: 'Не меняется',
    EventInfluence.down: 'Ухудшается',
    EventInfluence.superDown: 'Сильно ухудшается'
  };

  final EventInfluence eventInfluence;

  InfluenceCardTitle(this.eventInfluence);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          CustomIconPaths.eventInfluenceIcons[eventInfluence],
          height: dp(26),
          width: dp(24),
        ),
        Text(
          _eventInfluenceTitles[eventInfluence],
          style: CustomTextStyles.basic.copyWith(
              color: influenceColors[eventInfluence]
          ),
        )
      ],
    );
  }
}