import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'dart:developer';

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleState(DateTime.now()));

  void nextDay() {
    emit(ScheduleState(state.selectedDay.add(const Duration(days: 1))));
  }

  void previousDay() {
    emit(ScheduleState(state.selectedDay.subtract(const Duration(days: 1))));
  }

  void selectDay(DateTime date) {
    emit(ScheduleState(date));
  }

  void nextOrPreviousDay(int weekDay) {
    int selectedWeekDay = state.selectedDay.weekday;
    print(weekDay - selectedWeekDay);

    if (weekDay - selectedWeekDay == 1) {
      nextDay();
    } else if (weekDay - selectedWeekDay == -1) {
      previousDay();
    }
  }
}
