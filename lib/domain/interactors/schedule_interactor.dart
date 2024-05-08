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
  List<StreamSubscription> subscriptions = [];

  ScheduleInteractorState state = ScheduleInteractorState();
  List<ScheduleSubject> favoriteSchedules = [];
  WeekNumber? weekNumber;

  ScheduleInteractor() {
    weekNumber = _weekNumberRepository.getCurrentWeekNumber();
    subscriptions.add(
        _couplesRepository.couplesByWeekNum
            .listen((couplesDB) => state.setCouplesDB(couplesDB))
    );

    subscriptions.add(
        _eventsRepository.getEventsByWeekNum(weekNumber ?? WeekNumber.empty(), _userRepository.uid)
            .listen((eventsDB) => state.setEventsDB(eventsDB))
    );

    subscriptions.add(
        _favoriteSchedulesRepository
            .getSelectedFavoriteScheduleStream(userUID: _userRepository.uid)
            .listen((favoriteSchedules) {
              if (favoriteSchedules.length > 2 || favoriteSchedules.isEmpty) return;
              this.favoriteSchedules = favoriteSchedules;
              for (final scheduleSubject in favoriteSchedules) {
                _couplesRepository.loadCouplesFromNet(scheduleSubject, weekNumber);
              }
              weekNumber = _weekNumberRepository.getCurrentWeekNumber();
              _couplesRepository.loadCouplesFromDB(weekNumber!, favoriteSchedules);
            }
        )
    );

    subscriptions.add(state.state.listen((event) =>
      _controller.add(_createWeekSchedule(event))
    ));
  }

  void changeWeek(WeekNumber weekNumber) {
    this.weekNumber = weekNumber;
    _couplesRepository.loadCouples(this.weekNumber!, favoriteSchedules);
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

    return WeekSchedule(weekNumber: weekNumber!, daySchedules: daySchedules);
  }

  void dispose() {
    for (final subscription in subscriptions) {
      subscription.cancel();
    }
    _controller.close();
    _couplesRepository.dispose();
  }
}

