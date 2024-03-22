import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/favorite_schedules_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/schedule_repository.dart';

import '../../data/models/week_schedule_db.dart';
import '../models/schedule/day_schedule/day_schedule.dart';
import '../models/schedule/day_schedule_item.dart';
import '../models/schedule/week_schedule/week_schedule.dart';

class ScheduleInteractor {
  final ScheduleRepository scheduleRepository = ScheduleRepository();
  final FavoriteSchedulesRepository favoriteSchedulesRepository = FavoriteSchedulesRepository();


  Future<WeekSchedule> getWeekSchedule({int? weekNum}) {
    final scheduleSubject = favoriteSchedulesRepository.getSelectedFavoriteSchedule();

    WeekSchedule weekSchedule;

    scheduleSubject.listen((event) async {
      final schedule = await scheduleRepository.getWeekSchedule(event!, weekNum: weekNum);
      weekSchedule = await generateWeekSchedule(schedule);
    });

    return weekSchedule;

  }

  Future<WeekSchedule> generateWeekSchedule(WeekScheduleDB weekScheduleDB) async {
    List<DaySchedule> daySchedules = [];
    for (final dayScheduleDB in weekScheduleDB.daySchedules) {
      List<DayScheduleItem> couples = [];
      for (int i = 0; i < dayScheduleDB.couples.length; i++) {
        final coupleDB = dayScheduleDB.couples[i];
        couples.add(Couple.fromCoupleDB(coupleDB, i + 1));
      }

      couples.add(Event(const TimeOfDay(hour: 11, minute: 1), const TimeOfDay(hour: 2, minute: 2), title: "fk", description: "lsakdjf"));

      couples.sort((a, b) => a.timeStart.compareTo(b.timeStart));

      daySchedules.add(DaySchedule(items: couples));
    }

    daySchedules.add(DaySchedule(items: [Event(const TimeOfDay(hour: 1, minute: 1), const TimeOfDay(hour: 2, minute: 2), title: "fk", description: "lsakdjf")]));

    return WeekSchedule(weekNum: weekScheduleDB.weekNum, daySchedules: daySchedules);
  }
}

extension on TimeOfDay {
  int compareTo(TimeOfDay other) {
    if (hour < other.hour) return -1;
    if (hour > other.hour) return 1;
    if (minute < other.minute) return -1;
    if (minute > other.minute) return 1;
    return 0;
  }
}