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

  final _couplesByWeekNumController = StreamController<List<CoupleDB>>();
  Stream<List<CoupleDB>> get couplesByWeekNum => _couplesByWeekNumController.stream;

  Future<void> loadCouplesFromNet(ScheduleSubject scheduleSubject, WeekNumber? weekNumber) async {
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
    } catch (e) {
      print(e);
    }
  }

  Future<CoupleDB?> getCoupleByID(String id) {
    return _couplesBox
        .query(CoupleDB_.id.equals(id))
        .build()
        .findFirstAsync();
  }

  void loadCouples(WeekNumber weekNumber, List<ScheduleSubject> scheduleSubjects) async {
    for (final scheduleSubject in scheduleSubjects) {
      await loadCouplesFromNet(scheduleSubject, weekNumber);
    }
    loadCouplesFromDB(weekNumber, scheduleSubjects);
  }

  void loadCouplesFromDB(WeekNumber weekNumber, List<ScheduleSubject> scheduleSubjects) {
    final query = _getQuery(weekNumber, scheduleSubjects);
    query?.link(CoupleDB_.weekNumber, WeekNumber_.calendarWeekNumber.equals(weekNumber.calendarWeekNumber));
    query?.watch(triggerImmediately: true).forEach((event) => _couplesByWeekNumController.add(event.find()));
  }

  QueryBuilder<CoupleDB>? _getQuery(WeekNumber weekNumber, List<ScheduleSubject> scheduleSubjects) {
    if (scheduleSubjects.length == 1) {
      return _couplesBox.query(
          CoupleDB_.scheduleSubject.equals(scheduleSubjects[0].dbId)
      );
    } else if (scheduleSubjects.length == 2) {
      return _couplesBox.query(
          CoupleDB_.scheduleSubject.equals(scheduleSubjects[0].dbId).or(CoupleDB_.scheduleSubject.equals(scheduleSubjects[1].dbId))
      );
    }

    return null;
  }

  List<CoupleDB> getCouplesAfter(DateTime dateTime, ScheduleSubject scheduleSubject) {
    final query = _couplesBox.query(
        CoupleDB_.scheduleSubject.equals(scheduleSubject.dbId)
            .and(CoupleDB_.dateTimeEnd.greaterOrEqualDate(dateTime))
    );

    return query.build().find();
  }

  void dispose() {
    _couplesByWeekNumController.close();
  }
}