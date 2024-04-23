import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/domain/interactors/home_page_interactor.dart';

import 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(const HomePageState());
  final HomePageInteractor _interactor = HomePageInteractor();

  void loadState() async {
    final items = await _interactor.getComingScheduleItems();
    final notes = _interactor.getComingNotes();
    final studyWeekNumber = _interactor.getCurrentStudyWeekNumber();

    emit(HomePageState(
      scheduleItems: items,
      notes: notes,
      studyWeekNumber: studyWeekNumber
    ));
  }
}
