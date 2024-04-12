import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/note_file/note_file.dart';

part 'note_add_state.freezed.dart';

@freezed
class NoteAddState with _$NoteAddState {
  const factory NoteAddState({
    @Default("") String coupleID,
    @Default("") String title,
    String? description,
    @Default("") String discipline,
    DateTime? date,
    @Default(false) isButtonSaveEnabled,
    int? noteID,
    @Default([]) List<NoteFile> files,
    @Default([]) List<int> deletedFilesIds
  }) = _NoteAddState;

}
