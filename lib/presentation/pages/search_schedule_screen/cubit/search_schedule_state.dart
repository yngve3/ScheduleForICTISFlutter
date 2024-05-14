import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/schedule_subject/schedule_subject.dart';

part 'search_schedule_state.freezed.dart';

@freezed
class SearchScheduleState with _$SearchScheduleState {
  const factory SearchScheduleState({
    @Default([]) List<ScheduleSubject> searchResults,
    @Default([]) List<ScheduleSubject> filteredSearchResult,
    @Default(SearchCategory.all) SearchCategory category,
    @Default("") String query
  }) = _SearchScheduleState;
}

enum SearchCategory {
  all,
  groups,
  vpks,
  lectors,
  audiences
}
