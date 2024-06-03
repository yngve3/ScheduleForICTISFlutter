import 'dart:async';

import 'package:collection/collection.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/couples_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/events_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/favorite_schedules_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/user_repository.dart';
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
  final List<StreamSubscription> _subscriptions = [];

  final ScheduleInteractorState _state = ScheduleInteractorState();

  ScheduleInteractor() {
    _subscriptions.add(
        _couplesRepository.couples
            .listen((couplesDB) => _state.setCouplesDB(couplesDB))
    );

    _subscriptions.add(
        _eventsRepository.events
            .listen((eventsDB) => _state.setEventsDB(eventsDB))
    );

    _subscriptions.add(
        _favoriteSchedulesRepository
            .getSelectedFavoriteScheduleStream(userUID: _userRepository.uid)
            .listen((favoriteSchedules) {
              if (favoriteSchedules.length > 2 || favoriteSchedules.isEmpty) return;
              _state.setFavoriteSchedules(favoriteSchedules);
              _state.setWeekNumber(_weekNumberRepository.getCurrentWeekNumber());
              _couplesRepository.loadCouples(_state.weekNumber, favoriteSchedules);
            }
        )
    );

    _subscriptions.add(_state.state.listen((event) =>
      _controller.add(_createWeekSchedule(event))
    ));

    _eventsRepository.getEventsByWeekNum(_state.weekNumber ?? WeekNumber.empty(), _userRepository.uid);
  }

  void changeWeek({WeekNumber? weekNumber}) {
    if (weekNumber == null) return;
    _state.setWeekNumber(weekNumber);
    _couplesRepository.loadCouples(weekNumber, _state.favoriteSchedules);
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

      bool isVPK = false;

      if (weekday != 7) {
        List<CoupleDB> couplesDB = state.couplesDB.where((coupleDB) => coupleDB.dateTimeEnd.weekday == weekday).toList();
        if (couplesDB.firstWhereOrNull((element) => element.isVPKPlaceHolder) == null) {
          couplesDB = couplesDB.where((element) => element.scheduleSubject.target?.isNotVPK ?? true).toList();
        } else if (couplesDB.firstWhereOrNull((element) => element.scheduleSubject.target?.isVPK ?? false) == null) {
          isVPK = true;
        }
        items.addAll(
            couplesDB
                .where((coupleDB) => coupleDB.dateTimeEnd.weekday == weekday && coupleDB.isNotEmpty && coupleDB.isNotVPKPlaceHolder)
                .map((coupleDB) => Couple.fromCoupleDB(coupleDB))
                .toList()
        );
      }

      items.sort((a, b) => a.dateTimeStart.compareTo(b.dateTimeStart));
      daySchedules.add(DaySchedule(items: items, isVPK: isVPK));
    }

    return WeekSchedule(weekNumber: state.weekNumber ?? WeekNumber.empty(), daySchedules: daySchedules);
  }

  void dispose() {
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
    _controller.close();
    _couplesRepository.dispose();
    _eventsRepository.dispose();
  }
}

