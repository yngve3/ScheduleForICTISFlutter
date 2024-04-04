import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {

  static TimeOfDay parse(String time) {
    final timeSplit = time.split(':');
    final hour = int.parse(timeSplit[0]);
    final minute = int.parse(timeSplit[1]);
    return TimeOfDay(hour: hour, minute: minute);
  }

  String get string {
    return "$hour:$minute";
  }

  int compareTo(TimeOfDay other) {
    if (hour < other.hour) return -1;
    if (hour > other.hour) return 1;
    if (minute < other.minute) return -1;
    if (minute > other.minute) return 1;
    return 0;
  }

  static TimeOfDay? timeStart(int coupleNum) {
    switch (coupleNum) {
      case 1: return const TimeOfDay(hour: 8,  minute: 0);
      case 2: return const TimeOfDay(hour: 9,  minute: 50);
      case 3: return const TimeOfDay(hour: 11, minute: 55);
      case 4: return const TimeOfDay(hour: 13, minute: 45);
      case 5: return const TimeOfDay(hour: 15, minute: 50);
      case 6: return const TimeOfDay(hour: 17, minute: 40);
      case 7: return const TimeOfDay(hour: 19, minute: 30);
    }
    return null;
  }

  static TimeOfDay? timeEnd(int coupleNum) {
    switch (coupleNum) {
      case 1: return const TimeOfDay(hour: 9,  minute: 35);
      case 2: return const TimeOfDay(hour: 11, minute: 25);
      case 3: return const TimeOfDay(hour: 13, minute: 30);
      case 4: return const TimeOfDay(hour: 15, minute: 20);
      case 5: return const TimeOfDay(hour: 17, minute: 25);
      case 6: return const TimeOfDay(hour: 19, minute: 15);
      case 7: return const TimeOfDay(hour: 21, minute: 05);
    }
    return null;
  }
}
