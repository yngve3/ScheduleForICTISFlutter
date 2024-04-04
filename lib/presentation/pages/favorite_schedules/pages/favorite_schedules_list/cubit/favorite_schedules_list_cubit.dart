import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/domain/models/schedule_subject/schedule_subject.dart';
import 'package:collection/collection.dart';

import '../../../../../../data/repositories/favorite_schedules_repository.dart';
import 'favorite_schedules_list_state.dart';

class FavoriteSchedulesListCubit extends Cubit<FavoriteSchedulesListState> {
  FavoriteSchedulesListCubit(this.repository) : super(FavoriteSchedulesListState());

  final FavoriteSchedulesRepository repository;
  List<int> deletionIdsList = [];

  late StreamSubscription<List<ScheduleSubject>> subscription;

  void getFavoriteSchedules() {
    subscription = repository.getFromDBAll().listen((favoriteSchedules) {
      final mainSchedules = favoriteSchedules.where((element) => element.isNotVPK).toList();
      final vpk = favoriteSchedules.where((element) => element.isVPK).toList();
      emit(FavoriteSchedulesListState(
        favoriteSchedules: mainSchedules,
        favoriteVPKs: vpk,
      ));
    });
  }

  List<ScheduleSubject> _getList(ScheduleSubject scheduleSubject) =>
      scheduleSubject.isVPK
          ? [...state.favoriteVPKs]
          : [...state.favoriteSchedules];

  void select(ScheduleSubject scheduleSubject) {
    final list = _getList(scheduleSubject);
    _unselectSelected(list);

    list[list.indexOf(scheduleSubject)] = scheduleSubject.copyWith(isChosen: true);
    emit(state.byScheduleSubject(list));
  }

  void delete(ScheduleSubject scheduleSubject) {
    final list = _getList(scheduleSubject);
    list.remove(scheduleSubject);
    deletionIdsList.add(scheduleSubject.dbId!);
    emit(state.byScheduleSubject(list));
  }

  void saveChanges() {
    repository.saveToDBMany([...state.favoriteVPKs, ...state.favoriteSchedules]);
    repository.deleteFromDBMany(deletionIdsList);
  }

  void _unselectSelected(List<ScheduleSubject> list) {
    final selected = _findSelectedOrNull(list);

    if (selected != null) {
      list[list.indexOf(selected)] = selected.copyWith(isChosen: false);
    }
  }

  ScheduleSubject? _findSelectedOrNull(List<ScheduleSubject> list) =>
    list.firstWhereOrNull((element) => element.isChosen);

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}