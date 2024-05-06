import 'package:schedule_for_ictis_flutter/data/models/event_db.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/user_repository.dart';
import 'package:schedule_for_ictis_flutter/domain/models/week_number/week_number.dart';
import 'package:schedule_for_ictis_flutter/main.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../objectbox.g.dart';

class EventsRepository {
  late final Box<EventDB> _eventsBox;
  late final DatabaseReference _ref;
  final UserRepository _userRepository = UserRepository(); //временно

  EventsRepository() {
    _ref = FirebaseDatabase.instance.ref("users/${_userRepository.uid}/events/");
    _eventsBox = objectBox.store.box<EventDB>();
  }

  Future<void> loadEvents() async {
    final snapshot = await _ref.get();
    if (snapshot.exists) {
      print(snapshot.value);
    }
  }

  Stream<List<EventDB>> getEventsByWeekNum(WeekNumber weekNumber, String? userUID) {
    final query = _eventsBox.query(EventDB_.weekNum.equals(weekNumber.calendarWeekNumber).and(EventDB_.userUID.equals(userUID ?? "")));
    return query.watch(triggerImmediately: true).map((event) => event.find());
  }

  List<EventDB> getEventsAfter(DateTime dateTime, String? userUID) {
    final query = _eventsBox.query(EventDB_.dateTimeEnd.greaterThanDate(dateTime).and(EventDB_.userUID.equals(userUID ?? "")));
    return query.build().find();
  }

  Future<EventDB?> getEventById(int id) {
    return _eventsBox.getAsync(id);
  }

  void addEvent(EventDB event) async {
    int id = _eventsBox.put(event);
    await _ref.child(id.toString()).set(event.toJSON());
  }

  void deleteEvent(int id) {
    _eventsBox.removeAsync(id);
  }
}