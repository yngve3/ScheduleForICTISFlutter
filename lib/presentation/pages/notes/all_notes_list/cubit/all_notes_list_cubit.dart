import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/favorite_schedules_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/notes_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/user_repository.dart';

import '../../../../../domain/models/note/note.dart';
import 'all_notes_list_state.dart';

class AllNotesListCubit extends Cubit<AllNotesListState> {
  AllNotesListCubit() : super(const AllNotesListState());
  final _notesRepository = NotesRepository();
  final _userRepository = UserRepository();
  final _favoriteScheduleRepository = FavoriteSchedulesRepository();

  final List<StreamSubscription> subscriptions = [];

  void loadNotes() {
    subscriptions.add(_favoriteScheduleRepository.getSelectedFavoriteScheduleStream(userUID: _userRepository.uid).listen((scheduleSubjects) {
      final List<Note> notes = [];
      for (final scheduleSubject in scheduleSubjects) {
        notes.addAll(_notesRepository.getAllNotes(userUID: _userRepository.uid, scheduleSubject: scheduleSubject));
      }
      emit(AllNotesListState(notes: notes));
    }));
  }

  @override
  Future<void> close() {
    for (final subscription in subscriptions) {
      subscription.cancel();
    }
    return super.close();
  }
}
