import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/events_repository.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/date_time_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/time_of_day_ext.dart';

import '../../../../data/models/event_db.dart';
import '../../../../domain/models/schedule/day_schedule_item.dart';
import 'event_add_state.dart';

class EventAddCubit extends Cubit<EventAddState> {
  EventAddCubit(): super(EventAddState());
  EventsRepository repository = EventsRepository();

  void saveEvent() {
    repository.addEvent(EventDB(
      id: state.id ?? 0,
      timeStart: state.timeStart!.string,
      timeEnd: state.timeEnd!.string,
      title: state.title,
      description: _getText(state.description),
      date: state.date!,
      weekNum: state.date!.weekNumber,
      location: _getText(state.location),
    ));
  }

  void loadEvent(Event? event) {
    if (event == null) return;

    emit(EventAddState(
      id: event.id,
      title: event.title,
      description: event.description ?? "",
      timeStart: event.timeStart,
      timeEnd: event.timeEnd,
      location: event.location ?? "",
      date: event.date,
      isSaveButtonEnabled: true
    ));
  }
  
  String? _getText(String? string) {
    if (string != null && string.isEmpty) return null;

    return string;
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