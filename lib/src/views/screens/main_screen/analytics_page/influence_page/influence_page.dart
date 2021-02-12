import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class InfluencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Здесь будет влияние',
        style: CustomTextStyles.titleH1.copyWith(
          color: CustomColors.purpleTextSecondary
        ),
      )
    );
  }
}