import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/domain/interactors/events_interactor.dart';

import '../../../../domain/models/reminder/reminder.dart';
import '../../../../utils/my_list.dart';
import 'event_add_state.dart';

class EventAddCubit extends Cubit<EventAddState> {
  EventAddCubit(): super(EventAddState());
  final EventsInteractor _interactor = EventsInteractor();

  void saveEvent() {
    _interactor.addEvent(
      id: state.id,
      timeStart: state.timeStart!,
      timeEnd: state.timeEnd!,
      title: state.title,
      description: state.description,
      date: state.date!,
      location: state.location,
      reminders: state.reminders,
    );
  }

  void loadStateFromEvent(int? eventID) async {
    if (eventID == null) return;
    final event = await _interactor.getEventById(eventID);
    if (event == null) return;

    emit(EventAddState(
      id: event.id,
      title: event.title,
      description: event.description ?? "",
      timeStart: event.timeStart,
      timeEnd: event.timeEnd,
      location: event.location ?? "",
      date: event.date,
      isSaveButtonEnabled: true,
      reminders: DBList<Reminder>(event.reminders ?? [])
    ));
  }

  void addReminder(Reminder reminder) {

    emit(state.copyWith(reminders: reminders));
  }

  void deleteReminder(Reminder reminder) {
    final reminders = [...state.reminders];
    final deletedRemindersIds = [...state.deletedRemindersIds];
    reminders.remove(reminder);
    if (state.id != null && reminder.id != null) {
      deletedRemindersIds.add(reminder.id!);
    }
    emit(state.copyWith(reminders: reminders, deletedRemindersIds: deletedRemindersIds));
  }

  void titleChanged(String value) {
    emit(
        state.copyWith(
            title: value,
            isSaveButtonEnabled: _isFieldsNotEmpty()
        )
    );
  }

  void descriptionChanged(String value) {
    emit(
        state.copyWith(
            description: value,
        )
    );
  }

  void timeStartChanged(TimeOfDay? time) {
    emit(
        state.copyWith(
            timeStart: time,
            isSaveButtonEnabled: _isFieldsNotEmpty()
        )
    );
  }

  void timeEndChanged(TimeOfDay? time) {
    emit(
        state.copyWith(
            timeEnd: time,
            isSaveButtonEnabled: _isFieldsNotEmpty()
        )
    );
  }

  void dateChanged(DateTime? date) {
    emit(
      state.copyWith(
        date: date,
        isSaveButtonEnabled: _isFieldsNotEmpty(),
      ),
    );
  }

  void locationChanged(String location) {
    emit(state.copyWith(
      location: location,
    ));
  }

  bool _isFieldsNotEmpty() =>
      state.title.isNotEmpty
      && state.timeStart != null
      && state.timeEnd != null
      && state.date != null
  ;
}