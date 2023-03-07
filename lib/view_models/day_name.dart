class DayName {
  String parseDateofWeekToShort(String dayOfWeek) {
    switch (dayOfWeek) {
      case "Monday":
        return "MON";
      case "Tuesday":
        return "TUE";
      case "Wednesday":
        return "WED";
      case "Thursday":
        return "THU";
      case "Friday":
        return "FRI";
      case "Sunday":
        return "SUN";
      case "Saturday":
        return "SAT";
      default:
        return "MON";
    }
  }

  DateTime getCurrentData() {
    final DateTime date = DateTime.now();
    return date;
  }
}
