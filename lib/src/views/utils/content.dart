import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mind_tracker/src/business_logic/models/part_of_day.dart';


class Content {

  Content._();

  static const moodNames = {
    1: 'Ужасное',
    2: 'Плохое',
    3: 'Не очень',
    4: 'Нормальное',
    5: 'Хорошое',
    6: 'Отличное',
    7: 'Восхитительное',
  };

  static const weekDayNames = {
    1: 'Пн',
    2: 'Вт',
    3: 'Ср',
    4: 'Чт',
    5: 'Пт',
    6: 'Сб',
    7: 'Вс'
  };

  static const monthNames = {
    1: 'Январь',
    2: 'Февраль',
    3: 'Март',
    4: 'Апрель',
    5: 'Май',
    6: 'Июнь',
    7: 'Июль',
    8: 'Август',
    9: 'Сентябрь',
    10: 'Октябрь',
    11: 'Ноябрь',
    12: 'Декабрь',
  };

  static const monthNamesInParentCase = {
    1: 'января',
    2: 'февраля',
    3: 'марта',
    4: 'апрелья',
    5: 'мая',
    6: 'июня',
    7: 'июля',
    8: 'августа',
    9: 'сентября',
    10: 'октября',
    11: 'ноября',
    12: 'декабря',
  };

  static const partOfDayNames = {
    PartOfDay.morning: 'Утро',
    PartOfDay.day: 'День',
    PartOfDay.evening: 'Вечер',
    PartOfDay.night: 'Ночь',
  };

  static const partOfDayNamesInInstrumentalCase = {
    PartOfDay.morning: 'утром',
    PartOfDay.day: 'днем',
    PartOfDay.evening: 'вечером',
    PartOfDay.night: 'ночью',
  };

  static String getTimeString(BuildContext context, DateTime time) {
    final is24HourFormat = MediaQuery.of(context).alwaysUse24HourFormat;
    if (is24HourFormat) {
      return DateFormat('Hm').format(time);
    } else {
      return DateFormat('jm').format(time);
    }
  }

  static String getDateString (DateTime date) {
    return '${date.day} ${Content.monthNamesInParentCase[date.month]}';
  }
}