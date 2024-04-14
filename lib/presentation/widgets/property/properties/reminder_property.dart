import 'package:flutter/material.dart';

import '../../../../domain/models/notification/reminder.dart';
import '../../../../gen/assets.gen.dart';
import '../property.dart';

class RemindersProperty extends StatelessWidget {
  const RemindersProperty({
    super.key,
    required this.reminders,
    required this.onDelete,
    required this.onAdd
  });

  final List<Reminder> reminders;
  final DeleteReminderCallback onDelete;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Property(
      icon: const Icon(Icons.notifications),
      children: _getWidgets(),
    );
  }

  List<Widget> _getWidgets() {
    List<Widget> widgets = [];
    widgets.addAll(reminders.map((reminder) => ReminderTile(
        reminder: reminder,
        onDelete: onDelete
    )));

    widgets.add(TextButton(
      onPressed: onAdd,
      child: Text("Добавить уведомление"),
    ));

    return widgets;
  }
}

typedef DeleteReminderCallback = Function(Reminder reminder);

class ReminderTile extends StatelessWidget {
  const ReminderTile({
    super.key,
    required this.reminder,
    required this.onDelete,
  });

  final Reminder reminder;
  final DeleteReminderCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(reminder.description),
        IconButton(
            onPressed: () => onDelete(reminder),
            icon: RotationTransition(
              turns: const AlwaysStoppedAnimation(45/360),
              child: Assets.icons.icAdd.image(),
            )
        )
      ],
    );
  }
}