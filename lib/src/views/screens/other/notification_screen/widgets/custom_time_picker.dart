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


class CustomDrum extends StatefulWidget {
  @override
  _CustomDrumState createState() => _CustomDrumState();
}

class _CustomDrumState extends State<CustomDrum> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController(
      initialScrollOffset: CustomDrumItem.height
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dp(100),
      //color: Colors.yellow,
      child: GlowDisabler(
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            print(scrollNotification);
            if (scrollNotification is ScrollEndNotification) {
              final offset = _controller.offset;
              final nearestItemIndex = 1; //(offset / CustomDrumItem.height).round() + 1;
              print('Nearest index: $nearestItemIndex');
              _controller.animateTo(
                  nearestItemIndex * CustomDrumItem.height,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut
              );
            }
            return false;
          },
          child: ListView.builder(
            controller: _controller,
            itemBuilder: (context, index) {
              return CustomDrumItem('${index}', 1 - (0.1 * (index % 10)));
            },
          ),
        ),
      ),
    );
  }
}


class CustomDrumItem extends StatelessWidget {
  static final height = dp(60);
  final String text;
  final double opacity;

  CustomDrumItem(this.text, this.opacity);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Center(
        child: Text(
          text,
          style: CustomTextStyles.titleH1.copyWith(
            color: Color.lerp(
                CustomColors.white,
                CustomColors.purpleLight,
                1 - opacity
            ).withOpacity(opacity),
            fontSize: dp(44 - 20 * (1 - opacity)),
          ),
        )
      ),
    );
  }
}