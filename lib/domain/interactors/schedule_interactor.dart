import 'dart:async';

import 'package:collection/collection.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/user_repository.dart';
import 'package:stream_transform/stream_transform.dart';

import 'package:schedule_for_ictis_flutter/data/repositories/couples_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/events_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/favorite_schedules_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/week_number_repository.dart';

import 'package:schedule_for_ictis_flutter/domain/models/schedule/day_schedule/day_schedule.dart';
import 'package:schedule_for_ictis_flutter/domain/models/week_number/week_number.dart';
import '../../data/models/couple_db.dart';
import '../../data/models/event_db.dart';
import '../models/schedule/day_schedule_item.dart';
import '../models/schedule/week_schedule/week_schedule.dart';
import '../models/schedule_subject/schedule_subject.dart';

class ScheduleInteractorState {
  final List<EventDB> eventsDB = [];
  final List<CoupleDB> couplesDB = [];

  final _controller = StreamController<ScheduleInteractorState>();
  Stream<ScheduleInteractorState> get state => _controller.stream;

  void setEventsDB(List<EventDB> eventsDB) {
    this.eventsDB.clear();
    this.eventsDB.addAll(eventsDB);
    _controller.add(this);
  }

  void setCouplesDB(List<CoupleDB> couplesDB) {
    this.couplesDB.clear();
    this.couplesDB.addAll(couplesDB);
    _controller.add(this);
  }
}

class ScheduleInteractor {
  final CouplesRepository _couplesRepository = CouplesRepository();
  final FavoriteSchedulesRepository _favoriteSchedulesRepository = FavoriteSchedulesRepository();
  final EventsRepository _eventsRepository = EventsRepository();
  final WeekNumberRepository _weekNumberRepository = WeekNumberRepository();
  final UserRepository _userRepository = UserRepository();

  final _controller = StreamController<WeekSchedule>();

  Stream<WeekSchedule> get weekSchedule => _controller.stream;
  ScheduleInteractorState state = ScheduleInteractorState();

  List<ScheduleSubject> favoriteSchedules = [];
  late WeekNumber weekNumber;

  ScheduleInteractor() {
    weekNumber = _weekNumberRepository.getCurrentWeekNumber() ?? WeekNumber.empty();
    _eventsRepository.eventsByWeekNum.listen((eventsDB) {
      state.setEventsDB(eventsDB);
    });
    _couplesRepository.couplesByWeekNum.listen((couplesDB) {
      state.setCouplesDB(couplesDB);
    });
    state.state.listen((event) {
      _controller.add(_createWeekSchedule(event));
    });
    _favoriteSchedulesRepository.getSelectedFavoriteScheduleStream(userUID: _userRepository.uid).listen((favoriteSchedules) {
      if (favoriteSchedules.length > 2 || favoriteSchedules.isEmpty) return;
      this.favoriteSchedules = favoriteSchedules;
      _couplesRepository.getCouples(weekNumber, favoriteSchedules);
    });
  }

  void loadSchedule({WeekNumber? weekNumber}) async {
    weekNumber ??= _weekNumberRepository.getCurrentWeekNumber();
    if (weekNumber == null || favoriteSchedules.isEmpty) return _controller.add(WeekSchedule.empty());
    await _couplesRepository.loadCouples(favoriteSchedules[0], weekNumber);
    _couplesRepository.getCouples(weekNumber, favoriteSchedules);
  }

  WeekSchedule _createWeekSchedule(ScheduleInteractorState state) {
    List<DaySchedule> daySchedules = [];
    for (int weekday = 1; weekday <= 7; weekday++) {
      List<DayScheduleItem> items = [];
      items.addAll(
          state.eventsDB
              .where((eventDB) => eventDB.dateTimeEnd.weekday == weekday)
              .map((eventDB) => Event.fromEventDB(eventDB))
              .toList()
      );

      if (weekday != 7) {
        items.addAll(
            state.couplesDB
                .where((coupleDB) => coupleDB.dateTimeEnd.weekday == weekday && coupleDB.isNotEmpty && coupleDB.isNotVPKPlaceHolder)
                .map((coupleDB) => Couple.fromCoupleDB(coupleDB))
                .toList()
        );
      }

      items.sort((a, b) => a.dateTimeStart.compareTo(b.dateTimeStart));
      daySchedules.add(DaySchedule(items: items));
    }

    return WeekSchedule(weekNumber: weekNumber, daySchedules: daySchedules);
  }
}

