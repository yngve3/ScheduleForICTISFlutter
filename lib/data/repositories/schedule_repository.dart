import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:schedule_for_ictis_flutter/app_config.dart';
import 'package:schedule_for_ictis_flutter/domain/models/schedule_subject/schedule_subject.dart';
import 'package:schedule_for_ictis_flutter/domain/models/week_number.dart';
import 'package:schedule_for_ictis_flutter/main.dart';

import '../../objectbox.g.dart';
import '../models/week_schedule_db.dart';

class StudyWeekNotYetExistException implements Exception {}

class ScheduleRepository {

  late final Box<WeekScheduleDB> _scheduleBox;

  ScheduleRepository() {
    _scheduleBox = objectBox.store.box<WeekScheduleDB>();
  }

  Future<void> loadWeekSchedules(List<ScheduleSubject> scheduleSubjects, WeekNumber? weekNumber) async {
    for (final scheduleSubject in scheduleSubjects) {
      loadWeekSchedule(scheduleSubject, weekNumber);
    }
  }

  Future<void> loadWeekSchedule(ScheduleSubject scheduleSubject, WeekNumber? weekNumber) async {
    final id = scheduleSubject.id;
    final requestURL =
        '${AppConfig.baseURL}/'
        '?group=$id'
        '${weekNumber != null ? '&week=${weekNumber.studyWeekNumber}' : ""}';

    try {
      final response = await http.get(Uri.parse(requestURL));

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);

        final weekSchedule = WeekScheduleDB.fromJson(
          json,
          scheduleSubject,
          weekNumber
        );

        insertWeekSchedule(weekSchedule);
      }
    } catch (_) {

    }
  }

  Future<List<WeekScheduleDB>> getWeekSchedules(List<ScheduleSubject> scheduleSubjects, int calendarWeekNumber) async {
    List<WeekScheduleDB> list = [];
    for (final scheduleSubject in scheduleSubjects) {
      final weekSchedule = await getWeekSchedule(scheduleSubject, calendarWeekNumber);
      if (weekSchedule != null) list.add(weekSchedule);
    }

    return list;
  }

  Future<WeekScheduleDB?> getWeekSchedule(ScheduleSubject scheduleSubject, int calendarWeekNumber) =>
    _scheduleBox
        .query(
          WeekScheduleDB_.calendarWeekNumber.equals(calendarWeekNumber)
          .and(WeekScheduleDB_.scheduleSubject.equals(scheduleSubject.dbId!))
        )
        .build()
        .findFirstAsync();


  void insertWeekSchedule(WeekScheduleDB weekSchedule) {
    _scheduleBox.put(weekSchedule);
  }
}
