


mixin Content {
  var content;

  void setWidgetName(String widgetName) {
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

  static final _widgetsData = {
    'onboardingScreen': const {
      'screenTexts': {
        1: "Следите за своим ментальным состоянием оценивая его по шкале с семью градациями.",
        2: "Важно делать отметки несколько раз в день, устанавливайте напоминания в удобное время.",
        3: "Отмечайте, что произошло за день. Приложение поможет вам проанализировать, как привычки  влияют на ваш внутренний баланс.",
        4: "Чем дольше вы ведёте записи, тем более ценные данные получите. Вы убедитесь в очевидных связях между событиями и эмоциями и обнаружите неочевидные."
      } as dynamic,
      'pathsToImages': {
        1: "assets/images/onboarding/lamp.png",
        2: "assets/images/onboarding/fishes.png",
        3: "assets/images/onboarding/butterfly.png",
        4: "assets/images/onboarding/monkey.png"
      } as dynamic,
      'nextButtonText': 'Далее'
    },

    'moodAssessmentScreen': {
      'titleText': 'Как ваше настроение?',
      'pathToCloseIcon': 'assets/icons/close.png',
      'pathsToMoodSpheres': Map.fromIterable(
          List.generate(7, (i) => i + 1),
          key: (item) => item,
          value: (
              item) => 'assets/images/common/mood_spheres/$item.png'
      ),
      'pathToMoodSliderImage': 'assets/images/mood_assessment/mood_slider.png',
      'moodNames': moodNames,
      'secondaryMoodText': 'Настроение',
      'secondaryPullText': 'Потяни',
      'assessButtonText': 'Оценить',
      'skipButtonText': 'Пропустить',
    },

    'mainScreen': {
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
    },

    'emptyMoodAssessmentCard': {
      'buttonText': 'Оценить'
    }
  };
}