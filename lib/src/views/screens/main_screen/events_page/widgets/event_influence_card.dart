import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_shape.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class EventInfluenceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: dp(72),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: dp(16)),
      decoration: ShapeDecoration(
        color: CustomColors.purpleSuperDark,
        shape: CustomBorderShape(dp(16)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: dp(20),
            left: dp(20),
            child: _EventIcon()
          ),
          Positioned(
            top: dp(16),
            left: dp(78),
            child: Text(
              'Хороший код',
              style: CustomTextStyles.basicH1Medium,
            )
          ),
          Positioned(
            bottom: dp(12),
            left: dp(66),
            child: _InfluenceTitle()
          ),
          Positioned(
            top: dp(28),
            right: dp(3),
            child: _LightStrip()
          )
        ],
      )
    );
  }
}


class _EventIcon extends StatelessWidget {
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
          CustomIconPaths.eventIcons['desktop'],
          height: dp(24),
          width: dp(24),
        ),
      ),
    );
  }
}


class _InfluenceTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          CustomIconPaths.superUp,
          height: dp(26),
          width: dp(24),
        ),
        Text(
          'Сильно улучьшилось',
          style: CustomTextStyles.basic.copyWith(
              color: CustomColors.green
          ),
        )
      ],
    );
  }
}


class _LightStrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: dp(16),
      width: dp(3),
      decoration: BoxDecoration(
          color: CustomColors.green,
          borderRadius: BorderRadius.all(Radius.circular(dp(2)))
      ),
    );
  }
}