import 'package:schedule_for_ictis_flutter/main.dart';

import '../../domain/models/reminder/reminder.dart';
import '../../objectbox.g.dart';

class RemindersRepository {
  late Box<Reminder> _remindersBox;

  RemindersRepository() {
    _remindersBox = objectBox.store.box<Reminder>();
  }

  void deleteReminders(List<int> ids) {
    _remindersBox.removeManyAsync(ids);
  }

  void addMany(List<Reminder> reminders) {
    _remindersBox.putManyAsync(reminders);
  }
}