import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/favorite_schedules_repository.dart';
import 'package:schedule_for_ictis_flutter/domain/models/schedule_subject/schedule_subject.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/favorite_schedules/pages/favorite_schedules_add/cubit/schedule_search_state.dart';


class ScheduleSearchCubit extends Cubit<ScheduleSearchState> {
  ScheduleSearchCubit(this.repository) : super(const ScheduleSearchState(searchResult: []));
  final FavoriteSchedulesRepository repository;

  void search(String query) async {
    final searchResult = await repository.netSearch(query);

    emit(ScheduleSearchState(searchResult: searchResult));
  }

  void select(ScheduleSubject scheduleSubject) {
    final List<ScheduleSubject> list = [...state.searchResult];

    _unselectSelected(list);

    list[list.indexOf(scheduleSubject)] = scheduleSubject.copyWith(isChosen: true);
    emit(ScheduleSearchState(searchResult: list, isSaveButtonEnabled: true));
  }

  void saveSelectedToDB() {
    final selected = _findSelectedOrNull(state.searchResult);

    if (selected != null) {
      repository.saveToDB(selected.copyWith(isChosen: false));
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
