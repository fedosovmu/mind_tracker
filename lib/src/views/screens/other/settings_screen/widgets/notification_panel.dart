import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/notifications_provider.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:provider/provider.dart';


class NotificationPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationsProvider>(builder: (context, notificationsProvider, child) {
      final text = notificationsProvider.hasNotifications
          ? notificationsProvider.notificationTimes.map((notificationTime) =>
          Content.getTimeString(context, notificationTime.toDateTime())).join(', ')
          : 'Нет напоминаний';
      return Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Напоминания',
                style: CustomTextStyles.titleH1.copyWith(
                    color: CustomColors.purpleMedium
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: CustomTextStyles.basic.copyWith(
                        color: CustomColors.purpleLight
                    ),
                  ),
                  TextButton(
                      child: Text(
                        notificationsProvider.hasNotifications ? 'Изменить' : 'Добавить',
                        style: CustomTextStyles.basic.copyWith(
                            color: CustomColors.blue
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
    });
  }
}