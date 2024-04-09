import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/note/note.dart';
import '../../../../../domain/models/schedule/day_schedule_item.dart';

part 'couple_notes_list_state.freezed.dart';

@freezed
class CoupleNotesListState with _$CoupleNotesListState {
  const factory CoupleNotesListState({
    @Default([]) List<Note> notes,
    Couple? couple
  }) = _CoupleNotesListState;
}
