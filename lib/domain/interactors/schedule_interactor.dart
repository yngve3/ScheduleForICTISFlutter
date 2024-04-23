import 'dart:async';

import 'package:collection/collection.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/couples_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/events_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/favorite_schedules_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/week_number_repository.dart';
import 'package:schedule_for_ictis_flutter/domain/models/schedule/day_schedule/day_schedule.dart';
import 'package:schedule_for_ictis_flutter/domain/models/week_number.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/time_of_day_ext.dart';

import '../../data/models/couple_db.dart';
import '../../data/models/event_db.dart';
import '../models/schedule/day_schedule_item.dart';
import '../models/schedule/week_schedule/week_schedule.dart';

class ScheduleInteractor {
  final CouplesRepository _couplesRepository = CouplesRepository();
  final FavoriteSchedulesRepository _favoriteSchedulesRepository = FavoriteSchedulesRepository();
  final EventsRepository _eventsRepository = EventsRepository();
  final WeekNumberRepository _weekNumberRepository = WeekNumberRepository();


  Future<void> loadSchedule(WeekNumber? weekNumber) async {
    weekNumber ??= _weekNumberRepository.getCurrentWeekNumber();
    final mainScheduleSubject = await _favoriteSchedulesRepository.getSelectedFavoriteSchedule();
    if (mainScheduleSubject != null) {
      await _couplesRepository.loadCouples(mainScheduleSubject, weekNumber);
    }
    final vpkScheduleSubject = await _favoriteSchedulesRepository.getSelectedFavoriteSchedule(isVPK: true);
    if (vpkScheduleSubject != null) {
      await _couplesRepository.loadCouples(vpkScheduleSubject, weekNumber);
    }
  }

  Future<Stream<WeekSchedule>> getWeekSchedule({WeekNumber? weekNumber}) async {
    await loadSchedule(weekNumber);

    weekNumber ??= _weekNumberRepository.getCurrentWeekNumber();
    if (weekNumber == null) return const Stream.empty();

    List<CoupleDB> mainCouplesDB = [];
    final mainScheduleSubject = await _favoriteSchedulesRepository.getSelectedFavoriteSchedule();
    if (mainScheduleSubject != null) {
       mainCouplesDB.addAll(_couplesRepository.getCouples(weekNumber, mainScheduleSubject));
    }

    List<CoupleDB> vpkCouplesDB = [];
    final vpkScheduleSubject = await _favoriteSchedulesRepository.getSelectedFavoriteSchedule(isVPK: true);
    if (vpkScheduleSubject != null) {
      if (mainCouplesDB.isEmpty || _containsVPKPlaceHolder(mainCouplesDB)) {
        vpkCouplesDB.addAll(_couplesRepository.getCouples(weekNumber, vpkScheduleSubject));
      }
    }

    final eventsDBStream = _eventsRepository.getEventsByWeekNum(weekNumber);
    return eventsDBStream.map((eventsDB) => _createWeekSchedule(eventsDB: eventsDB, mainCouplesDB: mainCouplesDB, weekNumber: weekNumber, vpkCouplesDB: vpkCouplesDB));
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

        items.addAll(
            vpkCouplesDB
                .where((coupleDB) => coupleDB.dateTimeEnd.weekday == weekday && coupleDB.isNotEmpty)
                .map((coupleDB) => Couple.fromCoupleDB(coupleDB))
                .toList()
        );

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

