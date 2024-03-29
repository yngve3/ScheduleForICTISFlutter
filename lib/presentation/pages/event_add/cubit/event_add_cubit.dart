import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event_add_state.dart';

class EventAddCubit extends Cubit<EventAddState> {
  EventAddCubit(): super(EventAddState());

  void saveEvent() {

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
            isSaveButtonEnabled: _isFieldsNotEmpty()
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
            isSaveButtonEnabled: _isFieldsNotEmpty()
        )
    );
  }

  bool _isFieldsNotEmpty() =>
      state.title.isNotEmpty
      && state.description.isNotEmpty
      && state.timeStart != null
      && state.timeEnd != null
      && state.date != null
  ;
}