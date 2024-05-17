class MinutesToString {
  static String minutesToString(int minutes) {
    if (minutes == 0) return "В момент начала";

    int hours = minutes ~/ 60;
    minutes -= hours * 60;
    int days = 0;
    int weeks = 0;

    if (hours > 24) {
      days = hours ~/ 24;
      hours -= days * 24;
    }

    if (days > 1) {
      weeks = days ~/ 7;
      days -= weeks * 7;
    }

    final timeString = "${_timeUnitToString(weeks)[0]} "
        "${_timeUnitToString(days)[1]} "
        "${_timeUnitToString(hours)[2]} "
        "${_timeUnitToString(minutes)[3]}".trim();

    return timeString;
  }

  static List<String> _timeUnitToString(int timeUnitNum) {
    if (timeUnitNum == 0) return ["", "", "", ""];
    final List<List<String>> timeUnitWordsList = [
      ["неделя", "день", "час", "минута"],
      ["недели", "дня", "часа", "минуты"],
      ["недель", "дней", "часов", "минут"]
    ];

    List<String>? timeUnitWords;

    if (timeUnitNum % 10 == 1) {
      timeUnitWords =  timeUnitWordsList[0];
    } else if (timeUnitNum % 10 >= 2 && timeUnitNum % 10 <= 4) {
      timeUnitWords = timeUnitWordsList[1];
    } else if ((timeUnitNum >= 5 && timeUnitNum <= 20) || timeUnitNum % 10 >= 5 && timeUnitNum % 10 <= 9 || timeUnitNum % 10 == 0) {
      timeUnitWords = timeUnitWordsList[2];
    }

    if (timeUnitWords != null) {
      for (int i = 0; i < 4; i++) {
        timeUnitWords[i] = "$timeUnitNum ${timeUnitWords[i]}";
      }
      return timeUnitWords;
    }

    return ["", "", "", ""];
  }
}