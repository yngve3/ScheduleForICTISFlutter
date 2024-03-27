import 'package:flutter/material.dart';

import '../../../theme/icons.dart';
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
      icon: CustomIcons.eventBlack.image(),
      children: [
        ClickableTile(
          title: Text(
            "Дата",
            style: Theme.of(context).textTheme.bodyLarge,
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