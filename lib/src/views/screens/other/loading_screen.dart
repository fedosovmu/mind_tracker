import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/services/local_notifications_provider.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/events_provider.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_assessments_provider.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/settings_provider.dart';
import 'package:mind_tracker/src/views/common_widgets/other/glow_disabler.dart';
import 'package:mind_tracker/src/views/utils/custom_image_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'package:provider/provider.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool _dataLoadingError;
  String _errorMessage;

  @override
  void initState() {
    super.initState();
    _dataLoadingError = false;
    _loadData();
  }


  @override
  void didChangeDependencies() {
    CustomImagePaths.loadImages(context);
    super.didChangeDependencies();
  }

  void _loadData() async {
    try {
      await Provider.of<MoodAssessmentsProvider>(context, listen: false).loadData();
      await Provider.of<EventsProvider>(context, listen: false).loadData();
      await Provider.of<SettingsProvider>(context, listen: false).loadData();
      await LocalNotificationsProvider.initialize();
      Navigator.of(context).pushNamedAndRemoveUntil('/main', (route) => false);
    } on Exception catch (e, stacktrace) {
      print('[LOAD DATA ERROR] ${e.toString()}');
      setState(() {
        _dataLoadingError = true;
        _errorMessage = 'Пожалуйста отправьте сообщение об ошибке администратору:\n\n'
            + e.toString() + '\n' + stacktrace.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(!_dataLoadingError ? 'Идет загрузка данных...' : 'Ошибка загрузки данных!',
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.titleH1.copyWith(
                      color: !_dataLoadingError ? CustomColors.purpleMedium : CustomColors.red
                  )
                ),
              ),
            ),
            Expanded(
              flex: _dataLoadingError ? 2 : 1,
              child: _dataLoadingError ? Container(
                height: double.infinity,
                width: double.infinity,
                padding: EdgeInsets.all(dp(16)),
                child: GlowDisabler(
                  child: SingleChildScrollView(
                    child: SelectableText(_errorMessage,
                        style: CustomTextStyles.caption.copyWith(
                            color: CustomColors.red.withOpacity(0.64)
                        )
                    ),
                  ),
                ),
              ) : SizedBox.shrink(),
            )
          ],
        ),
      )
    );
  }
}

