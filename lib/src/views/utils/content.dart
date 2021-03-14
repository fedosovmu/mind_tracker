import 'package:mind_tracker/src/business_logic/models/part_of_day.dart';


mixin Content {
  var content;

  void loadContent(String widgetName) {
    content = Content._widgetsData[widgetName];
  }

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

  static const partOfDayNames = {
    PartOfDay.morning: 'Утро',
    PartOfDay.day: 'День',
    PartOfDay.evening: 'Вечер',
    PartOfDay.night: 'Ночь',
  };

  static final _widgetsData = {
    'onboardingScreen': const {
      'screenTexts': {
        1: "Следите за своим ментальным состоянием оценивая его по шкале с семью градациями.",
        2: "Важно делать отметки несколько раз в день, устанавливайте напоминания в удобное время.",
        3: "Отмечайте, что произошло за день. Приложение поможет вам проанализировать, как привычки "
            "влияют на ваш внутренний баланс.",
        4: "Чем дольше вы ведёте записи, тем более ценные данные получите. "
            "Вы убедитесь в очевидных связях между событиями и эмоциями и обнаружите неочевидные."
      } as dynamic,
      'pathsToImages': {
        1: "assets/images/onboarding/lamp.png",
        2: "assets/images/onboarding/fishes.png",
        3: "assets/images/onboarding/butterfly.png",
        4: "assets/images/onboarding/monkey.png"
      } as dynamic,
      'nextButtonNextText': 'Далее',
      'nextButtonStartText': 'Начать',
    },
  };
}