import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/domain/interactors/favorite_schedule_interactor.dart';
import 'package:schedule_for_ictis_flutter/domain/models/schedule_subject/schedule_subject.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/favorite_schedules/pages/favorite_schedules_add/cubit/favorite_schedules_add_state.dart';

import '../../../../search_schedule_screen/cubit/search_schedule_state.dart';


class FavoriteSchedulesAddCubit extends Cubit<FavoriteScheduleAddState> {
  FavoriteSchedulesAddCubit() : super(const FavoriteScheduleAddState());
  final FavoriteSchedulesInteractor _interactor = FavoriteSchedulesInteractor();

  void changeCategory(SearchCategory category) {
    final filteredList = _filter(state.searchResults, category);
    emit(state.copyWith(category: category, filteredSearchResult: filteredList));
  }

  void search(String query) {
    EasyDebounce.debounce("search_schedule", const Duration(milliseconds: 1000), () async {
      final result = await _interactor.netSearch(query.trim());
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

  void select(ScheduleSubject scheduleSubject) {
    final List<ScheduleSubject> list = [...state.filteredSearchResult];

    _unselectSelected(list);

    list[list.indexOf(scheduleSubject)] = scheduleSubject.copyWith(isChosen: true);
    emit(FavoriteScheduleAddState(filteredSearchResult: list, isSaveButtonEnabled: true));
  }

  void saveSelectedToDB() {
    final selected = _findSelectedOrNull(state.filteredSearchResult);

    if (selected != null) {
      _interactor.saveToDB(selected.copyWith(isChosen: false));
    }
  }

  void _unselectSelected(List<ScheduleSubject> list) {
    final selected = _findSelectedOrNull(list);

    if (selected != null) {
      list[list.indexOf(selected)] = selected.copyWith(isChosen: false);
    }
  }

  ScheduleSubject? _findSelectedOrNull(List<ScheduleSubject> list) {
    return list.firstWhereOrNull((element) => element.isChosen);
  }
}
