import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mind_tracker/src/views/screens/other/notification_screen/custom_time_picker/widgets/custom_drum.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_shape.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';


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