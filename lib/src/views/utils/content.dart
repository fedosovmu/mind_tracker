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

    'moodAssessmentScreen': {
      'titleText': 'Как ваше настроение?',
      'pathToCloseIcon': 'assets/icons/close.png',
      'pathsToMoodSpheres': Map.fromIterable(
          List.generate(7, (i) => i + 1),
          key: (item) => item,
          value: (item) => 'assets/images/common/mood_spheres/$item.png'
      ),
      'pathToMoodSliderImage': 'assets/images/mood_assessment/mood_slider.png',
      'moodNames': moodNames,
      'secondaryMoodText': 'Настроение',
      'secondaryPullText': 'Потяни',
      'assessButtonText': 'Оценить',
      'skipButtonText': 'Пропустить',
    },

    'homePage': const {
      'title': 'Ваше настроение'
    },

    'moodAssessmentCard': {
      'moodNames': moodNames,
      'getEventWord': (int eventsNumber) {
        if ((eventsNumber % 10) == 1) {
          return 'Событие';
        } else if ((eventsNumber % 10) > 1 && (eventsNumber % 10) <= 4) {
          return 'События';
        } else {
          return 'Событий';
        }
      } as dynamic,
      'getPartOfDayWord': (PartOfDay partOfDay) {
        switch (partOfDay) {
          case PartOfDay.morning: {
            return 'Утро';
          } break;
          case PartOfDay.day: {
            return 'День';
          } break;
          case PartOfDay.evening: {
            return 'Вечер';
          } break;
          case PartOfDay.night: {
            return 'Ночь';
          } break;
        }
      } as dynamic,
    },

    'emptyMoodAssessmentCard': const {
      'buttonText': 'Оценить'
    },
  };
}