import 'package:objectbox/objectbox.dart';
import 'package:schedule_for_ictis_flutter/data/models/week_schedule_db.dart';

@Entity()
class ScheduleSubject {
  @Id() int? dbId;
  final String id;
  final String name;
  final bool isChosen;
  @Backlink("scheduleSubject")
  final weekSchedules = ToMany<WeekScheduleDB>();

  ScheduleSubject({
    this.dbId = 0,
    required this.id,
    required this.name,
    required this.isChosen
  });

  factory ScheduleSubject.fromJson(Map<String, dynamic> json) =>
      ScheduleSubject(
        dbId: json['dbId'] as int?,
        id: json['group'] as String,
        name: json['name'] as String,
        isChosen: json['isChosen'] as bool? ?? false,
      );

  ScheduleSubject copyWith({
    int? dbId,
    String? id,
    String? name,
    bool? isChosen
  }) =>
      ScheduleSubject(
        dbId: dbId ?? this.dbId,
        id: id ?? this.id,
        name: name ?? this.name,
        isChosen: isChosen ?? this.isChosen
      );
}