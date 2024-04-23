import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/events_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/notes_repository.dart';

import '../../../../domain/models/schedule/day_schedule_item.dart';
import 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(const HomePageState());
  final _eventsRepository = EventsRepository();

  final _notesRepository = NotesRepository();

  void loadState() {
    final events = _eventsRepository.getEventsAfter(DateTime.now());
    final notes = _notesRepository.getNotesAfter(DateTime.now());

    emit(HomePageState(
      scheduleItems: events.take(4).map((e) => Event.fromEventDB(e)).toList(),
      notes: notes,
    ));
  }
}
