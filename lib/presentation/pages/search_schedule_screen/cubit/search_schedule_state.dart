import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/schedule_subject/schedule_subject.dart';

part 'search_schedule_state.freezed.dart';

@freezed
class SearchScheduleState with _$SearchScheduleState {
  const factory SearchScheduleState({
    @Default([]) List<ScheduleSubject> searchResults,
  }) = _SearchScheduleState;
}
