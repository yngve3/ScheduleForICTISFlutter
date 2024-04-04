import 'package:schedule_for_ictis_flutter/domain/models/current_week/current_week.dart';

import '../../main.dart';
import '../../objectbox.g.dart';

class CurrentWeekRepository {
  late final Box<CurrentWeek> _currentWeekBox;

  CurrentWeekRepository() {
    _currentWeekBox = objectBox.store.box<CurrentWeek>();
  }

  void put(CurrentWeek currentWeek) {
    _currentWeekBox.removeAll();
    _currentWeekBox.put(currentWeek);
  }

  CurrentWeek? get() {
    return _currentWeekBox.query().build().findFirst();
  }
}