import 'dart:async';

import 'package:schedule_for_ictis_flutter/data/repositories/notes_repository.dart';
import 'package:schedule_for_ictis_flutter/domain/interactors/schedule_interactor.dart';

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
        _couplesRepository.couplesByWeekNum
            .listen((couplesDB) => _state.setCouplesDB(couplesDB))
    );

    _subscriptions.add(
        _eventsRepository.eventsByWeekNum
            .listen((eventsDB) => _state.setEventsDB(eventsDB))
    );

    _subscriptions.add(
        _favoriteSchedulesRepository
            .getSelectedFavoriteScheduleStream(userUID: _userRepository.uid)
            .listen((favoriteSchedules) {
              if (favoriteSchedules.length > 2 || favoriteSchedules.isEmpty) return;
              _state.setFavoriteSchedules(favoriteSchedules);
              _state.setWeekNumber(_weekNumberRepository.getCurrentWeekNumber());
              _couplesRepository.loadCouples(_state.weekNumber, favoriteSchedules);
              List<Note> notes = [];
              for (final favoriteSchedule in favoriteSchedules) {
                notes.addAll(_notesRepository.getNotesAfter(DateTime.now(), scheduleSubject: favoriteSchedule));
              }
              _notesController.add(notes);
            }
        )
    );

    _subscriptions.add(_state.state.listen((event) =>
        _itemsController.add(_createCouples(event))
    ));

    _eventsRepository.getEventsByWeekNum(_state.weekNumber ?? WeekNumber.empty(), _userRepository.uid);
  }

  List<DayScheduleItem> _createCouples(ScheduleInteractorState state) {
    DateTime dateTime = DateTime.now();
    List<DayScheduleItem> items = [];
    for (int i = 0; i < 7; i++) {
      items.addAll(state.couplesDB
          .where((element) => element.dateTimeEnd.isAfter(DateTime.now().add(const Duration(seconds: 1))))
          .where((element) => element.dateTimeStart.weekday == dateTime.weekday)
          .where((element) => element.isNotEmpty && element.isNotVPKPlaceHolder)
          .map((coupleDB) => Couple.fromCoupleDB(coupleDB))
          .toList());

      items.addAll(state.eventsDB
          .where((element) => element.dateTimeEnd.isAfter(DateTime.now().add(const Duration(seconds: 1))) && element.dateTimeStart.weekday == dateTime.weekday)
          .map((eventDB) => Event.fromEventDB(eventDB))
          .toList());

      if (items.isNotEmpty) break;

      dateTime = dateTime.add(const Duration(days: 1));
    }

    return items;
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