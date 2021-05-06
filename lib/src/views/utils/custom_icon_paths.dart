

class CustomIconPaths {
  CustomIconPaths._();

  static const _pathToUiIcons = 'assets/icons/ui';

  static const close = '$_pathToUiIcons/close.png';
  static const back = '$_pathToUiIcons/back.png';

  static const home = '$_pathToUiIcons/home.png';
  static const chart = '$_pathToUiIcons/chart.png';
  static const events = '$_pathToUiIcons/events.png';
  static const calendar = '$_pathToUiIcons/calendar.png';

  static const plus = '$_pathToUiIcons/plus.png';
  static const plusInCircle = '$_pathToUiIcons/plus_in_circle.png';
  static const largePlus = '$_pathToUiIcons/large_plus.png';
  static const arrowLeft = '$_pathToUiIcons/arrow_left.png';
  static const arrowRight = '$_pathToUiIcons/arrow_right.png';

  static const edit = '$_pathToUiIcons/edit.png';
  static const note = '$_pathToUiIcons/note.png';
  static const settings = '$_pathToUiIcons/settings.png';

  static const _pathToEventIcons = 'assets/icons/events';
  static const _eventNames = ['alarm', 'alcohol', 'angry', 'bed', 'bell', 'bicycle',
                              'books', 'brilliant', 'camping', 'couple', 'desktop',
                              'disease', 'doctor', 'draw', 'food', 'love', 'meet',
                              'money', 'music', 'nature', 'relaxation', 'sleep',
                              'sport', 'stress', 'training'];
  static Map<String, String> eventIcons = Map.fromIterable(_eventNames,
      key: (e) => '$e', value: (e) => '$_pathToEventIcons/$e.png');
}