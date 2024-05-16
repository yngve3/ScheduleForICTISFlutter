import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/models/couple_db.dart';
import '../../../../../domain/models/note/note.dart';

part 'couple_notes_list_state.freezed.dart';

@freezed
class CoupleNotesListState with _$CoupleNotesListState {
  const factory CoupleNotesListState({
    @Default([]) List<Note> notes,
    CoupleDB? coupleDB
  }) = _CoupleNotesListState;
}
