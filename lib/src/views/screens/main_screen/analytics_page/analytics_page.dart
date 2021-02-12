import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/screens/main_screen/analytics_page/custom_tab_bar.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:provider/provider.dart';
import '../../../utils/metrics.dart';


class AnalyticsPage extends StatefulWidget {

  @override
  _AnalyticsPageState createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> with TickerProviderStateMixin {
  var _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Аналитика',
      ),
      body: Column(
        children: [
          CustomTabBar(_tabController),
          Expanded(
            child: TabBarView(
              controller: _tabController,
                children: [
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.red,
                  )
                ]
            ),
          )
        ],
      ),
    );
  }
}