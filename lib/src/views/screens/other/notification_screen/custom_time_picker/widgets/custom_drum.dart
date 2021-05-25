import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mind_tracker/src/views/common_widgets/other/glow_disabler.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/custom_time_picker/widgets/custom_drum_item.dart';


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
    //Future.delayed(Duration(seconds: 3)).then(
    //  (_) {
        //_controller.animateTo(100.0, duration: Duration(seconds: 3), curve: Curves.ease);
    //  }
    //);
  }

  void _animateToNearestItem() {
    _controller.animateTo(
        CustomDrumItem.height * _firstItemOnScreenIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease
    );
  }

  void _jumpToCenterItemWithSameIndex() {
    final centerItemWithSameIndex = _firstItemOnScreenIndex % widget.itemsCount + _topItemsCount;
    if (_firstItemOnScreenIndex != centerItemWithSameIndex) {
      final offsetShift = _controller.offset - _firstItemOnScreenIndex * CustomDrumItem.height;
      _controller.jumpTo(
          CustomDrumItem.height * centerItemWithSameIndex + offsetShift
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GlowDisabler(
        child: GestureDetector(
          onVerticalDragStart: (dragStartDetails) {
            //print('on vertical drag start $dragStartDetails');
          },
          onVerticalDragDown: (dragDownDetails) {
            //print('on drag down $dragDownDetails');
          },
          onVerticalDragEnd: (dragEndDetails) {
            //print('on drag end $dragEndDetails');
          },
          onVerticalDragCancel: () {
            //print('drag cancel');
          },
          onVerticalDragUpdate: (dragUpdateDetails) {
            //print('on drag update $dragUpdateDetails');
          },
          child: NotificationListener<UserScrollNotification>(
            onNotification: (userScrollNotification) {
              //print(userScrollNotification);
              if (userScrollNotification.direction == ScrollDirection.idle) {
                //_animateToNearestItem();
                //_jumpToCenterItemWithSameIndex();
              }
              return false;
            },
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                //print(scrollNotification); //TODO: delete this line
                if (scrollNotification is ScrollUpdateNotification) {
                  setState(() {});
                }
                return false;
              },
              child: ListView.builder(
                //physics: ClampingScrollPhysics(),
                //physics: AlwaysScrollableScrollPhysics(),
                //physics: NeverScrollableScrollPhysics(),
                physics: CustomScrollPhysics(),
                controller: _controller,
                itemBuilder: (context, index) {
                  final isSelected = _selectedItemIndex == index;
                  final double opacity = isSelected ? 1 : 0.5;
                  final itemNumber = index % widget.itemsCount;
                  final itemNumberString = itemNumber.toString().padLeft(2, '0');
                  return CustomDrumItem('$itemNumberString ($index)', opacity);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class CustomScrollPhysics extends ScrollPhysics {
  @override
  ScrollPhysics applyTo(ScrollPhysics ancestor) {
    return CustomScrollPhysics();
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    print('create ballistic simulation');
    return CustomSimulation(
      initPosition: position.pixels,
      initVelocity: velocity,
      itemsCount: 60,
      itemHeight: CustomDrumItem.height
    );
  }
}


class CustomSimulation extends Simulation {
  final double initPosition;
  final double initVelocity;
  final int itemsCount;
  final double itemHeight;

  CustomSimulation({@required this.initPosition, @required this.initVelocity,
    @required this.itemsCount, @required this.itemHeight});

  @override
  double x(double time) {
    final x = initPosition + initVelocity * time;
    print('x: $x, time: $time');
    return x;
  }

  @override
  double dx(double time) {
    print('velocity: $initVelocity');
    return initVelocity;
  }

  @override
  bool isDone(double time) {
    return time > 5;
  }
}