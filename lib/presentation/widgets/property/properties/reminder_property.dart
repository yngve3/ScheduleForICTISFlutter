import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';

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
  final ReminderCallback onDelete;
  final ReminderCallback onAdd;

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

    if (reminders.length < 3) {
      widgets.add(InkWell(
        onTap: () => showModalBottomSheet(
            elevation: 0,
            context: context,
            builder: (context) {
              List<Reminder> remindersForChoose = [
                Reminder.beforeDateTime(const Duration(minutes: 15)),
                Reminder.beforeDateTime(const Duration(minutes: 30)),
                Reminder.beforeDateTime(const Duration(minutes: 5)),
                Reminder.beforeDateTime(const Duration(minutes: 10)),
                Reminder.beforeDateTime(const Duration(hours: 1)),
              ];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: remindersForChoose.where((element) => !reminders.contains(element)).map((reminder) =>
                      InkWell(
                        onTap: () {
                          onAdd(reminder);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              const Icon(Icons.circle_outlined),
                              const SizedBox(width: 10),
                              Text("За ${MinutesToString.getTime(reminder.minutesBefore)}", style: context.textTheme.bodyLarge)
                            ],
                          ),
                        ),
                      )
                  ).toList(),
                ),
              );
            }
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
              "Добавить уведомление",
              style: context.textTheme.bodyLarge?.copyWith(color: context.customColors.text2)
          ),
        ),
      ));
    }

    return widgets;
  }
}

typedef ReminderCallback = Function(Reminder reminder);

class ReminderTile extends StatelessWidget {
  const ReminderTile({
    super.key,
    required this.reminder,
    required this.onDelete,
  });

  final Reminder reminder;
  final ReminderCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("За ${MinutesToString.getTime(reminder.minutesBefore)}", style: context.textTheme.bodyLarge),
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

class MinutesToString {
  static String getTime(int minutesBefore) {
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

    return "${_getString(weeks)[0]} "
        "${_getString(days)[1]} "
        "${_getString(hours)[2]} "
        "${_getString(minutes)[3]}".trim();
  }

  static List<String> _getString(int num) {
    if (num == 0) return ["", "", "", ""];
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