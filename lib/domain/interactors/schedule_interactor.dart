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

class ScheduleInteractor {
  final CouplesRepository _couplesRepository = CouplesRepository();
  final FavoriteSchedulesRepository _favoriteSchedulesRepository = FavoriteSchedulesRepository();
  final EventsRepository _eventsRepository = EventsRepository();
  final WeekNumberRepository _weekNumberRepository = WeekNumberRepository();
  final UserRepository _userRepository = UserRepository();

  final _controller = StreamController<WeekSchedule>();

  Stream<WeekSchedule> get weekSchedule => _controller.stream;


  Future<void> loadSchedule(WeekNumber? weekNumber) async {
    weekNumber ??= _weekNumberRepository.getCurrentWeekNumber();
    final mainScheduleSubject = await _favoriteSchedulesRepository.getSelectedFavoriteSchedule(userUID: _userRepository.uid);
    if (mainScheduleSubject != null) {
      await _couplesRepository.loadCouples(mainScheduleSubject, weekNumber);
    }
    final vpkScheduleSubject = await _favoriteSchedulesRepository.getSelectedFavoriteSchedule(isVPK: true, userUID: _userRepository.uid);
    if (vpkScheduleSubject != null) {
      await _couplesRepository.loadCouples(vpkScheduleSubject, weekNumber);
    }
  }

  Future<void> getWeekSchedule({WeekNumber? weekNumber}) async {
    loadSchedule(weekNumber);

    weekNumber ??= _weekNumberRepository.getCurrentWeekNumber();
    if (weekNumber == null) return _controller.add(WeekSchedule.empty());

    List<Stream<Object>> streams = [];

    streams.add(_eventsRepository.getEventsByWeekNum(weekNumber, _userRepository.uid));

    final mainScheduleSubject = await _favoriteSchedulesRepository.getSelectedFavoriteSchedule(userUID: _userRepository.uid);
    if (mainScheduleSubject != null) {
      streams.add(_couplesRepository.getCouples(weekNumber, mainScheduleSubject));
    }
    final vpkScheduleSubject = await _favoriteSchedulesRepository.getSelectedFavoriteSchedule(isVPK: true, userUID: _userRepository.uid);
    if (vpkScheduleSubject != null) {
      streams.add(_couplesRepository.getCouples(weekNumber, vpkScheduleSubject));
    }

    combineLatest(streams).map((data) => _create(data: data, weekNumber: weekNumber)).listen((event) {
      _controller.add(event);
    });
  }

  Stream<List> combineLatest(Iterable<Stream<Object>> streams) {
    final Stream<Object> first = streams.first.cast<Object>();
    final List<Stream<Object>> others = [...streams.skip(1)];
    return first.combineLatestAll(others);
  }

  WeekSchedule _create({required List<dynamic> data, WeekNumber? weekNumber}) {
    List<EventDB> eventsDB = [];
    List<CoupleDB> mainCouplesDB = [];
    List<CoupleDB> vpkCouplesDB = [];

    if (data.isNotEmpty) {
      eventsDB = data[0];
      if (data.length > 1) {
        mainCouplesDB = data[1];
        if (data.length == 3) {
          vpkCouplesDB = data[2];
        }
      }
    }

    return _createWeekSchedule(eventsDB: eventsDB, mainCouplesDB: mainCouplesDB, vpkCouplesDB: vpkCouplesDB, weekNumber: weekNumber);
  }

  WeekSchedule _createWeekSchedule({
    required List<EventDB> eventsDB,
    required List<CoupleDB> mainCouplesDB,
    required List<CoupleDB> vpkCouplesDB,
    WeekNumber? weekNumber
  }) {
    List<DaySchedule> daySchedules = [];
    for (int weekday = 1; weekday <= 7; weekday++) {
      List<DayScheduleItem> items = [];
      items.addAll(
          eventsDB
              .where((eventDB) => eventDB.dateTimeEnd.weekday == weekday)
              .map((eventDB) => Event.fromEventDB(eventDB))
              .toList()
      );
      bool isVPK = false;

      if (weekday != 7) {
        final couplesDBByWeekDay = mainCouplesDB
            .where((coupleDB) => coupleDB.dateTimeEnd.weekday == weekday).toList();

        items.addAll(
                couplesDBByWeekDay
                .where((coupleDB) => coupleDB.isNotEmpty && coupleDB.isNotVPKPlaceHolder)
                .map((coupleDB) => Couple.fromCoupleDB(coupleDB))
                .toList()
        );
        if (_containsVPKPlaceHolder(couplesDBByWeekDay) && vpkCouplesDB.isNotEmpty) {
          items.addAll(
            vpkCouplesDB
                .where((coupleDB) => coupleDB.dateTimeEnd.weekday == weekday && coupleDB.isNotEmpty)
                .map((coupleDB) => Couple.fromCoupleDB(coupleDB))
                .toList()
          );
        }

        isVPK = vpkCouplesDB.isEmpty && _containsVPKPlaceHolder(couplesDBByWeekDay);
      }

      items.sort((a, b) => a.dateTimeStart.compareTo(b.dateTimeStart));

      daySchedules.add(DaySchedule(items: items, isVPK: isVPK));
    }

    return WeekSchedule(weekNumber: weekNumber ?? WeekNumber.empty(), daySchedules: daySchedules);
  }

  bool _containsVPKPlaceHolder(List<CoupleDB> couplesDB) {
    return couplesDB.firstWhereOrNull((coupleDB) => coupleDB.isVPKPlaceHolder) != null;
  }
}

