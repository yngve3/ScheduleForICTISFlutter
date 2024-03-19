import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';
part 'schedule_subject.freezed.dart';
part 'schedule_subject.g.dart';

@freezed
class ScheduleSubject with _$ScheduleSubject {
  @Entity(realClass: ScheduleSubject)
  factory ScheduleSubject({
    @Id(assignable: true) int? dbId,
    @JsonKey(name: "group")
    required String id,

    required String name,

    @Default(false)
    bool isChosen
  }) = _ScheduleSubject;

  factory ScheduleSubject.fromJson(Map<String, dynamic> json) => _$ScheduleSubjectFromJson(json);
}