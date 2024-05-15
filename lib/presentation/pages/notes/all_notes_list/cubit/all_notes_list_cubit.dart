import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/notes_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/user_repository.dart';

import 'all_notes_list_state.dart';

class AllNotesListCubit extends Cubit<AllNotesListState> {
  AllNotesListCubit() : super(const AllNotesListState());
  final _notesRepository = NotesRepository();
  final _userRepository = UserRepository();

  void loadNotes() {
    final notes = _notesRepository.getAllNotes(userUID: _userRepository.uid);
    emit(AllNotesListState(notes: notes));
  }
}
