import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:schedule_for_ictis_flutter/app_config.dart';
import 'package:schedule_for_ictis_flutter/domain/models/schedule/schedule.dart';
import 'package:schedule_for_ictis_flutter/domain/models/schedule_subject/schedule_subject.dart';

import '../../objectbox.g.dart';

class ScheduleRepository {

  late final Box<WeekSchedule> _scheduleBox;

  Future<WeekSchedule> getWeekSchedule(ScheduleSubject scheduleSubject, {int? weekNum}) async {
    final id = scheduleSubject.id;
    final requestURL =
        '${AppConfig.baseURL}/'
        '?group=$id'
        '${weekNum != null ? '&week=$weekNum' : ""}';

    final response = await http.get(Uri.parse(requestURL));

    final Map<String, dynamic> json = jsonDecode(response.body);

    return WeekSchedule.fromJson(json, scheduleSubject);
  }

  void addSchedule(WeekSchedule weekSchedule) {
    _scheduleBox.putAsync(weekSchedule);
  }

  WeekSchedule? getSchedule() {
    return _scheduleBox.query(WeekSchedule_.weekNum.equals(7)).build().findFirst();
  }

}
