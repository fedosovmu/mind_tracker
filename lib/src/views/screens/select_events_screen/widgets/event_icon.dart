import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';


class EventIcon extends StatefulWidget {
  static const _widthInDp = 64;
  static const _heightInDp = 115;
  static const aspectRatio = _widthInDp / _heightInDp;

  @override
  _EventIconState createState() => _EventIconState();
}

class _EventIconState extends State<EventIcon> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        print('Event selected');
      },
      child: Column(
        children: [
          Container(
              width: dp(64),
              height: dp(64),
              decoration: BoxDecoration(
                  color: isSelected ? CustomColors.main : CustomColors.purpleSuperDark,
                  shape: BoxShape.circle
              ),
              child: Center(
                child: Image.asset(
                  CustomIconPaths.eventIcons['music'],
                  width: dp(40),
                  height: dp(40),
                ),
              )
          ),
          SizedBox(height: dp(8)),
          Expanded(
            child: Text(
              'Текст в три строчки',
              style: CustomTextStyles.caption.copyWith(
                  color: isSelected ? CustomColors.silverWhite : CustomColors.purpleLight
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}