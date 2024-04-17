import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../domain/models/note_file/note_file.dart';
import '../../../../../domain/models/reminder/reminder.dart';
import '../../../../../utils/state_list.dart';

part 'note_add_state.freezed.dart';

@freezed
class NoteAddState with _$NoteAddState {
  const factory NoteAddState({
    @Default("") String coupleID,
    @Default("") String title,
    TimeOfDay? time,
    String? description,
    @Default("") String discipline,
    DateTime? date,
    @Default(false) isButtonSaveEnabled,
    int? noteID,
    required StateList<NoteFile> files,
    required StateList<Reminder> reminders
  }) = _NoteAddState;
}
