import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/domain/interactors/notes_interactor.dart';

import '../../../../../domain/models/note_file/note_file.dart';
import 'note_add_state.dart';

class NoteAddCubit extends Cubit<NoteAddState> {
  NoteAddCubit() : super(const NoteAddState());

  final NotesInteractor _interactor = NotesInteractor();

  void addNote() {
    _interactor.addNote(
      noteID: state.noteID,
      title: state.title,
      date: state.date ?? DateTime.now(),
      coupleID: state.coupleID,
      description: state.description,
      files: state.files
    );
  }

  void addFile(PlatformFile file) {
    final files = [...state.files];
    files.add(NoteFile.fromPlatformFile(file));
    emit(state.copyWith(files: files));
  }

  void loadFromCouple(String? coupleID) async {
    if (coupleID == null) return;
    final couple = await _interactor.getCoupleByID(coupleID);
    if (couple == null) return;
    
    emit(NoteAddState(
      coupleID: couple.id,
      date: couple.date,
      discipline: couple.discipline
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
      files: note.attachedFiles
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
    return state.title.isNotEmpty && state.date != null;
  }
}
