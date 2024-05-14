import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/favorite_schedules_repository.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/search_schedule_screen/cubit/search_schedule_state.dart';

import '../../../../domain/models/schedule_subject/schedule_subject.dart';

class SearchScheduleCubit extends Cubit<SearchScheduleState> {
  SearchScheduleCubit() : super(const SearchScheduleState());
  final _repository = FavoriteSchedulesRepository();

  void changeCategory(SearchCategory category) {
    final filteredList = _filter(state.searchResults, category);
    emit(state.copyWith(category: category, filteredSearchResult: filteredList));
  }

  void search(String query) {
    EasyDebounce.debounce("search_schedule", const Duration(milliseconds: 1000), () async {
      final result = await _repository.netSearch(query.trim());
      final filteredList = _filter(result, state.category);
      emit(state.copyWith(searchResults: result, filteredSearchResult: filteredList, query: query));
    });
  }

  List<ScheduleSubject> _filter(List<ScheduleSubject> source, SearchCategory category) =>
      switch(category) {
        SearchCategory.all => source,
        SearchCategory.audiences => source.where((element) => element.isAudience).toList(),
        SearchCategory.lectors => source.where((element) => element.isLector).toList(),
        SearchCategory.groups => source.where((element) => element.isGroup && element.isNotVPK).toList(),
        SearchCategory.vpks => source.where((element) => element.isVPK).toList()
     };
}
