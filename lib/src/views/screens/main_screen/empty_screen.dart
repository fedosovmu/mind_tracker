import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class EmptyScreen extends StatelessWidget {
  static const _pathToPlaceholderImage = 'assets/images/other/events_data_collection_in_progress.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'События',
      ),
      body: Container(
        color: CustomColors.purpleDark,
        child: Stack(
          children: [
            Image.asset(
              _pathToPlaceholderImage,
              width: double.infinity,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Мы собираем данные',
                    style: CustomTextStyles.titleH1.copyWith(
                      color: CustomColors.purpleWhite
                    )
                  ),
                  SizedBox(height: dp(12)),
                  Text('Выставляйте больше событий, чтобы получить\n'
                      'информацию о том, как события влияют\n'
                      'на настроение',
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.basic.copyWith(
                      color: CustomColors.purpleWhite
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}