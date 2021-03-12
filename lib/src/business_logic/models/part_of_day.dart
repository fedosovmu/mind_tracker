enum PartOfDay {night, morning, day, evening}

extension PartOfDayBuilder on PartOfDay {
  toShortString() {
    return this.toString().split('.').last;
  }

  static PartOfDay fromShortString(part_of_day_short_string) {
    switch(part_of_day_short_string) {
      case 'night': {
        return PartOfDay.night;
      } break;
      case 'morning': {
        return PartOfDay.morning;
      } break;
      case 'day': {
        return PartOfDay.day;
      } break;
      case 'evening': {
        return PartOfDay.evening;
      } break;
    }
  }

  static PartOfDay fromDateTime(DateTime time) {
    final hour = time.hour;
    if (hour >= 4 && hour < 12) {
      return PartOfDay.morning;
    } else if (hour >= 12 && hour < 18) {
      return PartOfDay.day;
    } else if (hour >= 18 && hour < 24) {
      return PartOfDay.evening;
    } else {
      return PartOfDay.night;
    }
  }
}