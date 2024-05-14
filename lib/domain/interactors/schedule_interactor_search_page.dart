import 'dart:async';

import 'package:schedule_for_ictis_flutter/data/repositories/couples_repository.dart';
import 'package:schedule_for_ictis_flutter/domain/interactors/schedule_interactor.dart';
import 'package:schedule_for_ictis_flutter/domain/models/schedule/week_schedule/week_schedule.dart';
import 'package:schedule_for_ictis_flutter/domain/models/schedule_subject/schedule_subject.dart';
import 'package:schedule_for_ictis_flutter/domain/models/week_number/week_number.dart';

import '../../data/models/couple_db.dart';
import '../models/schedule/day_schedule/day_schedule.dart';
import '../models/schedule/day_schedule_item.dart';

class ScheduleInteractorSearchPage implements ScheduleInteractor {
  final _couplesRepository = CouplesRepository();
  final _controller = StreamController<WeekSchedule>();

  ScheduleInteractorSearchPage(this.scheduleSubject);

  final ScheduleSubject scheduleSubject;

  @override
  Stream<WeekSchedule> get weekSchedule => _controller.stream;

  @override
  void changeWeek({WeekNumber? weekNumber}) async {
    final couplesDB = await _couplesRepository.getCouplesFromNet(scheduleSubject, weekNumber);
    _controller.add(_createWeekSchedule(couplesDB));
  }

  WeekSchedule _createWeekSchedule(List<CoupleDB> couplesDB) {
    List<DaySchedule> daySchedules = [];
    for (int weekday = 1; weekday <= 7; weekday++) {
      List<DayScheduleItem> items = [];
      if (weekday != 7) {
        items
            .addAll(couplesDB.where((element) => element.dateTimeStart.weekday == weekday && element.isNotEmpty)
            .map((element) => Couple.fromCoupleDB(element)));
      }

      daySchedules.add(DaySchedule(items: items));
    }

    WeekNumber? weekNumber;
    if (couplesDB.isNotEmpty) {
      weekNumber = couplesDB.first.weekNumber.target;
    }
    return WeekSchedule(weekNumber: weekNumber ?? WeekNumber.empty(), daySchedules: daySchedules);
  }

  @override
  void dispose() {
    _controller.close();
    _couplesRepository.dispose();
  }
}