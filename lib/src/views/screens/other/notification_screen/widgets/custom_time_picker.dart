import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:mind_tracker/src/views/common_widgets/glow_disabler.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_shape.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class CustomTimePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: dp(200),
      width: double.infinity,
      decoration: ShapeDecoration(
        color: CustomColors.purpleSuperDark,
        shape: CustomBorderShape(dp(16)),
      ),
      child: Center(
        child: CustomDrum(),
      )
    );
  }
}


class CustomDrum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: dp(100),
      //color: Colors.yellow,
      child: GlowDisabler(
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            print(scrollNotification);
            return true;
          },
          child: ListView.builder(
            itemBuilder: (context, index) {
              return CustomDrumItem('${index}');
            },
          ),
        ),
      ),
    );
  }
}


class CustomDrumItem extends StatelessWidget {
  final String text;

  CustomDrumItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dp(60),
      child: Center(
        child: Text(
          text,
          style: CustomTextStyles.titleH1.copyWith(
            fontSize: dp(44),
          ),
        )
      ),
    );
  }
}