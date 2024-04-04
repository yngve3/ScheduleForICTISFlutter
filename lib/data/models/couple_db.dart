import 'package:objectbox/objectbox.dart';

import '../../objectbox.g.dart';
import 'day_schedule_db.dart';
import '../../domain/models/couple/couple_type.dart';

@Entity()
class CoupleDB {
  @Id() int id = 0;
  final String audiences;
  @Transient()
  CoupleType? type;
  final String discipline;
  final String lecturers;
  final int coupleNum;
  final ToOne<DayScheduleDB> daySchedule = ToOne<DayScheduleDB>();

  bool get isNotEmpty => discipline.isNotEmpty;

  CoupleDB({
    required this.audiences,
    required this.discipline,
    required this.lecturers,
    required this.coupleNum
  });

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

  factory CoupleDB.fromString(String coupleStr, {required int coupleNum}) {
    String input = coupleStr;
    final typeRegExp = RegExp(r"пр\.|лаб\.|лек\.|экз\.");
    final type = typeRegExp.firstMatch(input)?[0] ?? "";
    input = input.replaceFirst(typeRegExp, "");

    final audiencesRegExp = RegExp(r"LMS(-[0-9]| |$)|[А-Я]-[0-9]{3}[а-я]?");
    final audiences = audiencesRegExp.allMatches(input).map((e) => e.group(0)).join(", ").trim();
    input = input.replaceAll(audiencesRegExp, "");

    final lecturersRegExp = RegExp(r"([1-9] п/г)? [А-Я][а-я]* [А-Я]. [A-Я].");
    final lecturers = lecturersRegExp.allMatches(input).map((e) => e.group(0)).join(", ").trim();
    input = input.replaceAll(lecturersRegExp, "");

    final CoupleDB coupleDB = CoupleDB(
      audiences: audiences,
      discipline: input,
      lecturers: lecturers,
      coupleNum: coupleNum
    );

    coupleDB.type = CoupleType.fromString(type);

    return coupleDB;
  }
}