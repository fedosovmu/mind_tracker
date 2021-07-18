import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/event.dart';
import 'package:mind_tracker/src/business_logic/models/event_influence.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_shape.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


const _eventInfluenceColors = {
  EventInfluence.superUp: CustomColors.green,
  EventInfluence.up: CustomColors.green,
  EventInfluence.neutral: CustomColors.white,
  EventInfluence.down: CustomColors.red,
  EventInfluence.superDown: CustomColors.red
};


class EventInfluenceCard extends StatelessWidget {
  final Event event;

  EventInfluenceCard(this.event);

  @override
  Widget build(BuildContext context) {
    final eventInfluence = EventInfluence.superDown;
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
              child: _EventIcon(event.icon),
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
            child: _InfluenceTitle(eventInfluence)
          ),
          Padding(
            padding: EdgeInsets.only(right: dp(3)),
            child: Align(
              alignment: Alignment.centerRight,
              child: _LightStrip(eventInfluence),
            ),
          ),
        ],
      )
    );
  }
}


class _EventIcon extends StatelessWidget {
  final String icon;

  _EventIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dp(40),
      width: dp(40),
      decoration: BoxDecoration(
        color: CustomColors.purpleDark,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset(
          CustomIconPaths.eventIcons[icon],
          height: dp(24),
          width: dp(24),
        ),
      ),
    );
  }
}


class _InfluenceTitle extends StatelessWidget {
  static const _eventInfluenceTitles = {
    EventInfluence.superUp: 'Сильно улучьшается',
    EventInfluence.up: 'Улучьшается',
    EventInfluence.neutral: 'Не меняется',
    EventInfluence.down: 'Ухудшается',
    EventInfluence.superDown: 'Сильно ухудшается'
  };

  final EventInfluence eventInfluence;

  _InfluenceTitle(this.eventInfluence);

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
              color: _eventInfluenceColors[eventInfluence]
          ),
        )
      ],
    );
  }
}


class _LightStrip extends StatelessWidget {
  final EventInfluence eventInfluence;

  _LightStrip(this.eventInfluence);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dp(16),
      width: dp(3),
      decoration: BoxDecoration(
          color: _eventInfluenceColors[eventInfluence],
          borderRadius: BorderRadius.all(Radius.circular(dp(2)))
      ),
    );
  }
}