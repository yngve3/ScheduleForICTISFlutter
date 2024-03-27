import 'package:flutter/material.dart';

import '../../../theme/icons.dart';
import '../../../widgets/property/property.dart';
import '../../../widgets/property/tiles/clickable_tile.dart';

typedef OnTimeChosenCallback = Function(TimeOfDay? dateTime);

class TimeProperty extends StatelessWidget {
  const TimeProperty({
    super.key,
    required this.onTimeStartChosen,
    required this.onTimeEndChosen,
    this.timeStart,
    this.timeEnd,
  });

  final TimeOfDay? timeStart;
  final TimeOfDay? timeEnd;
  final OnTimeChosenCallback onTimeStartChosen;
  final OnTimeChosenCallback onTimeEndChosen;

  Future<TimeOfDay?> _showTimePicker(BuildContext context) {
    return showTimePicker(
        context: context,
        initialTime: TimeOfDay.now()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Property(
      icon: CustomIcons.time.image(),
      children: [
        ClickableTile(
            title: Text(
              "Время начала",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: Text(
              timeStart?.format(context) ?? "",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            onTileClicked: () async {
              final time = await _showTimePicker(context);
              onTimeStartChosen(time);
            }
        ),
        ClickableTile(
            title: Text(
              "Время конца",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: Text(
              timeEnd?.format(context) ?? "",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            onTileClicked: () async {
              final time = await _showTimePicker(context);
              onTimeEndChosen(time);
            }
        )
      ],
    );
  }
}