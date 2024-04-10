import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/events_repository.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/date_time_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/time_of_day_ext.dart';

import '../../data/models/event_db.dart';
import '../models/schedule/day_schedule_item.dart';

class EventsInteractor {
  final EventsRepository _eventsRepository = EventsRepository();

  void addEvent({
    int? id,
    required TimeOfDay timeStart,
    required TimeOfDay timeEnd,
    required DateTime date,
    required String title,
    String? description,
    String? location
  }) {
    _eventsRepository.addEvent(EventDB(
      id: id ?? 0,
      timeStart: timeStart.string,
      timeEnd: timeEnd.string,
      title: title,
      description: _getText(description),
      date: date,
      weekNum: date.weekNumber,
      location: _getText(location),
    ));
  }

  Future<Event?> getEventById(int id) async  {
    final eventDB = await _eventsRepository.getEventById(id);
    if (eventDB == null) return null;
    return Event.fromEventDB(eventDB);
  }

  void deleteEvent(int id) {
    _eventsRepository.deleteEvent(id);
  }


  String? _getText(String? string) {
    if (string != null && string.isEmpty) return null;

    return string;
  }

}

