import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/notification_time.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/custom_time_picker/custom_time_picker_controller.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/widgets/add_notification_button.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/widgets/notification_time_box.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


class NotificationTimeBoxes extends StatefulWidget {
  List<NotificationTime> notificationTimes;
  CustomTimePickerController timePickerController;

  NotificationTimeBoxes({@required this.timePickerController, @required this.notificationTimes});

  @override
  _NotificationTimeBoxesState createState() => _NotificationTimeBoxesState();
}

class _NotificationTimeBoxesState extends State<NotificationTimeBoxes> {
  int _selectedTimeBoxIndex;

  @override
  void initState() {
    widget.timePickerController.addListener(() {
      if (_selectedTimeBoxIndex != null) {
        setState(() {
          widget.notificationTimes[_selectedTimeBoxIndex] = widget.timePickerController.time;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [];
    for (var index = 0; index < widget.notificationTimes.length; index++) {
      final timeBox = NotificationTimeBox(
        widget.notificationTimes[index],
        selected: index == _selectedTimeBoxIndex,
        onPressed: () {
          setState(() {
            if (_selectedTimeBoxIndex != index) {
              _selectedTimeBoxIndex = index;
              widget.timePickerController.setTime(widget.notificationTimes[index]);
            } else {
              _selectedTimeBoxIndex = null;
            }
          });
        },
        onDeleteButtonPressed: () {
          setState(() {
            if (_selectedTimeBoxIndex != null) {
              if (_selectedTimeBoxIndex == index) {
                _selectedTimeBoxIndex = null;
              } else if (_selectedTimeBoxIndex > index) {
                _selectedTimeBoxIndex -= 1;
              }
            }
            widget.notificationTimes.removeAt(index);
          });
        },
      );
      widgets.add(timeBox);
      if (widget.notificationTimes.length < 4) {
        widgets.add(SizedBox(width: dp(8)));
      } else {
        if (index < 4) {
          widgets.add(SizedBox(width: dp(4)));
        }
      }
    }

    if (widget.notificationTimes.length < 4) {
      final addButton = AddNotificationButton(
        onPressed: () {
          setState(() {
            final newNotificationTime = widget.timePickerController.time;
            widget.notificationTimes.add(newNotificationTime);
            _selectedTimeBoxIndex = widget.notificationTimes.length - 1;
          });
        },
      );
      widgets.add(addButton);
    }

    return SizedBox(
      height: NotificationTimeBox.height,
      child: Row(
        children: widgets,
      ),
    );
  }
}