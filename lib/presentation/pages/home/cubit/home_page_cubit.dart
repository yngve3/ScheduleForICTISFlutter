import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/domain/interactors/schedule_interactor.dart';
import 'package:schedule_for_ictis_flutter/domain/models/schedule/week_schedule/week_schedule.dart';

import '../../../../domain/models/schedule/day_schedule_item.dart';
import 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(const HomePageState()) {
    subscription = _interactor.weekSchedule.listen((weekSchedule) {
      final items = _getComingItems(weekSchedule);
      emit(state.copyWith(scheduleItems: items, weekSchedule: weekSchedule));
    });
  }
  late StreamSubscription subscription;
  final _interactor = ScheduleInteractor();

  void update() {
    final items = _getComingItems(state.weekSchedule);
    emit(state.copyWith(scheduleItems: items));
  }

  List<DayScheduleItem> _getComingItems(WeekSchedule? weekSchedule) {
    if (weekSchedule == null) return [];
    final nowDate = DateTime.now();
    final items = weekSchedule.daySchedules[nowDate.weekday - 1].items
        .where((element) => element.dateTimeEnd.isAfter(nowDate))
        .toList();

    return items;
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
