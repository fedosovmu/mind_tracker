import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class MoodChartCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: dp(20)),
      width: dp(327),
      height: dp(352),
      decoration: BoxDecoration(
        color: CustomColors.purpleSuperDark,
        borderRadius: BorderRadius.all(Radius.circular(dp(16))),
      ),
      child: Column(
        children: [
          PeriodToggleButtons(),
          Container(
            padding: EdgeInsets.only(top: dp(14), left: dp(16)),
            //color: Colors.blue,
            width: double.infinity,
            height: dp(40),
            child: Text(
              'Февраль',
              style: CustomTextStyles.basicH1Medium,
            ),
          ),
          _buildMoodChart(),
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMoodChart() {
    return Container(
      //margin: EdgeInsets.only(left: dp(0), top: dp(0), right: dp(0)),
      color: Colors.orange,
      //width: double.infinity,
      height: dp(220),
    );
  }
}


class PeriodToggleButtons extends StatefulWidget {
  final Function onPeriodChange;

  PeriodToggleButtons({this.onPeriodChange});

  @override
  _PeriodToggleButtonsState createState() => _PeriodToggleButtonsState();
}

class _PeriodToggleButtonsState extends State<PeriodToggleButtons> {
  int _selectedIndex = 0;
  static const _periodNames = ['Неделя', 'Месяц', 'Период'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: dp(12), right: dp(12), top: dp(16)),
      height: dp(26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(_periodNames.length, (index) {
          return PeriodButton(
            _periodNames[index],
            isPressed: index == _selectedIndex,
            onPressed: () {
              setState(() {
                _selectedIndex = index;
                print('Perion button $index was pressed');
              });
            }
          );
        }),
      ),
    );
  }
}

class PeriodButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final bool isPressed;
  
  PeriodButton(this.title, {this.onPressed, this.isPressed = false});
  
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      splashColor: Color(0x00),
      highlightColor: Color(0x00),
      color: isPressed ? CustomColors.purpleMegaDark : CustomColors.purpleDark,
      minWidth: dp(93),
      child: Text(
        title,
        style: CustomTextStyles.basic.copyWith(
          color: CustomColors.purpleLight
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(dp(8)))
      ),
      onPressed: onPressed
    );
  }

}
