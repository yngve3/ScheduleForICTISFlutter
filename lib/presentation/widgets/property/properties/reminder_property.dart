import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../domain/models/reminder/reminder.dart';
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
      children: _getWidgets(context),
    );
  }

  List<Widget> _getWidgets(BuildContext context) {
    List<Widget> widgets = [];
    widgets.addAll(reminders.map((reminder) => ReminderTile(
        reminder: reminder,
        onDelete: onDelete
    )));

    widgets.add(TextButton(
      onPressed: () => showDialog(
        context: context,
        builder: (context) {

        }
      ),
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

  String _getTime(int minutesBefore) {
    int hours = minutesBefore ~/ 60;
    int minutes = minutesBefore - hours * 60;
    int days = 0;
    int weeks = 0;

    if (hours > 24) {
      days = hours ~/ 24;
      hours -= days * 24;
    }

    if (days > 1) {
      weeks = days ~/ 7;
      days -= weeks * 7;
    }

    return "${_getString(weeks)} "
        "${_getString(days)} "
        "${_getString(hours)} "
        "${_getString(minutes)}";
  }

  List<String> _getString(int num) {
    final List<List<String>> list = [
      ["неделя", "день", "час", "минута"],
      ["недели", "дня", "часа", "минуты"],
      ["недель", "дней", "часов", "минут"]
    ];

    List<String>? l;

    if (num % 10 == 1) {
      l =  list[0];
    } else if (num % 10 >= 2 && num % 10 <= 4) {
      l = list[1];
    } else if ((num >= 5 && num <= 20) || num % 10 >= 5 && num % 10 <= 9 || num % 10 == 0) {
      l = list[2];
    }

    if (l != null) {
      for (int i = 0; i < 4; i++) {
        l[i] = "$num ${l[i]}";
      }
      return l;
    }

    return ["", "", "", ""];
  }
}