import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../domain/models/schedule_subject/schedule_subject.dart';

part 'favorite_schedules_list_state.freezed.dart';

@freezed
class FavoriteSchedulesListState with _$FavoriteSchedulesListState {
  const factory FavoriteSchedulesListState({
    required List<ScheduleSubject> favoriteSchedules
  }) = _FavoriteSchedulesListState;

}
