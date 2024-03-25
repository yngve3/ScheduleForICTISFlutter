import '../../domain/models/schedule_subject/schedule_subject.dart';
import 'package:objectbox/objectbox.dart';
import 'day_schedule_db.dart';

@Entity()
class WeekScheduleDB {
  @Id() int weekNum;
  final scheduleSubject = ToOne<ScheduleSubject>();

  @Backlink('weekSchedule')
  final daySchedules = ToMany<DayScheduleDB>();

  WeekScheduleDB({required this.weekNum});

  factory WeekScheduleDB.empty() {
    return WeekScheduleDB(weekNum: 1);
  }

  factory WeekScheduleDB.fromJson(Map<String, dynamic> json, ScheduleSubject scheduleSubject) {
    json = json['table'];
    final weekSchedule = WeekScheduleDB(weekNum: json['week']);
    final List<dynamic> table = json['table'];

    weekSchedule.daySchedules.addAll(
        table.skip(2).map((e) => DayScheduleDB.fromJson(e)).toList()
    );

    weekSchedule.scheduleSubject.target = scheduleSubject;

    return weekSchedule;
  }
}