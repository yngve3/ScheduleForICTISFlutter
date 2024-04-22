import 'package:objectbox/objectbox.dart';
import 'package:schedule_for_ictis_flutter/data/models/week_schedule_db.dart';

@Entity()
class ScheduleSubject {
  @Id() int dbId;
  final String id;
  final String name;
  final bool isChosen;

  final bool isVPK;
  bool get isNotVPK => !isVPK;

  ScheduleSubject({
    this.dbId = 0,
    required this.id,
    required this.name,
    required this.isChosen,
    this.isVPK = false
  });

  factory ScheduleSubject.fromJson(Map<String, dynamic> json) =>
      ScheduleSubject(
        dbId: json['dbId'] as int,
        id: json['group'] as String,
        name: json['name'] as String,
        isChosen: json['isChosen'] as bool? ?? false,
        isVPK: (json['name'] as String).contains("ВПК")
      );

  ScheduleSubject copyWith({
    int? dbId,
    String? id,
    String? name,
    bool? isChosen,
    bool? isVPK
  }) =>
      ScheduleSubject(
        dbId: dbId ?? this.dbId,
        id: id ?? this.id,
        name: name ?? this.name,
        isChosen: isChosen ?? this.isChosen,
        isVPK: isVPK ?? this.isVPK
      );
}