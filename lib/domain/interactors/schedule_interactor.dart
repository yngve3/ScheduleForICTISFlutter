import 'dart:async';

import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/data/models/event_db.dart';
import 'package:schedule_for_ictis_flutter/data/models/week_schedule_db.dart';
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


  Future<Stream<WeekSchedule>> getWeekSchedule({WeekNumber? weekNumber}) async {
    final calendarWeekNumber = weekNumber?.calendarWeekNumber ?? DateTime.now().weekNumber;
    final eventsDBStream = eventsRepository.getEventsByWeekNum(calendarWeekNumber);

    final List<WeekScheduleDB> weekSchedulesDB = [];

    final scheduleSubject= await favoriteSchedulesRepository.getSelectedFavoriteSchedules(false);
    if (scheduleSubject != null) {
      await scheduleRepository.loadWeekSchedule(scheduleSubject, weekNumber);
      final mainSchedule = await scheduleRepository.getWeekSchedule(scheduleSubject, calendarWeekNumber);
      if (mainSchedule != null) {
        weekSchedulesDB.add(mainSchedule);
      }

      if (mainSchedule?.isVPK ?? false) {
        final scheduleSubjectVPK = await favoriteSchedulesRepository.getSelectedFavoriteSchedules(true);
        if (scheduleSubjectVPK != null) {
          await scheduleRepository.loadWeekSchedule(scheduleSubjectVPK, weekNumber);
          final vpkSchedule = await scheduleRepository.getWeekSchedule(scheduleSubjectVPK, calendarWeekNumber);
          if (vpkSchedule != null) {
            weekSchedulesDB.add(vpkSchedule);
          }
        }
      }
    }

    return eventsDBStream.map((eventsDB) => _createWeekSchedule(eventsDB, weekSchedulesDB));
  }

  WeekSchedule _createWeekSchedule(List<EventDB> eventsDB, List<WeekScheduleDB> weekSchedulesDB) {
    List<DaySchedule> daySchedules = [];
    for (int weekday = 1; weekday <= 7; weekday++) {
      final List<DayScheduleItem> items = [];
      _addEvents(weekday, items, eventsDB);
      _addStudySchedules(weekday, items, weekSchedulesDB);
      items.sort((a, b) => a.timeStart.compareTo(b.timeStart));
      daySchedules.add(DaySchedule(items: items));
    }

    final weekNumber = _createWeekNumber(weekSchedulesDB);

    return WeekSchedule(weekNumber: weekNumber, daySchedules: daySchedules);
  }

  WeekNumber _createWeekNumber(List<WeekScheduleDB> weekSchedulesDB) {
    if (weekSchedulesDB.isNotEmpty) {
      return WeekNumber(
        calendarWeekNumber: weekSchedulesDB[0].calendarWeekNumber,
        studyWeekNumber: weekSchedulesDB[0].studyWeekNumber,
      );
    } else {
      return WeekNumber(
          calendarWeekNumber: DateTime.now().weekNumber
      );
    }
  }

  void _addEvents(int weekday, List<DayScheduleItem> items, List<EventDB> eventsDB) {
    items.addAll(eventsDB
        .where((element) => element.date.weekday == weekday)
        .map((e) => Event.fromEventDB(e))
        .toList()
    );
  }

  void _addStudySchedules(int weekday, List<DayScheduleItem> items, List<WeekScheduleDB> weekSchedulesDB) {
    if (weekday != 7 && weekSchedulesDB.isNotEmpty) {
      for (final weekScheduleDB in weekSchedulesDB) {
        items.addAll(weekScheduleDB.daySchedules[weekday - 1]
            .couples
            .where((element) => element.isNotEmpty && element.isNotVPKPlaceHolder)
            .map((element) => Couple.fromCoupleDB(element))
            .toList()
        );
      }
    }
  }
}