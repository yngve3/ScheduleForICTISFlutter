import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:schedule_for_ictis_flutter/domain/models/schedule_subject/schedule_subject.dart';

part 'schedule_search_state.freezed.dart';

@freezed
class ScheduleSearchState with _$ScheduleSearchState {
  const factory ScheduleSearchState({
    required List<ScheduleSubject> searchResult,
    @Default(false) bool isSaveButtonEnabled
  }) = _ScheduleSearchState;
}
