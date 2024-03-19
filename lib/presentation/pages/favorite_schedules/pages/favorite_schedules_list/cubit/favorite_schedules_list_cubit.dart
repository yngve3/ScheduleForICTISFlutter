import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/domain/models/schedule_subject/schedule_subject.dart';
import 'package:collection/collection.dart';

import '../../../../../../data/repositories/favorite_schedules_repository.dart';
import 'favorite_schedules_list_state.dart';

class FavoriteSchedulesListCubit extends Cubit<FavoriteSchedulesListState> {
  FavoriteSchedulesListCubit() : super(const FavoriteSchedulesListState(favoriteSchedules: []));

  final FavoriteSchedulesRepository _repository = FavoriteSchedulesRepository();
  List<int> deletionIdsList = [];

  void getFavoriteSchedules() {
    _repository.getFromDBAll().listen((favoriteSchedules) {
      emit(FavoriteSchedulesListState(favoriteSchedules: favoriteSchedules));
    });
  }

  void select(ScheduleSubject scheduleSubject) {
    final List<ScheduleSubject> list = [...state.favoriteSchedules];

    _unselectSelected(list);

    list[list.indexOf(scheduleSubject)] = scheduleSubject.copyWith(isChosen: true);
    emit(FavoriteSchedulesListState(favoriteSchedules: list));
  }

  void delete(ScheduleSubject scheduleSubject) {
    final List<ScheduleSubject> list = [...state.favoriteSchedules];
    list.remove(scheduleSubject);
    deletionIdsList.add(scheduleSubject.dbId!);
    emit(FavoriteSchedulesListState(favoriteSchedules: list));
  }

  void saveChanges() {
    _repository.saveToDBMany(state.favoriteSchedules);
    _repository.deleteFromDBMany(deletionIdsList);
  }

  void _unselectSelected(List<ScheduleSubject> list) {
    final selected = _findSelectedOrNull(list);

    if (selected != null) {
      list[list.indexOf(selected)] = selected.copyWith(isChosen: false);
    }
  }

  ScheduleSubject? _findSelectedOrNull(List<ScheduleSubject> list) =>
    list.firstWhereOrNull((element) => element.isChosen);
}