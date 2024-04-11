import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_info_state.freezed.dart';

@freezed
class NoteInfoState with _$NoteInfoState {
  const factory NoteInfoState({
    @Default(0) int noteID,
    @Default("") String title,
    String? description,
    DateTime? date,
    @Default("") String discipline,
  }) = _NoteInfoState;
}
