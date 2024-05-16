import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/domain/interactors/notes_interactor.dart';

import '../../../../../domain/models/note_file/note_file.dart';
import '../../../../../domain/models/reminder/reminder.dart';
import '../../../../../utils/state_list.dart';
import 'note_add_state.dart';

class NoteAddCubit extends Cubit<NoteAddState> {
  NoteAddCubit() : super(NoteAddState(
      reminders: StateList([]),
      files: StateList([]))
  );

  final NotesInteractor _interactor = NotesInteractor();

  void addNote() {
    _interactor.saveNote(
      noteID: state.noteID,
      title: state.title,
      coupleDB: state.coupleDB,
      description: state.description,
      files: state.files,
      reminders: state.reminders,
    );
  }

  void addFile(NoteFile file) {
    final files = state.files.copy();
    files.add(file);
    emit(state.copyWith(files: files));
  }

  void deleteFile(NoteFile file) {
    final files = state.files.copy();
    files.remove(file);
    emit(state.copyWith(files: files));
  }

  void addReminder(Reminder reminder) {
    final reminders = state.reminders.copy();
    reminders.add(reminder);
    emit(state.copyWith(reminders: reminders));
  }

  void deleteReminder(Reminder reminder) {
    final reminders = state.reminders.copy();
    reminders.remove(reminder);
    emit(state.copyWith(reminders: reminders));
  }

  void loadFromCouple(String? coupleID) async {
    if (coupleID == null) return;
    final coupleDB = await _interactor.getCoupleByID(coupleID);
    if (coupleDB == null) return;
    
    emit(state.copyWith(
      coupleDB: coupleDB
    ));
  }

  void loadFromNote(int? noteID) async {
    if (noteID == null) return;
    final note = await _interactor.getNoteByID(noteID);
    if (note == null) return;
    
    emit(state.copyWith(
      title: note.title,
      description: note.description,
      noteID: note.id,
      files: StateList(note.attachedFiles),
      reminders: StateList(note.reminders),
      isButtonSaveEnabled: true
    ));
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

  bool _isFieldsNotEmpty() {
    return state.title.isNotEmpty;
  }
}
