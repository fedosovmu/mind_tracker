import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/other/glow_disabler.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/custom_time_picker/widgets/custom_drum_item.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/custom_time_picker/widgets/custom_scroll_physics.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


class CustomDrum extends StatefulWidget {
  final int itemsCount;

  CustomDrum(this.itemsCount);

  @override
  _CustomDrumState createState() => _CustomDrumState();
}

class _CustomDrumState extends State<CustomDrum> {
  ScrollController _controller;
  int get _firstItemOnScreenIndex => (_controller.offset / CustomDrumItem.height).round();
  static const int _selectedItemIndexShift = 1;
  int get _selectedItemIndex => _firstItemOnScreenIndex + _selectedItemIndexShift;
  int get _topItemsCount => widget.itemsCount;

  @override
  void initState() {
    super.initState();
    final firstItemInitValue = _topItemsCount + 1;
    _controller = ScrollController(
        initialScrollOffset: firstItemInitValue * CustomDrumItem.height,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.yellow,
      width: dp(100),
      child: GlowDisabler(
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            //print(scrollNotification); //TODO: delete this line
            if (scrollNotification is ScrollUpdateNotification) {
              setState(() {});
            }
            return false;
          },
          child: ListView.builder(
            physics: CustomScrollPhysics(
              itemsCount: widget.itemsCount,
              itemSize: CustomDrumItem.height
            ),
            controller: _controller,
            itemBuilder: (context, index) {
              final isSelected = _selectedItemIndex == index;
              //final double opacity = isSelected ? 1 : 0.5;
              final double opacity = 0.5;
              final itemNumber = index % widget.itemsCount;
              final itemNumberString = itemNumber.toString().padLeft(2, '0');
              return CustomDrumItem('$itemNumberString', opacity);
            },
          ),
        ),
      ),
    );
  }
}