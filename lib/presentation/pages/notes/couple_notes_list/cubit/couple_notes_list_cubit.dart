import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/domain/interactors/notes_interactor.dart';

import '../../../../../domain/models/note/note.dart';
import 'couple_notes_list_state.dart';

class CoupleNotesListCubit extends Cubit<CoupleNotesListState> {
  CoupleNotesListCubit() : super(const CoupleNotesListState());

  final NotesInteractor _notesInteractor = NotesInteractor();
  late StreamSubscription<List<Note>> subscription;

  void loadState(String? coupleID) async {
    if (coupleID == null) return;
    final coupleDB = await _notesInteractor.getCoupleByID(coupleID);
    subscription = _notesInteractor.getNotesByCoupleID(coupleID).listen((notes) {
      emit(CoupleNotesListState(
          coupleDB: coupleDB,
          notes: notes
      ));
    });
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}