import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/other/glow_disabler.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/custom_time_picker/widgets/custom_drum_controller.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/custom_time_picker/widgets/custom_drum_item.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/custom_time_picker/widgets/custom_scroll_physics.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


class CustomDrum extends StatefulWidget {
  final CustomDrumController controller;

  CustomDrum({@required this.controller});

  @override
  _CustomDrumState createState() => _CustomDrumState();
}

class _CustomDrumState extends State<CustomDrum> {

  final _drumHeight = dp(250);
  double get _drumCenter => widget.controller.scrollController.offset + _drumHeight / 2 - CustomDrumItem.height / 2;
  double _getItemOpacity(int itemIndex) {
    final itemPos = itemIndex * CustomDrumItem.height;
    final itemDistanceToCenter = (_drumCenter - itemPos).abs();
    final normalizedDistance = 1.0 - min(itemDistanceToCenter / _drumHeight * 2, 1);
    return Curves.easeIn.transform(normalizedDistance);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dp(100),
      height: _drumHeight,
      child: GlowDisabler(
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollUpdateNotification) {
              setState(() {});
            }
            return false;
          },
          child: ListView.builder(
            physics: CustomScrollPhysics(
              itemsCount: widget.controller.itemsCount,
              itemSize: CustomDrumItem.height
            ),
            controller: widget.controller.scrollController,
            itemBuilder: (context, index) {
              final double opacity = _getItemOpacity(index);
              final itemNumber = index % widget.controller.itemsCount;
              final itemNumberString = itemNumber.toString().padLeft(2, '0');
              return CustomDrumItem('$itemNumberString', opacity);
            },
          ),
        ),
      ),
    );
  }
}