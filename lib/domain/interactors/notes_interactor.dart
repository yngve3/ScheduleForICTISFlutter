import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/couples_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/note_files_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/notes_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/reminders_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/user_repository.dart';
import 'package:schedule_for_ictis_flutter/domain/models/note/note.dart';
import 'package:schedule_for_ictis_flutter/utils/reminders_helper.dart';
import 'package:schedule_for_ictis_flutter/utils/state_list.dart';

import '../models/note_file/note_file.dart';
import '../models/reminder/reminder.dart';
import '../models/schedule/day_schedule_item.dart';

class NotesInteractor {
  final NotesRepository _notesRepository = NotesRepository();
  final CouplesRepository _couplesRepository = CouplesRepository();
  final NoteFilesRepository _noteFilesRepository = NoteFilesRepository();
  final RemindersRepository _remindersRepository = RemindersRepository();
  final UserRepository _userRepository = UserRepository();
  
  Future<Couple?> getCoupleByID(String id) async {
    final coupleDB = await _couplesRepository.getCoupleByID(id);
    if (coupleDB == null) return null;

    return Couple.fromCoupleDB(coupleDB);
  }

  Stream<List<Note>> getNotesByCoupleID(String coupleID) {
    return _notesRepository.getNotesByCoupleID(coupleID, userUID: _userRepository.uid);
  }
  
  Future<Note?> getNoteByID(int id) async {
    return await _notesRepository.getNote(id);
  }

  Stream<List<NoteFile>> getNoteFiles(int noteID) {
    return _noteFilesRepository.getFilesByNoteID(noteID);
  }

  void saveNote({
    int? noteID,
    required String title, 
    required DateTime date,
    required TimeOfDay time,
    required String coupleID,
    String? description,
    required StateList<Reminder> reminders,
    required StateList<NoteFile> files
  }) async {
    if (noteID != null) {
      final deletedFilesIds = files.elements.map((file) => file.id).toList();
      _noteFilesRepository.deleteFiles(deletedFilesIds);
    }

    final remindersList = _remindersRepository.processReminders(
      reminders,
      isEdit: noteID != null,
      title: title,
      date: date,
      timeStart: time
    );

    final note = Note(
      id: noteID ?? 0,
      title: title,
      date: DateTime(date.year, date.month, date.day, time.hour, time.minute),
      coupleID: coupleID,
      description: description,
      files: files.elements,
      reminders: remindersList,
      userUID: _userRepository.uid ?? ""
    );

    _notesRepository.addNote(note);
  }

  void deleteNote(int noteID, List<Reminder> reminders) {
    _notesRepository.deleteNote(noteID);
    final deletedFilesIds = reminders.map((file) => file.id!).toList();
    RemindersHelper.deleteReminders(deletedFilesIds);
  }
}