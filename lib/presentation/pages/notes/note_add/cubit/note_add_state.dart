import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_add_state.freezed.dart';

@freezed
class NoteAddState with _$NoteAddState {
  const factory NoteAddState({
    @Default("") String coupleID,
    @Default("") String title,
    String? description,
    @Default("") String discipline,
    DateTime? date,
    @Default(false) isButtonSaveEnabled
  }) = _NoteAddState;

}
