import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/domain/interactors/notes_interactor.dart';

import 'note_info_state.dart';

class NoteInfoCubit extends Cubit<NoteInfoState> {
  NoteInfoCubit() : super(const NoteInfoState());
  final NotesInteractor _notesInteractor = NotesInteractor();

  void loadNote(int noteID, String coupleID) async {
    final note = await _notesInteractor.getNoteByID(noteID);
    final coupleDB = await _notesInteractor.getCoupleByID(coupleID);

    if (note == null || coupleDB == null) return;

    emit(NoteInfoState(
      coupleDB: coupleDB,
      noteID: note.id,
      title: note.title,
      description: note.description,
      files: note.attachedFiles,
      reminders: note.reminders
    ));
  }

  void deleteNote() {
    _notesInteractor.deleteNote(state.noteID, state.reminders);
  }
}
