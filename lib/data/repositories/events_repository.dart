import 'package:schedule_for_ictis_flutter/data/models/event_db.dart';
import 'package:schedule_for_ictis_flutter/domain/models/week_number/week_number.dart';
import 'package:schedule_for_ictis_flutter/main.dart';

import '../../objectbox.g.dart';

class EventsRepository {
  late final Box<EventDB> _eventsBox;

  EventsRepository() {
    _eventsBox = objectBox.store.box<EventDB>();
  }

  Stream<List<EventDB>> getEventsByWeekNum(WeekNumber weekNumber) {
    final query = _eventsBox.query(EventDB_.weekNum.equals(weekNumber.calendarWeekNumber));
    return query.watch(triggerImmediately: true).map((event) => event.find());
  }

  List<EventDB> getEventsAfter(DateTime dateTime) {
    final query = _eventsBox.query(EventDB_.dateTimeEnd.greaterThanDate(dateTime));
    return query.build().find();
  }

  Future<EventDB?> getEventById(int id) {
    return _eventsBox.getAsync(id);
  }

  void addEvent(EventDB event) {
    _eventsBox.put(event);
  }

  void deleteEvent(int id) {
    _eventsBox.removeAsync(id);
  }
}