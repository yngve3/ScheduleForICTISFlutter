import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/domain/interactors/schedule_interactor.dart';
import 'package:schedule_for_ictis_flutter/domain/models/week_number/week_number.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/date_time_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/schedule/cubit/schedule_state.dart';

import '../../../../domain/models/schedule/week_schedule/week_schedule.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(
      ScheduleState(
          selectedDay: DateTime.now(),
          weekSchedule: WeekSchedule.empty()
      )
  ) {
    subscription = _interactor.weekSchedule.listen((event) {
      emit(state.copyWith(weekSchedule: event));
    });
  }

  final ScheduleInteractor _interactor = ScheduleInteractor();
  late StreamSubscription<WeekSchedule> subscription;

  void nextDay() {
    final newDay = state.selectedDay.add(const Duration(days: 1));
    emit(state.copyWith(selectedDay: newDay));
  }

  void previousDay() {
    final newDay = state.selectedDay.subtract(const Duration(days: 1));
    emit(state.copyWith(selectedDay: newDay));
  }

  void selectDay(DateTime date) async {
    final weekNumDifference = _weekNumDifference(date);
    emit(state.copyWith(selectedDay: date));
    if (weekNumDifference == 0) return;
    changeWeek(state.weekSchedule.weekNumber.plus(weekNumDifference));
  }

  void changeWeek(WeekNumber weekNumber) {
    _interactor.changeWeek(weekNumber);
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
    return newDay.weekNumber - state.selectedDay.weekNumber;
  }

  @override
  Future<void> close() {
    subscription.cancel();
    _interactor.dispose();
    return super.close();
  }
}