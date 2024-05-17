import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/domain/interactors/home_page_interactor.dart';

import 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(const HomePageState()) {
    subscriptions.add(_interactor.items.listen((items) {
      emit(state.copyWith(scheduleItems: items));
    }));

    subscriptions.add(_interactor.notes.listen((notes) {
      emit(state.copyWith(notes: notes));
    }));
  }
  List<StreamSubscription> subscriptions = [];
  final _interactor = HomePageInteractor();

  void update() {

  }

  @override
  Future<void> close() {
    for (var element in subscriptions) {
      element.cancel();
    }
    _interactor.dispose();
    return super.close();
  }
}
