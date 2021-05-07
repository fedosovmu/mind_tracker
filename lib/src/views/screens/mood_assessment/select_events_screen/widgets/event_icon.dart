import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/event.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';


class EventIcon extends StatefulWidget {
  static const _widthInDp = 64;
  static const _heightInDp = 115;
  static const aspectRatio = _widthInDp / _heightInDp;

  final Event event;
  bool isSelected;
  final Function onChanged;
  EventIcon(this.event, {this.isSelected = false, this.onChanged});

  _EventIconState _state;

  @override
  _EventIconState createState() {
    _state = _EventIconState();
    return _state;
  }
}

class _EventIconState extends State<EventIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isSelected = !widget.isSelected;
          if (widget.onChanged != null) {
            widget.onChanged();
          }
        });
        print('Event selected');
      },
      child: Column(
        children: [
          Container(
              width: dp(64),
              height: dp(64),
              decoration: BoxDecoration(
                  color: widget.isSelected ? CustomColors.main : CustomColors.purpleSuperDark,
                  shape: BoxShape.circle
              ),
              child: Center(
                child: Image.asset(
                  CustomIconPaths.eventIcons[widget.event.icon],
                  width: dp(24),
                  height: dp(24),
                ),
              )
          ),
          SizedBox(height: dp(8)),
          Expanded(
            child: Text(
              widget.event.title,
              style: CustomTextStyles.caption.copyWith(
                  color: widget.isSelected ? CustomColors.purpleWhite : CustomColors.purpleLight
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}