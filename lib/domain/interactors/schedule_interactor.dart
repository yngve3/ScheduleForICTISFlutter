import 'dart:async';

import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/data/models/event_db.dart';
import 'package:schedule_for_ictis_flutter/data/models/week_schedule_db.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/current_week_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/events_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/favorite_schedules_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/schedule_repository.dart';
import 'package:schedule_for_ictis_flutter/domain/models/week_number.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/date_time_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/time_of_day_ext.dart';

import '../models/schedule/day_schedule/day_schedule.dart';
import '../models/schedule/day_schedule_item.dart';
import '../models/schedule/week_schedule/week_schedule.dart';

class ScheduleInteractor {
  final ScheduleRepository scheduleRepository = ScheduleRepository();
  final FavoriteSchedulesRepository favoriteSchedulesRepository = FavoriteSchedulesRepository();
  final EventsRepository eventsRepository = EventsRepository();
  final CurrentWeekRepository currentWeekRepository = CurrentWeekRepository();


  Future<Stream<WeekSchedule>> getWeekSchedule({WeekNumber? weekNumber}) async {
    final scheduleSubject = favoriteSchedulesRepository.getSelectedFavoriteSchedule();
    final calendarWeekNumber = weekNumber?.calendarWeekNumber ?? DateTime.now().weekNumber;
    final eventsDBStream = eventsRepository.getEventsByWeekNum(calendarWeekNumber);
    WeekScheduleDB? weekScheduleDB;

    if (scheduleSubject != null) {
      await scheduleRepository.loadWeekSchedule(scheduleSubject, weekNumber);
      weekScheduleDB = await scheduleRepository.getWeekSchedule(scheduleSubject, calendarWeekNumber);
    }

    return eventsDBStream.map((eventsDB) => create(eventsDB, weekScheduleDB));
  }

  WeekSchedule create(List<EventDB> eventsDB, WeekScheduleDB? weekScheduleDB) {
    List<DaySchedule> daySchedules = [];
    final daySchedulesDB = weekScheduleDB?.daySchedules;
    for (int weekday = 1; weekday <= 7; weekday++) {
      final List<DayScheduleItem> items = [];
      items.addAll(eventsDB
          .where((element) => element.date.weekday == weekday)
          .map((e) => Event.fromEventDB(e))
          .toList()
      );

      if (weekday != 7 && weekScheduleDB != null) {
        items.addAll(daySchedulesDB![weekday - 1]
            .couples
            .where((element) => element.isNotEmpty)
            .map((element) => Couple.fromCoupleDB(element))
            .toList()
        );
      }
      daySchedules.add(DaySchedule(items: items));
    }

    final weekNumber = WeekNumber(
        studyWeekNumber: weekScheduleDB?.studyWeekNumber,
        calendarWeekNumber: weekScheduleDB?.calendarWeekNumber ?? DateTime.now().weekNumber
    );

    return WeekSchedule(weekNumber: weekNumber, daySchedules: daySchedules);
  }

  void addEvent({
    required TimeOfDay timeStart,
    required TimeOfDay timeEnd,
    required String title,
    required String description,
    required DateTime date
  }) {
    eventsRepository.addEvent(
        EventDB(
          title: title,
          description: description,
          date: date,
          timeEnd: timeEnd.string,
          timeStart: timeStart.string,
          weekNum: date.weekNumber,
        )
    );
  }
}