import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mind_tracker/src/views/common_widgets/other/glow_disabler.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/custom_time_picker/widgets/custom_drum_item.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


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
            print(scrollNotification); //TODO: delete this line
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