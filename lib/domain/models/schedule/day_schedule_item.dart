import '../../../data/models/couple_db.dart';
import '../../../data/models/event_db.dart';
import '../couple/couple_type.dart';
import '../reminder/reminder.dart';

abstract class DayScheduleItem {
  final DateTime dateTimeStart;
  final DateTime dateTimeEnd;

  DayScheduleItem(this.dateTimeStart, this.dateTimeEnd);

  bool get isNow {
    final dateNow = DateTime.now();

    if (dateNow.isBefore(dateTimeEnd)
        && dateNow.isAfter(dateTimeStart)) return true;
    if (dateNow.isAtSameMomentAs(dateTimeStart)
        || dateNow.isAtSameMomentAs(dateTimeEnd)) return true;

    return false;
  }

  double get percent {
    if (!isNow) return -1;

    final diff = dateTimeStart.millisecondsSinceEpoch - dateTimeEnd.millisecondsSinceEpoch;
    final currDate = DateTime.now().millisecondsSinceEpoch - dateTimeStart.millisecondsSinceEpoch;
    return (currDate * 100) / diff;
  }
}

class Couple extends DayScheduleItem {
  final String audiences;
  final CoupleType type;
  final String discipline;
  final String lecturers;
  final String id;

  Couple(super.dateTimeStart, super.dateTimeEnd, {
    required this.audiences,
    required this.type,
    required this.discipline,
    required this.lecturers,
    required this.id
  });

  factory Couple.fromCoupleDB(CoupleDB coupleDB) {
    return Couple(
      coupleDB.dateTimeStart,
      coupleDB.dateTimeEnd,
      audiences: coupleDB.audiences,
      type: coupleDB.type ?? CoupleType.none,
      discipline: coupleDB.discipline,
      lecturers: coupleDB.lecturers,
      id: coupleDB.id,
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
  final int id;
  final List<Reminder>? reminders;

  Event(super.dateTimeStart, super.dateTimeEnd, {
    required this.title,
    required this.id,
    this.description,
    this.location,
    this.reminders
  });

  factory Event.fromEventDB(EventDB eventDB) {
    return Event(
      eventDB.dateTimeStart,
      eventDB.dateTimeEnd,
      title: eventDB.title,
      description: eventDB.description,
      location: eventDB.location,
      id: eventDB.id,
      reminders: eventDB.reminders,
    );
  }
}