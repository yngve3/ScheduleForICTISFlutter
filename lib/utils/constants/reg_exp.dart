class RegExpressions {
  static final audienceExp = RegExp(r"LMS(-[0-9]| |$)|[А-Я]-[0-9]{3}[а-я]?");
  static final lectorExp = RegExp(r"(\d\d? п/г )?[А-Я][а-я]* [А-Я]. [A-Я].");
  static final groupExp = RegExp(
      r"КТ[бмас][озв]\d-\d\d?,?"
      r"|ВПК \d\d?-\d\d?(.\d)?,?"
      r"|\d{2}[А-ЯЁа-яё]{2}-\d{2}\.\d{2}\.\d{2}\.\d{2}-[а-о]\d,?"
      r"|Группа\d"
  );
}