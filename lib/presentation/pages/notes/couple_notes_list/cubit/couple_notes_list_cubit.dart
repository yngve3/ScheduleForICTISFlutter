import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/notes_repository.dart';

import '../../../../../domain/models/schedule/day_schedule_item.dart';
import 'couple_notes_list_state.dart';

class CoupleNotesListCubit extends Cubit<CoupleNotesListState> {
  CoupleNotesListCubit() : super(const CoupleNotesListState());

  final NotesRepository _repository = NotesRepository();

  void loadState(Couple? couple) async {
    if (couple == null) return;
    final notes = await _repository.getNotesByCouple(couple);
    emit(CoupleNotesListState(
      couple: couple,
      notes: notes
    ));
  }
}