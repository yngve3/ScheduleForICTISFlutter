import 'dart:async';

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

    WeekScheduleDB? mainStudySchedule;
    WeekScheduleDB? vpkStudySchedule;

    final scheduleSubject= await favoriteSchedulesRepository.getSelectedFavoriteSchedules();
    if (scheduleSubject != null) {
      await scheduleRepository.loadWeekSchedule(scheduleSubject, weekNumber);
      mainStudySchedule = await scheduleRepository.getWeekSchedule(scheduleSubject, calendarWeekNumber);

      if (mainStudySchedule?.isVPK ?? false) {
        final scheduleSubjectVPK = await favoriteSchedulesRepository.getSelectedFavoriteSchedules(isVPK: true);
        if (scheduleSubjectVPK != null) {
          await scheduleRepository.loadWeekSchedule(scheduleSubjectVPK, weekNumber);
          vpkStudySchedule = await scheduleRepository.getWeekSchedule(scheduleSubjectVPK, calendarWeekNumber);
        }
      }
    }

    return eventsDBStream.map((eventsDB) => _createWeekSchedule(eventsDB: eventsDB, mainStudySchedule: mainStudySchedule, vpkStudySchedule: vpkStudySchedule));
  }

  WeekSchedule _createWeekSchedule({
    required List<EventDB> eventsDB,
    WeekScheduleDB? mainStudySchedule,
    WeekScheduleDB? vpkStudySchedule
  }) {
    List<DaySchedule> daySchedules = [];
    for (int weekday = 1; weekday <= 7; weekday++) {
      final List<DayScheduleItem> items = [];

      _addEvents(weekday, items, eventsDB);
      _addStudySchedule(weekday, items, mainStudySchedule);
      _addStudySchedule(weekday, items, vpkStudySchedule);

      bool? isVPK;
      bool? isVUC;

      if (weekday != 7) {
        isVPK = vpkStudySchedule == null && (mainStudySchedule?.daySchedules[weekday - 1].isVPK ?? false);
        isVUC = mainStudySchedule?.daySchedules[weekday - 1].isVUC;
      }

      items.sort((a, b) => a.timeStart.compareTo(b.timeStart));
      daySchedules.add(DaySchedule(items: items, isVPK: isVPK ?? false, isVUC: isVUC ?? false));
    }

    final weekNumber = _createWeekNumber(mainStudySchedule);

    return WeekSchedule(weekNumber: weekNumber, daySchedules: daySchedules);
  }

  WeekNumber _createWeekNumber(WeekScheduleDB? weekScheduleDB) {
    if (weekScheduleDB != null) {
      return WeekNumber(
        calendarWeekNumber: weekScheduleDB.calendarWeekNumber,
        studyWeekNumber: weekScheduleDB.studyWeekNumber,
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

  void _addStudySchedule(int weekday, List<DayScheduleItem> items, WeekScheduleDB? weekScheduleDB) {
    if (weekScheduleDB == null || weekday == 7 || weekScheduleDB.daySchedules[weekday - 1].couples.isEmpty) return;

    items.addAll(weekScheduleDB.daySchedules[weekday - 1]
        .couples
        .where((element) => element.isNotEmpty && element.isNotVPKPlaceHolder)
        .map((element) => Couple.fromCoupleDB(element))
        .toList()
    );
  }
}