import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  int _selectedItemIndex = 2;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController(
      initialScrollOffset: CustomDrumItem.height
    );
    Future.delayed(Duration(seconds: 5)).then((value) => _animateToNearestItem());
  }

  void _animateToNearestItem() {
    Future.delayed(
        Duration(milliseconds: 10)
    ).then((_) {
        final nearestItemIndex = (_controller.offset / CustomDrumItem.height).round();
        _controller.animateTo(
            CustomDrumItem.height * nearestItemIndex,
            duration: Duration(milliseconds: 500),
            curve: Curves.ease
        );
      }
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
            if (scrollNotification is UserScrollNotification) {
              if (scrollNotification.direction == ScrollDirection.idle) {
                _animateToNearestItem();
              }
            }
            if (scrollNotification is ScrollUpdateNotification) {
              setState(() {
                _selectedItemIndex = (_controller.offset / CustomDrumItem.height).round() + 1;
              });
            }
            return false;
          },
          child: ListView.builder(
            controller: _controller,
            itemBuilder: (context, index) {
              final double opacity = _selectedItemIndex == index ? 1 : 0.5;
              return CustomDrumItem('${index}', opacity);
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