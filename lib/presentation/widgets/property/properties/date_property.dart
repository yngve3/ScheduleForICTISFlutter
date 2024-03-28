import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';

import '../../../../gen/assets.gen.dart';
import '../../../widgets/date_text.dart';
import '../../../widgets/property/property.dart';
import '../../../widgets/property/tiles/clickable_tile.dart';

typedef OnDateChosenCallback = Function(DateTime? date);

class DateProperty extends StatelessWidget {
  const DateProperty({
    super.key,
    required this.onDateChosen,
    this.date,
  });

  final DateTime? date;
  final OnDateChosenCallback onDateChosen;

  Future<DateTime?> _showDatePicker(BuildContext context) {
    return showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Property(
      icon: Assets.icons.icEvent.image(color: context.customColors.text1),
      children: [
        ClickableTile(
          title: Text(
            "Дата",
            style: context.textTheme.bodyLarge,
          ),
          trailing: DateText(date: date),
          onTileClicked: () async {
            final date = await _showDatePicker(context);
            onDateChosen(date);
          },
        ),
      ],
    );
  }
}