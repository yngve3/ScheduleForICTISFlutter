import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/favorite_schedules_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/schedule_repository.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/schedule/cubit/schedule_state.dart';

import '../../../../data/models/week_schedule_db.dart';
import '../../../../domain/models/schedule/day_schedule/day_schedule.dart';
import '../../../../domain/models/schedule/day_schedule_item.dart';
import '../../../../domain/models/schedule/week_schedule/week_schedule.dart';
import '../../../../domain/models/schedule_subject/schedule_subject.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(
      ScheduleState(
          selectedDay: DateTime.now(),
          weekSchedule: WeekSchedule.empty()
      )
  );

  final _scheduleRepository = ScheduleRepository();
  final _favoriteSchedulesRepository = FavoriteSchedulesRepository();

  StreamSubscription<ScheduleSubject?>? scheduleSubjectSubscription;


  void getWeekSchedule({int? weekNum}) {
    final scheduleSubject = _favoriteSchedulesRepository.getSelectedFavoriteSchedule();

    if (scheduleSubjectSubscription != null) scheduleSubjectSubscription!.cancel();
    scheduleSubjectSubscription = scheduleSubject.listen((event) async {
      final schedule = await _scheduleRepository.getWeekSchedule(event!, weekNum: weekNum);
      emit(state.copyWith(weekSchedule: generateWeekSchedule(schedule)));
    });
  }

  WeekSchedule generateWeekSchedule(WeekScheduleDB weekScheduleDB) {
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

  @override
  Future<void> close() {
    if (scheduleSubjectSubscription != null) scheduleSubjectSubscription!.cancel();
    return super.close();
  }

  void nextDay() {
    emit(state.copyWith(selectedDay: state.selectedDay.add(const Duration(days: 1))));
  }

  void previousDay() {
    final newDay = state.selectedDay.subtract(const Duration(days: 1));
    emit(state.copyWith(selectedDay: newDay));
  }

  void selectDay(DateTime date) {
    final weekNumDifference = _weekNumDifference(date);
    if (weekNumDifference != 0) {
      getWeekSchedule(weekNum: state.weekSchedule.weekNum + weekNumDifference);
    }
    emit(state.copyWith(selectedDay: date));
  }

  void nextOrPreviousDay(int weekDay) {
    int selectedWeekDay = state.selectedDay.weekday;

    if (weekDay - selectedWeekDay == 1) {
      nextDay();
    } else if (weekDay - selectedWeekDay == -1) {
      previousDay();
    }
  }

  int _weekNumDifference(DateTime newDay) {
    return newDay.weekNumber() - state.selectedDay.weekNumber();
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

extension on DateTime {
  /// Calculates week number from a date as per https://en.wikipedia.org/wiki/ISO_week_date#Calculation
  int weekNumber() {
    int dayOfYear = int.parse(DateFormat("D").format(this));
    int woy =  ((dayOfYear - weekday + 10) / 7).floor();
    if (woy < 1) {
      woy = numOfWeeks(year - 1);
    } else if (woy > numOfWeeks(year)) {
      woy = 1;
    }
    return woy;
  }

  /// Calculates number of weeks for a given year as per https://en.wikipedia.org/wiki/ISO_week_date#Weeks_per_year
  int numOfWeeks(int year) {
    DateTime dec28 = DateTime(year, 12, 28);
    int dayOfDec28 = int.parse(DateFormat("D").format(dec28));
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }
}
