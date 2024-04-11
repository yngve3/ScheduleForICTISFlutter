import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/domain/interactors/notes_interactor.dart';

import 'note_info_state.dart';

class NoteInfoCubit extends Cubit<NoteInfoState> {
  NoteInfoCubit() : super(const NoteInfoState());
  final NotesInteractor _notesInteractor = NotesInteractor();

  void loadNote(int noteID, String coupleID) async {
    final note = await _notesInteractor.getNoteByID(noteID);
    final couple = await _notesInteractor.getCoupleByID(coupleID);

    if (note == null || couple == null) return;

    emit(NoteInfoState(
      noteID: note.id,
      title: note.title,
      description: note.description,
      date: couple.date,
      discipline: couple.discipline
    ));
  }

  void deleteNote() {
    _notesInteractor.deleteNote(state.noteID);
  }
}
