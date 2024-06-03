import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/domain/interactors/favorite_schedule_interactor.dart';
import 'package:schedule_for_ictis_flutter/domain/models/schedule_subject/schedule_subject.dart';

import 'favorite_schedules_list_state.dart';

class FavoriteSchedulesListCubit extends Cubit<FavoriteSchedulesListState> {
  FavoriteSchedulesListCubit() : super(FavoriteSchedulesListState());

  final FavoriteSchedulesInteractor _interactor = FavoriteSchedulesInteractor();
  final List<int> deletionIdsList = [];

  late StreamSubscription<List<ScheduleSubject>> subscription;

  void getFavoriteSchedules() {
    subscription = _interactor.getFromDBAll().listen((favoriteSchedules) {
      final mainSchedules = favoriteSchedules.where((element) => element.isNotVPK).toList();
      final vpk = favoriteSchedules.where((element) => element.isVPK).toList();
      emit(FavoriteSchedulesListState(
        favoriteSchedules: mainSchedules,
        favoriteVPKs: vpk,
        isButtonSaveEnabled: favoriteSchedules.isNotEmpty
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
    emit(state.byScheduleSubject(list, scheduleSubject));
  }

  void delete(ScheduleSubject scheduleSubject) {
    final list = _getList(scheduleSubject);
    list.remove(scheduleSubject);
    deletionIdsList.add(scheduleSubject.dbId);
    emit(state.byScheduleSubject(list, scheduleSubject));
    emit(state.copyWith(isButtonSaveEnabled: !_isListsEmpty()));
  }

  void saveChanges() {
    _interactor.saveToDBMany([...state.favoriteVPKs, ...state.favoriteSchedules]);
    _interactor.deleteFromDBMany(deletionIdsList);
  }

  void _unselectSelected(List<ScheduleSubject> list) {
    final selected = _findSelectedOrNull(list);

    if (selected != null) {
      list[list.indexOf(selected)] = selected.copyWith(isChosen: false);
    }
  }

  ScheduleSubject? _findSelectedOrNull(List<ScheduleSubject> list) =>
    list.firstWhereOrNull((element) => element.isChosen);

  bool _isListsEmpty() => state.favoriteVPKs.isEmpty && state.favoriteSchedules.isEmpty;

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}