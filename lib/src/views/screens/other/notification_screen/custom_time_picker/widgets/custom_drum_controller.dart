import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/custom_time_picker/widgets/custom_drum_item.dart';


class CustomDrumController {
  final int itemsCount;
  final int initValue;
  final Function onSelectedValueChanged;

  ScrollController scrollController;
  int get _topLoopsCount => 1;
  int get _topItemsCount => _topLoopsCount * itemsCount;
  int get _firstItemOnScreenIndex => (scrollController.offset / CustomDrumItem.height).round();
  static const int _selectedItemIndexShift = 2;
  int get _selectedItemIndex => _firstItemOnScreenIndex + _selectedItemIndexShift;
  int _lastSelectedItemIndex;

  CustomDrumController({@required this.itemsCount, @required this.initValue, @required this.onSelectedValueChanged}) {
    _lastSelectedItemIndex = _topItemsCount + initValue;
    final firstItemInitValue = _topItemsCount + initValue - _selectedItemIndexShift;
    scrollController = ScrollController(
      initialScrollOffset: firstItemInitValue * CustomDrumItem.height,
    );
    scrollController.addListener(() {
      if (_lastSelectedItemIndex != _selectedItemIndex) {
        _lastSelectedItemIndex = _selectedItemIndex;
        final selectedValue = _selectedItemIndex % itemsCount;
        onSelectedValueChanged(selectedValue);
      }
    });
  }

  void jumpTo(int value) {
    final targetPos = (_topItemsCount + value - _selectedItemIndexShift) * CustomDrumItem.height;
    scrollController.jumpTo(targetPos);
  }
}