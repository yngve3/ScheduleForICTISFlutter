import 'package:flutter/material.dart';

import '../../../data/models/couple_db.dart';
import '../couple/couple_type.dart';

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

  Couple(int coupleNum, {
    required this.audiences,
    required this.type,
    required this.discipline,
    required this.lecturers
  }): super(
      TimeFromCoupleNum.timeStart(coupleNum)!,
      TimeFromCoupleNum.timeEnd(coupleNum)!
  );

  factory Couple.fromCoupleDB(CoupleDB coupleDB, int coupleNum) {
    return Couple(coupleNum,
        audiences: coupleDB.audiences,
        type: coupleDB.type!,
        discipline: coupleDB.discipline,
        lecturers: coupleDB.lecturers
    );
  }

  bool get isOnline => audiences.contains("LMS");

  bool get isVPK => discipline.contains("ВПК");
  bool get isVUC => discipline.contains("ВУЦ");
  bool get isEmpty => discipline.isEmpty;
}

class Event extends DayScheduleItem {
  final String title;
  final String description;

  Event(super.timeStart, super.timeEnd, {
    required this.title,
    required this.description
  });
}

extension TimeFromCoupleNum on TimeOfDay {
  static TimeOfDay? timeStart(int coupleNum) {
    switch (coupleNum) {
      case 1: return const TimeOfDay(hour: 8, minute: 0);
      case 2: return const TimeOfDay(hour: 9, minute: 50);
      case 3: return const TimeOfDay(hour: 11, minute: 55);
      case 4: return const TimeOfDay(hour: 13, minute: 45);
      case 5: return const TimeOfDay(hour: 15, minute: 50);
      case 6: return const TimeOfDay(hour: 17, minute: 40);
      case 7: return const TimeOfDay(hour: 19, minute: 30);
    }
    return null;
  }

  static TimeOfDay? timeEnd(int coupleNum) {
    switch (coupleNum) {
      case 1: return const TimeOfDay(hour: 9, minute: 35);
      case 2: return const TimeOfDay(hour: 11, minute: 25);
      case 3: return const TimeOfDay(hour: 13, minute: 30);
      case 4: return const TimeOfDay(hour: 15, minute: 20);
      case 5: return const TimeOfDay(hour: 17, minute: 25);
      case 6: return const TimeOfDay(hour: 19, minute: 15);
      case 7: return const TimeOfDay(hour: 21, minute: 05);
    }
    return null;
  }
}