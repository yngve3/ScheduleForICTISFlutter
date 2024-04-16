import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/bottom_sheet.dart';

import '../../../../domain/models/reminder/reminder.dart';
import '../../../../gen/assets.gen.dart';
import '../property.dart';

class RemindersProperty extends StatelessWidget {
  RemindersProperty({
    super.key,
    required this.reminders,
    this.onDelete,
    this.onAdd,
    this.readOnly = false
  });

  final List<Reminder> reminders;
  final ReminderCallback? onDelete;
  final ReminderCallback? onAdd;
  final bool readOnly;

  final List<Reminder> remindersForChoose = [
    Reminder.fromDuration(const Duration(minutes: 0)),
    Reminder.fromDuration(const Duration(minutes: 15)),
    Reminder.fromDuration(const Duration(minutes: 30)),
    Reminder.fromDuration(const Duration(minutes: 5)),
    Reminder.fromDuration(const Duration(minutes: 10)),
    Reminder.fromDuration(const Duration(hours: 1)),
  ];

  @override
  Widget build(BuildContext context) {
    return Property(
      icon: Assets.icons.icNotification.image(),
      children: _getWidgets(context),
    );
  }

  List<Widget> _getWidgets(BuildContext context) {
    List<Widget> widgets = [];
    widgets.addAll(reminders.map((reminder) => ReminderTile(
      reminder: reminder,
      onDelete: onDelete,
      readOnly: readOnly,
    )));

    if (reminders.length < 5 && !readOnly) {
      widgets.add(AddReminderTile(
        onTap: () => _showChooseDialog(context)
      ));
    }

    return widgets;
  }

  void _showChooseDialog(BuildContext context) =>
      showModalBottomSheet(
        context: context,
        elevation: 0,
        builder: (context) => MyBottomSheet(
          children: remindersForChoose
              .where((element) => !reminders.contains(element))
              .map((reminder) => ReminderTileForChoose(onTap: onAdd, reminder: reminder))
              .toList(),
        )
      );
}

typedef ReminderCallback = Function(Reminder reminder);

class ReminderTile extends StatelessWidget {
  const ReminderTile({
    super.key,
    required this.reminder,
    this.onDelete,
    this.readOnly = false
  });

  final Reminder reminder;
  final ReminderCallback? onDelete;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
            MinutesToString.minutesToString(reminder.minutesBefore),
            style: context.textTheme.bodyLarge
        ),
        !readOnly ? IconButton(
          onPressed: () => onDelete?.call(reminder),
          icon: RotationTransition(
            turns: const AlwaysStoppedAnimation(45/360),
            child: Assets.icons.icAdd.image(),
          ),
        ) : const SizedBox.square(dimension: 30)
      ],
    );
  }
}

class ReminderTileForChoose extends StatelessWidget {
  const ReminderTileForChoose({
    super.key,
    this.onTap,
    required this.reminder
  });

  final ReminderCallback? onTap;
  final Reminder reminder;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call(reminder);
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Assets.icons.icCircle.image(height: 25, width: 25),
            const SizedBox(width: 10),
            Text(
              MinutesToString.minutesToString(reminder.minutesBefore),
              style: context.textTheme.bodyLarge
            )
          ],
        ),
      ),
    );
  }
}


class AddReminderTile extends StatelessWidget {
  const AddReminderTile({
    super.key,
    required this.onTap
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
            "Добавить уведомление",
            style: context.textTheme.bodyLarge?.copyWith(color: context.customColors.text2)
        ),
      ),
    );
  }
}


class MinutesToString {
  static String minutesToString(int minutes) {
    if (minutes == 0) return "В момент начала";

    int hours = minutes ~/ 60;
    minutes -= hours * 60;
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

    final timeString = "${_timeUnitToString(weeks)[0]} "
        "${_timeUnitToString(days)[1]} "
        "${_timeUnitToString(hours)[2]} "
        "${_timeUnitToString(minutes)[3]}".trim();

    return "За $timeString";
  }

  static List<String> _timeUnitToString(int timeUnitNum) {
    if (timeUnitNum == 0) return ["", "", "", ""];
    final List<List<String>> timeUnitWordsList = [
      ["неделя", "день", "час", "минута"],
      ["недели", "дня", "часа", "минуты"],
      ["недель", "дней", "часов", "минут"]
    ];

    List<String>? timeUnitWords;

    if (timeUnitNum % 10 == 1) {
      timeUnitWords =  timeUnitWordsList[0];
    } else if (timeUnitNum % 10 >= 2 && timeUnitNum % 10 <= 4) {
      timeUnitWords = timeUnitWordsList[1];
    } else if ((timeUnitNum >= 5 && timeUnitNum <= 20) || timeUnitNum % 10 >= 5 && timeUnitNum % 10 <= 9 || timeUnitNum % 10 == 0) {
      timeUnitWords = timeUnitWordsList[2];
    }

    if (timeUnitWords != null) {
      for (int i = 0; i < 4; i++) {
        timeUnitWords[i] = "$timeUnitNum ${timeUnitWords[i]}";
      }
      return timeUnitWords;
    }

    return ["", "", "", ""];
  }
}