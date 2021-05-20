import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/events_provider.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_assessments_provider.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:provider/provider.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    await Provider.of<MoodAssessmentsProvider>(context, listen: false).loadData();
    await Provider.of<EventsProvider>(context, listen: false).loadData();
    Navigator.of(context).pushNamedAndRemoveUntil('/main', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.purpleDark,
      child: Center(
        child: Text(
          'Идет загрузка данных...',
          style: CustomTextStyles.titleH1.copyWith(
              color: CustomColors.purpleMedium
          ),
        ),
      ),
    );
  }
}