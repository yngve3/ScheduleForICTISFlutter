import 'package:schedule_for_ictis_flutter/data/models/event_db.dart';
import 'package:schedule_for_ictis_flutter/main.dart';

import '../../objectbox.g.dart';

class EventsRepository {
  late final Box<EventDB> _eventsBox;

  EventsRepository() {
    _eventsBox = objectBox.store.box<EventDB>();
  }

  Stream<List<EventDB>> getEventsByWeekNum(int calendarWeekNumber) {
    final query = _eventsBox.query(EventDB_.weekNum.equals(calendarWeekNumber));
    return query.watch(triggerImmediately: true).map((event) => event.find());
  }

  void addEvent(EventDB event) {
    _eventsBox.putAsync(event);
  }

  void deleteEvent(int id) {
    _eventsBox.removeAsync(id);
  }
}