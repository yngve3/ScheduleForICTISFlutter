import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/note/note.dart';

part 'all_notes_list_state.freezed.dart';

@freezed
class AllNotesListState with _$AllNotesListState {
  const factory AllNotesListState({
    @Default([]) List<Note> notes
  }) = _AllNotesListState;
}
