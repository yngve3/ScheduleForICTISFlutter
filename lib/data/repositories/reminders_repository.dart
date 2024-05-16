import 'dart:math';

import 'package:schedule_for_ictis_flutter/main.dart';

import '../../domain/models/reminder/reminder.dart';
import '../../objectbox.g.dart';
import '../../utils/reminders_helper.dart';
import '../../utils/state_list.dart';

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

  List<Reminder> processReminders(StateList<Reminder> reminders, {
    required bool isEdit,
    required String title,
    required DateTime dateTime
  }) {
    if (isEdit) {
      final deletedRemindersIds = reminders.deletedElements.map((e) => e.id!).toList();
      deleteReminders(deletedRemindersIds);
      RemindersHelper.deleteReminders(deletedRemindersIds);
    }

    final remindersList = reminders.elements;
    remindersList
        .where((reminder) => reminder.id == null)
        .forEach((element) => element.id = Random().nextInt(10000));

    addMany(remindersList);

    RemindersHelper.createReminders(
        remindersList,
        dateTime,
        title: title
    );

    return remindersList;
  }
}