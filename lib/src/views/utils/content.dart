import 'package:mind_tracker/src/business_logic/models/part_of_day.dart';


class Content {

  Content._();

  static const moodNames = {
    1: 'Ужасно',
    2: 'Плохо',
    3: 'Не очень',
    4: 'Нормально',
    5: 'Хорошо',
    6: 'Отлично',
    7: 'Восхитительно',
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
}