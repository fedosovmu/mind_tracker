import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/other/standard_button.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_border_shape.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class DeleteDialog extends StatelessWidget {
  final String text;

  DeleteDialog(this.text);

  static Future<bool> show(BuildContext context, String text) async {
    return await showDialog(
      barrierColor: CustomColors.purpleDark.withOpacity(0.8),
      context: context,
      builder: (context) {
        return DeleteDialog(text);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: dp(215),
        width: double.infinity,
        margin: EdgeInsets.only(left: dp(8), right: dp(8), bottom: dp(16)),
        decoration: ShapeDecoration(
          color: CustomColors.purpleSuperDark,
          shape: CustomBorderShape(dp(16))
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(top: dp(16), right: dp(16)),
                child: _CloseDialogButton()
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: dp(32), right: dp(32), top: dp(64)),
              alignment: Alignment.topCenter,
              child: Text(
                text,
                style: CustomTextStyles.titleH1,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(left: dp(16), right: dp(16), bottom: dp(16)),
              child: StandardButton(
                title: 'Удалить',
                backgroundColor: CustomColors.red,
                onPressed: () {
                  print('delete dialog button pressed');
                  Navigator.of(context).pop(true);
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _CloseDialogButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        height: dp(32),
        width: dp(32),
        decoration: BoxDecoration(
          color: CustomColors.purpleMegaDark,
          shape: BoxShape.circle
        ),
        child: Center(
          child: Image.asset(
            CustomIconPaths.close,
            height: dp(24),
            width: dp(24),
          ),
        ),
      ),
    );
  }
}