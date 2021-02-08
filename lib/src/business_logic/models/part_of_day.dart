enum PartOfDay {morning, day, evening, night}


extension PartOfDayBuilder on PartOfDay {
  toShortString() {
    return this.toString().split('.').last;
  }

  static PartOfDay fromShortString(part_of_day_short_string) {
    switch(part_of_day_short_string) {
      case 'morning': {
        return PartOfDay.morning;
      } break;
      case 'day': {
        return PartOfDay.day;
      } break;
      case 'evening': {
        return PartOfDay.evening;
      } break;
      case 'night': {
        return PartOfDay.night;
      } break;
    }
  }

  static PartOfDay fromDateTime(DateTime time) {
    final hour = time.hour;
    if (hour >= 6 && hour <= 12) {
      return PartOfDay.morning;
    } else if (hour > 12 && hour < 18) {
      return PartOfDay.day;
    } else if (hour >= 18 && hour < 24) {
      return PartOfDay.evening;
    } else {
      return PartOfDay.night;
    }
  }
}