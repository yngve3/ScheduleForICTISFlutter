import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:schedule_for_ictis_flutter/domain/models/schedule_subject/schedule_subject.dart';

import '../../../../search_schedule_screen/cubit/search_schedule_state.dart';

part 'favorite_schedules_add_state.freezed.dart';

@freezed
class FavoriteScheduleAddState with _$FavoriteScheduleAddState {
  const factory FavoriteScheduleAddState({
    @Default([]) List<ScheduleSubject> searchResults,
    @Default([]) List<ScheduleSubject> filteredSearchResult,
    @Default(SearchCategory.all) SearchCategory category,
    @Default("") String query,
    @Default(false) bool isSaveButtonEnabled
  }) = _FavoriteScheduleAddState;
}
