import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/events_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/reminders_repository.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/date_time_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/time_of_day_ext.dart';
import 'package:schedule_for_ictis_flutter/utils/reminders_helper.dart';

import '../../data/models/event_db.dart';
import '../../utils/state_list.dart';
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
    required StateList<Reminder> reminders,
  }) async {
    final remindersList = _remindersRepository.processReminders(reminders,
      isEdit: id != null,
      title: title,
      date: date,
      timeStart: timeStart
    );

    final eventDB = EventDB(
      id: id ?? 0,
      timeStart: timeStart.string,
      timeEnd: timeEnd.string,
      title: title,
      date: DateTime(date.year, date.month, date.day, timeEnd.hour, timeEnd.minute),
      weekNum: date.weekNumber,
      location: toNullIfEmpty(location),
      description: toNullIfEmpty(description),
      reminders: remindersList
    );

    _eventsRepository.addEvent(eventDB);
  }

  Future<Event?> getEventById(int id) async  {
    final eventDB = await _eventsRepository.getEventById(id);
    if (eventDB == null) return null;
    return Event.fromEventDB(eventDB);
  }

  void deleteEvent(int id, List<Reminder>? reminders) {
    _eventsRepository.deleteEvent(id);
    final deletedRemindersIds = reminders?.map((e) => e.id!).toList();
    RemindersHelper.deleteReminders(deletedRemindersIds ?? []);
  }

  String? toNullIfEmpty(String? string) {
    if (string == null) return null;
    if (string.isEmpty) return null;
    return string;
  }
}

