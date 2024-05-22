import 'dart:async';
import 'dart:convert';

import 'package:schedule_for_ictis_flutter/domain/models/week_number/week_number.dart';
import 'package:schedule_for_ictis_flutter/main.dart';

import 'package:http/http.dart' as http;
import '../../app_config.dart';
import '../../domain/models/schedule_subject/schedule_subject.dart';
import '../../objectbox.g.dart';
import '../models/couple_db.dart';
import '../models/couples_mapper.dart';

class CouplesRepository {
  late Box<CoupleDB> _couplesBox;

  CouplesRepository() {
    _couplesBox = objectBox.store.box<CoupleDB>();
  }

  final _couplesController = StreamController<List<CoupleDB>>();
  Stream<List<CoupleDB>> get couples => _couplesController.stream;

  Future<List<CoupleDB>> getCouplesFromNet(ScheduleSubject scheduleSubject, WeekNumber? weekNumber) async {
    final id = scheduleSubject.id;
    final requestURL =
        '${AppConfig.baseURL}/'
        '?group=$id'
        '${weekNumber != null && weekNumber.studyWeekNumber != null ? '&week=${weekNumber.studyWeekNumber}' : ""}';

    try {
      final response = await http.get(Uri.parse(requestURL));

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);

        final couplesDB = CouplesMapper.fromJSON(
            json,
            weekNumber: weekNumber,
            scheduleSubject: scheduleSubject
        );

        return couplesDB;
      }
    } catch (e) {
      print(e);
    }

    return const [];
  }

  Future<void> loadCouplesFromNetToDB(ScheduleSubject scheduleSubject, WeekNumber? weekNumber) async {
    final id = scheduleSubject.id;
    final requestURL =
        '${AppConfig.baseURL}/'
        '?group=$id'
        '${weekNumber != null ? '&week=${weekNumber.studyWeekNumber}' : ""}';

    try {
      final response = await http.get(Uri.parse(requestURL));

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);

        final couplesDB = CouplesMapper.fromJSON(
          json,
          weekNumber: weekNumber,
          scheduleSubject: scheduleSubject
        );

        _couplesBox.putMany(couplesDB);
      }
    } catch (_) {

    }
  }

  CoupleDB? getCoupleByID(String id) {
    return _couplesBox
        .query(CoupleDB_.id.equals(id))
        .build()
        .findFirst();
  }

  void loadCouples(WeekNumber? weekNumber, List<ScheduleSubject> scheduleSubjects) {
    for (final scheduleSubject in scheduleSubjects) {
      loadCouplesFromNetToDB(scheduleSubject, weekNumber);
    }

    loadCouplesFromDB(weekNumber ?? WeekNumber.empty(), scheduleSubjects);
  }

  void loadCouplesFromDB(WeekNumber weekNumber, List<ScheduleSubject> scheduleSubjects) {
    final query = _getQuery(scheduleSubjects);
    query?.link(CoupleDB_.weekNumber, WeekNumber_.calendarWeekNumber.equals(weekNumber.calendarWeekNumber));
    query?.watch(triggerImmediately: true).forEach((event) => _couplesController.add(event.find()));
  }

  QueryBuilder<CoupleDB>? _getQuery(List<ScheduleSubject> scheduleSubjects) {
    if (scheduleSubjects.length == 1) {
      return _couplesBox.query(
          CoupleDB_.scheduleSubject.equals(scheduleSubjects[0].dbId)
      );
    } else if (scheduleSubjects.length == 2) {
      return _couplesBox.query(
          CoupleDB_.scheduleSubject.equals(scheduleSubjects[0].dbId)
              .or(CoupleDB_.scheduleSubject.equals(scheduleSubjects[1].dbId))
      );
    }

    return null;
  }

  void getCouplesAfter(DateTime dateTime, List<ScheduleSubject> scheduleSubjects) {
    if (_couplesBox.count(limit: 1) == 0) {
      for (final scheduleSubject in scheduleSubjects) {
        loadCouplesFromNetToDB(scheduleSubject, null);
      }
    }
    final query = _getQuery(scheduleSubjects);
    query?.watch(triggerImmediately: true).forEach((element) => _couplesController.add(element.find().where((element) => element.dateTimeEnd.isAfter(dateTime)).toList()));
  }

  void dispose() {
    _couplesController.close();
  }
}