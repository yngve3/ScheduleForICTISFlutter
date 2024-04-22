import 'package:flutter/material.dart';

import '../../../data/models/couple_db.dart';
import '../../../data/models/event_db.dart';
import '../../../presentation/extensions/time_of_day_ext.dart';
import '../couple/couple_type.dart';
import '../reminder/reminder.dart';

abstract class DayScheduleItem {
  final TimeOfDay timeStart;
  final TimeOfDay timeEnd;

  DayScheduleItem(this.timeStart, this.timeEnd);
}

class Couple extends DayScheduleItem {
  final String audiences;
  final CoupleType type;
  final String discipline;
  final String lecturers;
  final DateTime date;
  final String id;

  Couple(int coupleNum, {
    required this.audiences,
    required this.type,
    required this.discipline,
    required this.lecturers,
    required this.date,
    required this.id
  }): super(
      TimeOfDayExtension.timeStart(coupleNum)!,
      TimeOfDayExtension.timeEnd(coupleNum)!
  );

  factory Couple.fromCoupleDB(CoupleDB coupleDB) {
    return Couple(
      coupleDB.coupleNum,
      audiences: coupleDB.audiences,
      type: coupleDB.type ?? CoupleType.none,
      discipline: coupleDB.discipline,
      lecturers: coupleDB.lecturers,
      date: coupleDB.daySchedule.target!.date,
      id: coupleDB.id
    );
  }

  bool get isOnline => audiences.contains("LMS");
  bool get isNotVPKPlaceHolder => !discipline.contains("ВПК");
  bool get isVUC => discipline.contains("ВУЦ");
  bool get isEmpty => discipline.isEmpty;
}

class Event extends DayScheduleItem {
  final String title;
  final String? description;
  final String? location;
  final DateTime date;
  final int id;
  final List<Reminder>? reminders;

  Event(super.timeStart, super.timeEnd, {
    required this.title,
    required this.date,
    required this.id,
    this.description,
    this.location,
    this.reminders
  });

  factory Event.fromEventDB(EventDB eventDB) {
    return Event(
      TimeOfDayExtension.parse(eventDB.timeStart),
      TimeOfDayExtension.parse(eventDB.timeEnd),
      title: eventDB.title,
      description: eventDB.description,
      location: eventDB.location,
      date: eventDB.date,
      id: eventDB.id,
      reminders: eventDB.reminders
    );
  }
}