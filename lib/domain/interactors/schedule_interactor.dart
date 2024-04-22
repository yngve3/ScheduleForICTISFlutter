import 'dart:async';

import 'package:schedule_for_ictis_flutter/data/repositories/couples_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/events_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/favorite_schedules_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/week_number_repository.dart';
import 'package:schedule_for_ictis_flutter/domain/models/schedule/day_schedule/day_schedule.dart';
import 'package:schedule_for_ictis_flutter/domain/models/week_number.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/date_time_ext.dart';

import '../../data/models/couple_db.dart';
import '../../data/models/event_db.dart';
import '../models/schedule/day_schedule_item.dart';
import '../models/schedule/week_schedule/week_schedule.dart';

class ScheduleInteractor {
  final CouplesRepository _couplesRepository = CouplesRepository();
  final FavoriteSchedulesRepository _favoriteSchedulesRepository = FavoriteSchedulesRepository();
  final EventsRepository _eventsRepository = EventsRepository();
  final WeekNumberRepository _weekNumberRepository = WeekNumberRepository();


  void loadSchedule(WeekNumber? weekNumber) async {
    final mainScheduleSubject = await _favoriteSchedulesRepository.getSelectedFavoriteSchedule();
    if (mainScheduleSubject != null) {
      _couplesRepository.loadCouples(mainScheduleSubject, weekNumber);
    }
    final vpkScheduleSubject = await _favoriteSchedulesRepository.getSelectedFavoriteSchedule(isVPK: true);
    if (vpkScheduleSubject != null) {
      _couplesRepository.loadCouples(vpkScheduleSubject, weekNumber);
    }
  }

  Future<Stream<WeekSchedule>> getWeekSchedule({WeekNumber? weekNumber}) async {
    List<CoupleDB> couplesDB = [];

    weekNumber ??= _weekNumberRepository.getCurrentWeekNumber();
    final mainScheduleSubject = await _favoriteSchedulesRepository.getSelectedFavoriteSchedule();
    if (mainScheduleSubject != null) {
       couplesDB.addAll(_couplesRepository.getCouples(weekNumber!, mainScheduleSubject));
    }
    
    final vpkScheduleSubject = await _favoriteSchedulesRepository.getSelectedFavoriteSchedule(isVPK: true);
    if (vpkScheduleSubject != null) {
      couplesDB.addAll(_couplesRepository.getCouples(weekNumber!, vpkScheduleSubject));
    }
    
    final eventsDBStream = _eventsRepository.getEventsByWeekNum(weekNumber!);
    
    return eventsDBStream.map((eventsDB) => _createWeekSchedule(eventsDB: eventsDB, couplesDB: couplesDB));
  }

  WeekSchedule _createWeekSchedule({
    required List<EventDB> eventsDB,
    required List<CoupleDB> couplesDB
  }) {
    List<DaySchedule> daySchedules = [];
    for (int weekday = 1; weekday <= 7; weekday++) {
      List<DayScheduleItem> items = [];
      items.addAll(eventsDB.where((eventDB) => eventDB.date.weekNumber == weekday).map((eventDB) => Event.fromEventDB(eventDB)).toList());
    }
  }
}