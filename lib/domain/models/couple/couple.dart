import 'package:objectbox/objectbox.dart';

import '../../../objectbox.g.dart';
import '../../../presentation/pages/schedule/schedule_day.dart';
import '../schedule/schedule.dart';

@Entity()
class Couple {
  @Id() int id = 0;
  final String audiences;
  @Transient()
  CoupleType? type;
  final String discipline;
  final String lecturers;
  final ToOne<DaySchedule> daySchedule = ToOne<DaySchedule>();

  Couple({
    required this.audiences,
    required this.discipline,
    required this.lecturers,
  });

  bool get isOnline => audiences.contains("LMS");

  bool get isVPK => discipline.contains("ВПК");
  bool get isVUC => discipline.contains("ВУЦ");
  bool get isEmpty => discipline.isEmpty;

  // Enum базой данных не поддерживается, поэтому нужно конвертировать
  String? get dbType {
    return type?.name;
  }

  set dbType(String? value) {
    if (value == null) {
      type = null;
    } else {
      for (CoupleType type in CoupleType.values) {
        if (type.name == value) {
          this.type = type;
        }
      }
    }
  }

  factory Couple.fromString(String coupleStr) {
    String input = coupleStr;
    final typeRegExp = RegExp(r"пр\.|лаб\.|лек\.|экз\.");
    final type = typeRegExp.firstMatch(input)?[0] ?? "";
    input = input.replaceFirst(typeRegExp, "");

    final audiencesRegExp = RegExp(r"LMS(-[0-9]| |$)|[А-Я]-[0-9]{3}[а-я]?");
    final audiences = audiencesRegExp.allMatches(input).map((e) => e.group(0)).join(", ");
    input = input.replaceAll(audiencesRegExp, "");

    final lecturersRegExp = RegExp(r"([1-9] п/г)? [А-Я][а-я]* [А-Я]. [A-Я].");
    final lecturers = lecturersRegExp.allMatches(input).map((e) => e.group(0)).join(", ");
    input = input.replaceAll(lecturersRegExp, "");

    final Couple coupleDB = Couple(
      audiences: audiences,
      discipline: input,
      lecturers: lecturers,
    );

    coupleDB.type = CoupleType.fromString(type);

    return coupleDB;
  }
}

enum CoupleType {
  lecture(name: "Лекция"),
  practice(name: "Практика"),
  laboratory(name: "Лабораторная"),
  exam(name: "Экзамен"),
  none(name: "");

  const CoupleType({
    required this.name
  });

  final String name;

  static CoupleType fromString(String type) {
    switch(type) {
      case "лек.": return CoupleType.lecture;
      case "пр.": return CoupleType.practice;
      case "лаб.": return CoupleType.laboratory;
      case "экз.": return CoupleType.exam;
    }

    return CoupleType.none;
  }
}