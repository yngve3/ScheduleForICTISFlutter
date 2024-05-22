import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/notes_repository.dart';
import 'package:schedule_for_ictis_flutter/domain/interactors/schedule_interactor.dart';

import '../../data/models/couple_db.dart';
import '../../data/repositories/couples_repository.dart';
import '../../data/repositories/events_repository.dart';
import '../../data/repositories/favorite_schedules_repository.dart';
import '../../data/repositories/user_repository.dart';
import '../../data/repositories/week_number_repository.dart';
import '../models/note/note.dart';
import '../models/schedule/day_schedule_item.dart';
import '../models/week_number/week_number.dart';

class HomePageInteractor {
  final CouplesRepository _couplesRepository = CouplesRepository();
  final FavoriteSchedulesRepository _favoriteSchedulesRepository = FavoriteSchedulesRepository();
  final EventsRepository _eventsRepository = EventsRepository();
  final WeekNumberRepository _weekNumberRepository = WeekNumberRepository();
  final UserRepository _userRepository = UserRepository();
  final NotesRepository _notesRepository = NotesRepository();
  
  final _itemsController = StreamController<List<DayScheduleItem>>();
  Stream<List<DayScheduleItem>> get items => _itemsController.stream;

  final _notesController = StreamController<List<Note>>();
  Stream<List<Note>> get notes => _notesController.stream;

  final List<StreamSubscription> _subscriptions = [];
  final ScheduleInteractorState _state = ScheduleInteractorState();
  
  HomePageInteractor() {
    _subscriptions.add(
        _favoriteSchedulesRepository
            .getSelectedFavoriteScheduleStream(userUID: _userRepository.uid)
            .listen((favoriteSchedules) {
              if (favoriteSchedules.length > 2 || favoriteSchedules.isEmpty) return;
              _state.setFavoriteSchedules(favoriteSchedules);
              _notesRepository.getNotesAfter(DateTime.now(), scheduleSubjects: favoriteSchedules);
              _couplesRepository.getCouplesAfter(DateTime.now(), favoriteSchedules);
            }
        )
    );

    _subscriptions.add(
      _couplesRepository.couples.listen((event) {
        _state.setCouplesDB(event);
      })
    );

    _subscriptions.add(
      _notesRepository.notes.listen((event) {
        _notesController.add(event);
      })
    );

    _subscriptions.add(
      _eventsRepository.events.listen((eventsDB) {
        _state.setEventsDB(eventsDB);
      })
    );

    _subscriptions.add(_state.state.listen((event) =>
        _itemsController.add(_createItems(event))
    ));

    _eventsRepository.getEventsAfter(DateTime.now(), _userRepository.uid);
  }

  void update() {
    _itemsController.add(_createItems(_state));
    _notesRepository.getNotesAfter(DateTime.now().add(const Duration(seconds: 1)), scheduleSubjects: _state.favoriteSchedules);
  }

  WeekNumber get currentWeekNumber => _weekNumberRepository.getCurrentWeekNumber() ?? WeekNumber.empty();

  List<DayScheduleItem> _createItems(ScheduleInteractorState state) {
    List<DayScheduleItem> items = [];
    List<CoupleDB> couplesDB = state.couplesDB;
    if (couplesDB.firstWhereOrNull((element) => element.isVPKPlaceHolder) == null) {
      couplesDB = couplesDB.where((element) => element.scheduleSubject.target?.isNotVPK ?? true).toList();
    }
    items.addAll(couplesDB.where((element) => element.isNotEmpty && element.isNotVPKPlaceHolder).map((e) => Couple.fromCoupleDB(e)).toList());
    items.addAll(state.eventsDB.map((e) => Event.fromEventDB(e)));
    items.sort((a, b) => a.dateTimeStart.compareTo(b.dateTimeStart));

    if (items.isEmpty) return const [];
    final date = items.first.dateTimeStart;

    return items.where((element) => DateUtils.isSameDay(element.dateTimeStart, date) && element.dateTimeEnd.isAfter(DateTime.now().add(const Duration(seconds: 1)))).toList();
  }

  void dispose() {
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
    _notesController.close();
    _itemsController.close();
    _couplesRepository.dispose();
    _eventsRepository.dispose();
  }
}