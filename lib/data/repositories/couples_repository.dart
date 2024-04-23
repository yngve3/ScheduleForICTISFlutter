import 'dart:convert';

import 'package:schedule_for_ictis_flutter/data/repositories/week_number_repository.dart';
import 'package:schedule_for_ictis_flutter/domain/models/schedule/week_schedule/week_schedule.dart';
import 'package:schedule_for_ictis_flutter/domain/models/week_number.dart';
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

  Future<WeekNumber?> loadCouples(ScheduleSubject scheduleSubject, WeekNumber? weekNumber) async {
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

        return couplesDB[0].weekNumber.target!;
      }
    } catch (e) {
      print(e);
    }

    return null;
  }

  Future<CoupleDB?> getCoupleByID(String id) {
    return _couplesBox
        .query(CoupleDB_.id.equals(id))
        .build()
        .findFirstAsync();
  }

  List<CoupleDB> getCouples(WeekNumber weekNumber, ScheduleSubject scheduleSubject) {
    final query = _couplesBox.query(
        CoupleDB_.scheduleSubject.equals(scheduleSubject.dbId)
            .and(CoupleDB_.weekNumber.equals(weekNumber.id))
    );

    return query.build().find();
  }

  List<CoupleDB> getCouplesAfter(DateTime dateTime, ScheduleSubject scheduleSubject) {
    final query = _couplesBox.query(
        CoupleDB_.scheduleSubject.equals(scheduleSubject.dbId)
            .and(CoupleDB_.dateTimeEnd.greaterOrEqualDate(dateTime))
    );

    return query.build().find();
  }

  List<CoupleDB> getAll() {
    return _couplesBox.getAll();
  }
}