import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/domain/interactors/notes_interactor.dart';

import 'couple_notes_list_state.dart';

class CoupleNotesListCubit extends Cubit<CoupleNotesListState> {
  CoupleNotesListCubit() : super(const CoupleNotesListState());

  final NotesInteractor _notesInteractor = NotesInteractor();

  void loadState(String? coupleID) async {
    if (coupleID == null) return;
    final couple = await _notesInteractor.getCoupleByID(coupleID);
    final notes = await _notesInteractor.getNotesByCoupleID(coupleID);
    emit(CoupleNotesListState(
      couple: couple,
      notes: notes
    ));
  }
}