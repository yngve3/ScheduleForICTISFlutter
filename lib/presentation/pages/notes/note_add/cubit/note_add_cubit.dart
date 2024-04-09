import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/notes_repository.dart';

import '../../../../../domain/models/note/note.dart';
import '../../../../../domain/models/schedule/day_schedule_item.dart';
import 'note_add_state.dart';

class NoteAddCubit extends Cubit<NoteAddState> {
  NoteAddCubit() : super(const NoteAddState());

  final NotesRepository _repository = NotesRepository();

  void addNote() {
    _repository.addNote(Note(
      text: state.title,
      date: state.date ?? DateTime.now(),
      coupleID: state.coupleID
    ));
  }

  void loadFromCouple(Couple? couple) {
    if (couple == null) return;

    emit(NoteAddState(
      coupleID: couple.id,
      date: couple.date,
      discipline: couple.discipline
    ));
  }

  void loadFromNote(Note? note) {
    if (note == null) return;
  }

  void titleChanged(String value) {
    emit(state.copyWith(
      title: value,
      isButtonSaveEnabled: _isFieldsNotEmpty()
    ));
  }

  void descriptionChanged(String value) {
    emit(state.copyWith(
        description: value,
        isButtonSaveEnabled: _isFieldsNotEmpty()
    ));
  }

  void dateChanged(DateTime date) {
    emit(state.copyWith(
        date: date,
        isButtonSaveEnabled: _isFieldsNotEmpty()
    ));
  }

  bool _isFieldsNotEmpty() {
    return state.title.isNotEmpty && state.date != null;
  }
}
