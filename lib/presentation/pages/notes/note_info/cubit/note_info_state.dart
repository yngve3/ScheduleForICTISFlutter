import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/note_file/note_file.dart';

part 'note_info_state.freezed.dart';

@freezed
class NoteInfoState with _$NoteInfoState {
  const factory NoteInfoState({
    @Default(0) int noteID,
    @Default("") String title,
    String? description,
    DateTime? date,
    @Default("") String discipline,
    @Default([]) List<NoteFile> files
  }) = _NoteInfoState;
}
