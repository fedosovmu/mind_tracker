import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class NotificationPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Уведомления',
              style: CustomTextStyles.titleH1.copyWith(
                  color: CustomColors.purpleMedium
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Нет уведомлений',
                  style: CustomTextStyles.basic.copyWith(
                      color: CustomColors.purpleLight
                  ),
                ),
                TextButton(
                    child: Text(
                      'Настроить',
                      style: CustomTextStyles.basic.copyWith(
                          color: Colors.blue
                      ),
                    ),
                    onPressed: () {
                      print('Set notification button pressed');
                      Navigator.of(context).pushNamed('/notification');
                    }
                )
              ],
            )
          ],
        )
    );
  }
}