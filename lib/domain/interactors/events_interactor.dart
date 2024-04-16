import 'dart:math';

import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/events_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/reminders_repository.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/date_time_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/time_of_day_ext.dart';
import 'package:schedule_for_ictis_flutter/utils/reminders_helper.dart';

import '../../data/models/event_db.dart';
import '../models/reminder/reminder.dart';
import '../models/schedule/day_schedule_item.dart';

class EventsInteractor {
  final EventsRepository _eventsRepository = EventsRepository();
  final RemindersRepository _remindersRepository = RemindersRepository();

  void addEvent({
    int? id,
    required TimeOfDay timeStart,
    required TimeOfDay timeEnd,
    required DateTime date,
    required String title,
    String? description,
    String? location,
    required List<Reminder> reminders,
    required List<int> deletedRemindersIds,
  }) async {
    if (id != null) {
      _remindersRepository.deleteReminders(deletedRemindersIds);
      RemindersHelper.deleteReminders(deletedRemindersIds);
    }

    reminders.where((element) => element.id == null)
        .forEach((element) => element.id = Random().nextInt(400));

    _remindersRepository.addMany(reminders);
    RemindersHelper.createReminders(
      reminders,
      DateTime(date.year, date.month, date.day, timeStart.hour, timeStart.minute),
      title: title
    );

    EventDB eventDB = EventDB(
      id: id ?? 0,
      timeStart: timeStart.string,
      timeEnd: timeEnd.string,
      title: title,
      description: _getText(description),
      date: date,
      weekNum: date.weekNumber,
      location: _getText(location),
    );

    eventDB.reminders.addAll(reminders);
    _eventsRepository.addEvent(eventDB);
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

