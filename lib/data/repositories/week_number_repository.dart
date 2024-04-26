import 'package:schedule_for_ictis_flutter/presentation/extensions/date_time_ext.dart';

import '../../domain/models/week_number/week_number.dart';
import '../../main.dart';
import '../../objectbox.g.dart';

class WeekNumberRepository {
  late Box<WeekNumber> _weekNumberBox;

  WeekNumberRepository() {
    _weekNumberBox = objectBox.store.box<WeekNumber>();
  }

  int add(WeekNumber weekNumber) {
    return _weekNumberBox.put(weekNumber);
  }

  WeekNumber? getCurrentWeekNumber() {
    return _weekNumberBox
        .query(WeekNumber_.calendarWeekNumber.equals(DateTime.now().weekNumber))
        .build()
        .findFirst();
  }

  List<WeekNumber> getAll() {
    return _weekNumberBox.getAll();
  }
}