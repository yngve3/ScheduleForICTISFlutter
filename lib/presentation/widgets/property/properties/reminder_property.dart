import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/bottom_sheet.dart';

import '../../../../domain/models/reminder/reminder.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../utils/minutes_to_string.dart';
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
            "За ${MinutesToString.minutesToString(reminder.minutesBefore)}",
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
              "За ${MinutesToString.minutesToString(reminder.minutesBefore)}",
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