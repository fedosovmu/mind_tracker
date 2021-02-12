import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import '../../../utils/metrics.dart';


class CustomTabBar extends StatelessWidget {
  final tabController;

  CustomTabBar (this.tabController);


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      //width: double.infinity,
      children: [
        Container(
          color: CustomColors.purpleSuperDark,
          width: double.infinity,
          height: dp(2),
        ),
        TabBar(
            isScrollable: false,
            labelStyle: CustomTextStyles.basicH1Medium,
            labelColor: CustomColors.purpleLight,
            unselectedLabelStyle: CustomTextStyles.basicH1Medium,
            unselectedLabelColor: CustomColors.purpleTextSecondary,
            indicatorColor: CustomColors.purpleLight,
            tabs: [
              Tab(text: 'График',),
              Tab(text: 'Влияние',)
            ],
            controller: tabController
        ),
      ],
    );
  }

}