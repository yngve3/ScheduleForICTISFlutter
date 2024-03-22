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