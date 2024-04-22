import 'package:objectbox/objectbox.dart';
import 'package:schedule_for_ictis_flutter/data/models/week_schedule_db.dart';

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

  @Index() @Unique(onConflict: ConflictStrategy.replace) final String idForSearch;

  bool get isOnline => audiences.contains("LMS");
  bool get isVUC => discipline.contains("ВУЦ");

  bool get isNotVPKPlaceHolder => !discipline.contains("ВПК");
  bool get isVPKPlaceHolder => discipline.contains("ВПК");

  bool get isEmpty => discipline.isEmpty;
  bool get isNotEmpty => discipline.isNotEmpty;

  CoupleDB({
    required this.audiences,
    required this.discipline,
    required this.lecturers,
    required this.coupleNum,
    required this.idForSearch
  });

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

  factory CoupleDB.fromString(String coupleStr, {required int coupleNum, required String idOfDay}) {
    String input = coupleStr;
    final typeRegExp = RegExp(r"пр\.|лаб\.|лек\.|экз\.");
    final type = typeRegExp.firstMatch(input)?[0] ?? "";
    input = input.replaceFirst(typeRegExp, "");

    final audiencesRegExp = RegExp(r"LMS(-[0-9]| |$)|[А-Я]-[0-9]{3}[а-я]?");
    final audiences = audiencesRegExp.allMatches(input).map((e) => e.group(0)).join(", ").trim();
    input = input.replaceAll(audiencesRegExp, "");

    final lecturersRegExp = RegExp(r"(\d\d? п/г)? [А-Я][а-я]* [А-Я]. [A-Я].");
    final lecturers = lecturersRegExp.allMatches(input).map((e) => e.group(0)).join(", ").trim();
    input = input.replaceAll(lecturersRegExp, "");

    final groupsRegExp = RegExp(
        r"КТ[бмас][озв]\d-\d\d?,?"
        r"|ВПК \d\d?-\d\d?(.\d)?,?"
        r"|\d{2}[А-ЯЁа-яё]{2}-\d{2}\.\d{2}\.\d{2}\.\d{2}-[а-о]\d,?"
        r"|Группа\d"
    );
    final groups = groupsRegExp.allMatches(input).map((e) => e.group(0)).join(" ").trim();
    input = input.replaceAll(groupsRegExp, "");

    final CoupleDB coupleDB = CoupleDB(
      audiences: audiences.trim(),
      discipline: input.trim(),
      lecturers: lecturers.isNotEmpty ? lecturers : groups,
      coupleNum: coupleNum,
      idForSearch: IdGenerator.createByIdAndNum(idOfDay, coupleNum)
    );

    coupleDB.type = CoupleType.fromString(type);

    return coupleDB;
  }
}