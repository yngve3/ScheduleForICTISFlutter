import 'package:bloc/bloc.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/schedule/cubit/schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleState(selectedDay: DateTime.now()));

  void nextDay() {
    emit(ScheduleState(selectedDay: state.selectedDay.add(const Duration(days: 1))));
  }

  void previousDay() {
    emit(ScheduleState(selectedDay: state.selectedDay.subtract(const Duration(days: 1))));
  }

  void selectDay(DateTime date) {
    emit(ScheduleState(selectedDay: date));
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
