import 'package:intl/intl.dart';
import 'package:objectbox/objectbox.dart';
import 'package:schedule_for_ictis_flutter/domain/models/schedule_subject/schedule_subject.dart';

import '../couple/couple.dart';

@Entity()
class WeekSchedule {
  @Id() int id = 0;
  final int weekNum;
  final scheduleSubject = ToOne<ScheduleSubject>();

  @Backlink('weekSchedule')
  final daySchedules = ToMany<DaySchedule>();

  WeekSchedule({required this.weekNum});

  factory WeekSchedule.empty() {
    return WeekSchedule(weekNum: 1);
  }

  factory WeekSchedule.fromJson(Map<String, dynamic> json, ScheduleSubject scheduleSubject) {
    json = json['table'];
    final weekSchedule = WeekSchedule(weekNum: json['week']);
    final List<dynamic> table = json['table'];

    weekSchedule.daySchedules.addAll(
        table.skip(2).map((e) => DaySchedule.fromJson(e)).toList()
    );

    weekSchedule.scheduleSubject.target = scheduleSubject;
    
    return weekSchedule;
  }
}

@Entity()
class DaySchedule {
  @Id() int id = 0;
  @Property(type: PropertyType.date)
  final DateTime date;
  @Backlink('daySchedule')
  final couples = ToMany<Couple>();
  final weekSchedule = ToOne<WeekSchedule>();

  DaySchedule({required this.date});
  
  factory DaySchedule.fromJson(List<dynamic> json) {
    // На сервере дата представлена так: Пнд, 18 марта,
    // Чтобы парсинг сработал день должно быть так: Пн, 18 марта,
    // То есть день недели должен быть из двух символов
    final dateStr = json[0].substring(0, 2) + json[0].substring(3);
    final date = DateFormat("EEEE, d MMM", 'ru_RU').parseLoose(dateStr);

    final daySchedule = DaySchedule(date: date);
    daySchedule.couples.addAll(
      List<Couple>.from(
          json.skip(1).map((e) => Couple.fromString(e))
      )
    );

    return daySchedule;
  }
}