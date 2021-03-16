import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import 'month_switch_button.dart';


class MonthSwitcher extends StatefulWidget {
  final Function onMonthSwitched;

  MonthSwitcher ({@required this.onMonthSwitched});

  @override
  _MonthSwitcherState createState() => _MonthSwitcherState();
}

class _MonthSwitcherState extends State<MonthSwitcher> {
  DateTime _selectedMonth;

  @override
  void initState() {
    final now = DateTime.now();
    _selectedMonth = DateTime(now.year, now.month);
  }

  _switchMonth(int monthShift) {
    setState(() {
      _selectedMonth = DateTime(_selectedMonth.year, _selectedMonth.month + monthShift);
      widget.onMonthSwitched(_selectedMonth);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: dp(16)),
      height: dp(60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${_selectedMonth.year} ${Content.monthNames[_selectedMonth.month]}',
            style: CustomTextStyles.basicH1Medium,
          ),
          SizedBox(
            width: dp(32 + 31 + 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MonthSwitchButton(onPressed: () { _switchMonth(-1); }),
                MonthSwitchButton(onPressed: () { _switchMonth(1); }, isRight: true)
              ],
            ),
          )
        ],
      ),
    );
  }
}