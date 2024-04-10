import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/domain/interactors/events_interactor.dart';

import 'event_info_state.dart';

class EventInfoCubit extends Cubit<EventInfoState> {
  EventInfoCubit() : super(const EventInfoState());
  final EventsInteractor _interactor = EventsInteractor();

  void loadEvent(int? eventID) async {
    if (eventID == null) return;
    final event = await _interactor.getEventById(eventID);
    if (event == null) return;

    emit(EventInfoState(
      id: event.id,
      title: event.title,
      description: event.description,
      date: event.date,
      timeStart: event.timeStart,
      timeEnd: event.timeEnd,
      location: event.location
    ));
  }

  void deleteEvent() {
    _interactor.deleteEvent(state.id);
  }
}
