import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/event_influence_provider.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/events_provider.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_assessments_provider.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/notifications_provider.dart';
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
      await Future.wait([
        Provider.of<MoodAssessmentsProvider>(context, listen: false).loadData(),
        Provider.of<EventsProvider>(context, listen: false).loadData(),
        Provider.of<SettingsProvider>(context, listen: false).CreateDefaultSettingsDoc().then((_) async {
          await Provider.of<NotificationsProvider>(context, listen: false).loadData();
        }),
      ]);
      _goToNextScreen();
    } on Exception catch (e, stacktrace) {
      print('[LOAD DATA ERROR] ${e.toString()}');
      setState(() {
        _dataLoadingError = true;
        _errorMessage = e.toString() + '\n' + stacktrace.toString();
      });
    }
  }

  void _goToNextScreen() {
    Navigator.of(context).pushNamedAndRemoveUntil('/main', (route) => false);
    final didNotificationLaunchApp = Provider.of<NotificationsProvider>(context, listen: false)
        .didNotificationLaunchApp;
    if (didNotificationLaunchApp) {
      Navigator.of(context).pushNamed('/moodAssessment', arguments: {'startMode': 'now'});
    }
  }


  @override
  Widget build(BuildContext context) {
    if (_dataLoadingError) {
      return _buildErrorMessage();
    } else {
      return _buildLoadingMessage();
    }
  }

  Widget _buildLoadingMessage() {
    return Scaffold(
      body: Center(
        child: Text('Идет загрузка данных...',
          textAlign: TextAlign.center,
          style: CustomTextStyles.titleH1.copyWith(
            color: CustomColors.purpleMedium
          )
        )
      ),
    );
  }

  Widget _buildErrorMessage() {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text('Ошибка загрузки данных!',
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.titleH1.copyWith(
                        color: CustomColors.red
                    )
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                padding: EdgeInsets.all(dp(16)),
                child: GlowDisabler(
                  child: SingleChildScrollView(
                    child: SelectableText(
                        'Пожалуйста отправьте сообщение об ошибке администратору:\n\n' + _errorMessage,
                        style: CustomTextStyles.caption.copyWith(
                            color: CustomColors.red.withOpacity(0.64)
                        )
                    ),
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}

