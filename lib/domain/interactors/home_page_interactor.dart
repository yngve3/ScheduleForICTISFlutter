import 'package:schedule_for_ictis_flutter/data/repositories/notes_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/week_number_repository.dart';

import '../../data/models/couple_db.dart';
import '../../data/repositories/couples_repository.dart';
import '../../data/repositories/events_repository.dart';
import '../../data/repositories/favorite_schedules_repository.dart';
import '../models/note/note.dart';
import '../models/schedule/day_schedule_item.dart';

class HomePageInteractor {
  final CouplesRepository _couplesRepository = CouplesRepository();
  final FavoriteSchedulesRepository _favoriteSchedulesRepository = FavoriteSchedulesRepository();
  final EventsRepository _eventsRepository = EventsRepository();
  final NotesRepository _notesRepository = NotesRepository();
  final WeekNumberRepository _weekNumberRepository = WeekNumberRepository();

  Future<List<DayScheduleItem>> getComingScheduleItems() async {
    final mainScheduleSubject = await _favoriteSchedulesRepository.getSelectedFavoriteSchedule();
    final vpkScheduleSubject = await _favoriteSchedulesRepository.getSelectedFavoriteSchedule(isVPK: true);

    List<CoupleDB> couplesDB = [];

    if (mainScheduleSubject != null) {
      couplesDB.addAll(
          _couplesRepository.getCouplesAfter(DateTime.now(), mainScheduleSubject)
              .where((coupleDB) => coupleDB.isNotEmpty && coupleDB.isNotVPKPlaceHolder)
              .take(5)
      );
    }

    if (vpkScheduleSubject != null) {
      couplesDB.addAll(
          _couplesRepository.getCouplesAfter(DateTime.now(), vpkScheduleSubject)
              .where((coupleDB) => coupleDB.isNotEmpty && coupleDB.isNotVPKPlaceHolder)
              .take(5)
      );
    }

    final eventsDB = _eventsRepository.getEventsAfter(DateTime.now());

    List<DayScheduleItem> items = [];

    items.addAll(couplesDB.map((coupleDB) => Couple.fromCoupleDB(coupleDB)));
    items.addAll(eventsDB.map((eventDB) => Event.fromEventDB(eventDB)));

    items.sort((a, b) => a.dateTimeStart.compareTo(b.dateTimeStart));

    return items.take(5).toList();
  }

  List<Note> getComingNotes() {
    return _notesRepository.getNotesAfter(DateTime.now()).take(5).toList();
  }

  int? getCurrentStudyWeekNumber() {
    return _weekNumberRepository.getCurrentWeekNumber()?.studyWeekNumber;
  }
}