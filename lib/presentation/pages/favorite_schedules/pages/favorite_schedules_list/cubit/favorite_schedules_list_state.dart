import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../domain/models/schedule_subject/schedule_subject.dart';

part 'favorite_schedules_list_state.freezed.dart';

@freezed
class FavoriteSchedulesListState with _$FavoriteSchedulesListState {
  FavoriteSchedulesListState._();
  factory FavoriteSchedulesListState({
    @Default([]) List<ScheduleSubject> favoriteSchedules,
    @Default([]) List<ScheduleSubject> favoriteVPKs,
    @Default(false) isButtonSaveEnabled
  }) = _FavoriteSchedulesListState;

  byScheduleSubject(List<ScheduleSubject> subjects) {
    if (subjects.isEmpty) return FavoriteSchedulesListState();

    if (subjects[0].isVPK) {
      return copyWith(favoriteVPKs: subjects);
    } else {
      return copyWith(favoriteSchedules: subjects);
    }
  }
}
