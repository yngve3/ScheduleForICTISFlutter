// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleSubjectImpl _$$ScheduleSubjectImplFromJson(
        Map<String, dynamic> json) =>
    _$ScheduleSubjectImpl(
      dbId: json['dbId'] as int?,
      id: json['group'] as String,
      name: json['name'] as String,
      isChosen: json['isChosen'] as bool? ?? false,
    );

Map<String, dynamic> _$$ScheduleSubjectImplToJson(
        _$ScheduleSubjectImpl instance) =>
    <String, dynamic>{
      'dbId': instance.dbId,
      'group': instance.id,
      'name': instance.name,
      'isChosen': instance.isChosen,
    };
