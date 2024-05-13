import 'dart:async';

import 'package:collection/collection.dart';
import 'package:path/path.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/user_repository.dart';

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
  final List<ScheduleSubject> favoriteSchedules = [];
  WeekNumber? weekNumber;

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
    if (couplesDB.isNotEmpty) weekNumber = couplesDB.first.weekNumber.target;
    _controller.add(this);
  }

  void setFavoriteSchedules(List<ScheduleSubject> favoriteSchedules) {
    this.favoriteSchedules.clear();
    this.favoriteSchedules.addAll(favoriteSchedules);
  }

  void setWeekNumber(WeekNumber? weekNumber) {
    this.weekNumber = weekNumber;
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
  List<StreamSubscription> subscriptions = [];

  ScheduleInteractorState state = ScheduleInteractorState();

  ScheduleInteractor() {
    subscriptions.add(
        _couplesRepository.couplesByWeekNum
            .listen((couplesDB) => state.setCouplesDB(couplesDB))
    );

    subscriptions.add(
        _eventsRepository.eventsByWeekNum
            .listen((eventsDB) => state.setEventsDB(eventsDB))
    );

    subscriptions.add(
        _favoriteSchedulesRepository
            .getSelectedFavoriteScheduleStream(userUID: _userRepository.uid)
            .listen((favoriteSchedules) {
              if (favoriteSchedules.length > 2 || favoriteSchedules.isEmpty) return;
              state.setFavoriteSchedules(favoriteSchedules);
              state.setWeekNumber(_weekNumberRepository.getCurrentWeekNumber());
              _couplesRepository.loadCouples(state.weekNumber, favoriteSchedules);
            }
        )
    );

    subscriptions.add(state.state.listen((event) =>
      _controller.add(_createWeekSchedule(event))
    ));

    _eventsRepository.getEventsByWeekNum(state.weekNumber ?? WeekNumber.empty(), _userRepository.uid);
  }

  void changeWeek(WeekNumber weekNumber) {
    state.setWeekNumber(weekNumber);
    _couplesRepository.loadCouples(weekNumber, state.favoriteSchedules);
    _eventsRepository.getEventsByWeekNum(weekNumber, _userRepository.uid);
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
        List<CoupleDB> couplesDB = state.couplesDB;
        if (couplesDB.firstWhereOrNull((element) => element.isVPKPlaceHolder) == null) {
          couplesDB = couplesDB.where((element) => element.scheduleSubject.target?.isNotVPK ?? true).toList();
        }
        items.addAll(
            couplesDB
                .where((coupleDB) => coupleDB.dateTimeEnd.weekday == weekday && coupleDB.isNotEmpty && coupleDB.isNotVPKPlaceHolder)
                .map((coupleDB) => Couple.fromCoupleDB(coupleDB))
                .toList()
        );
      }

      items.sort((a, b) => a.dateTimeStart.compareTo(b.dateTimeStart));
      daySchedules.add(DaySchedule(items: items));
    }

    return WeekSchedule(weekNumber: state.weekNumber ?? WeekNumber.empty(), daySchedules: daySchedules);
  }

  void dispose() {
    for (final subscription in subscriptions) {
      subscription.cancel();
    }
    _controller.close();
    _couplesRepository.dispose();
    _eventsRepository.dispose();
  }
}

