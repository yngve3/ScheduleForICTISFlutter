import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';

import '../../../../gen/assets.gen.dart';
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
      icon: Assets.icons.icTime.image(color: context.customColors.text1),
      children: [
        ClickableTile(
            title: Text(
              "Время начала",
              style: context.textTheme.bodyLarge,
            ),
            trailing: Text(
              timeStart?.format(context) ?? "",
              style: context.textTheme.bodyMedium,
            ),
            onTileClicked: () async {
              final time = await _showTimePicker(context);
              onTimeStartChosen(time);
            }
        ),
        ClickableTile(
            title: Text(
              "Время конца",
              style: context.textTheme.bodyLarge,
            ),
            trailing: Text(
              timeEnd?.format(context) ?? "",
              style: context.textTheme.bodyMedium,
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

