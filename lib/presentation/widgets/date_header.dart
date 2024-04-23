import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/date_text.dart';

import '../../gen/assets.gen.dart';

class DateHeader extends StatelessWidget {
  const DateHeader({
    super.key,
    required this.date,
    required this.buttonIsVisible,
    this.onButtonToCurrentDateTapped,
    this.studyWeek
  });

  final DateTime date;
  final int? studyWeek;
  final VoidCallback? onButtonToCurrentDateTapped;
  final bool buttonIsVisible;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DateText(date: date, style: Theme.of(context).textTheme.headlineLarge),
              Text(_getSubtitle()),
            ],
          ),
          _getButton()
        ],
      ),
    );
  }

  String _getSubtitle() {
    if (studyWeek != null) {
      return "Учебная неделя №$studyWeek";
    } else {
      return "Учебная группа не выбрана";
    }
  }

  Widget _getButton() {
    return buttonIsVisible ? IconButton(
      icon: Assets.icons.icEvent.image(),
      onPressed: onButtonToCurrentDateTapped,
    ) : const SizedBox.shrink();
  }
}