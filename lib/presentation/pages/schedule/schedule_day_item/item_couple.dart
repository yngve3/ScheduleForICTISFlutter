import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';

import '../../../../domain/models/couple/couple_type.dart';
import '../../../../domain/models/schedule/day_schedule_item.dart';
import '../../../route/routes.dart';
import '../../../theme/colors.dart';
import '../../../widgets/card_with_time_on_left.dart';

class ItemCouple extends StatelessWidget {
  const ItemCouple({
    super.key,
    required this.couple,
    this.showIndicator = false,
    this.onIndicatorEnd,
    this.isTouchable = true
  });

  final Couple couple;
  final bool showIndicator;
  final VoidCallback? onIndicatorEnd;
  final bool isTouchable;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => isTouchable ? context.push(Routes.coupleNotesList.path({"couple_id": couple.id})) : null,
      child: CardWithTimeOnLeft(
        indicatorDuration: couple.duration,
        indicatorInitPercentage: couple.percent,
        onIndicatorEnd: onIndicatorEnd,
        showIndicator: showIndicator,
        timeStart: TimeOfDay.fromDateTime(couple.dateTimeStart),
        timeEnd: TimeOfDay.fromDateTime(couple.dateTimeEnd),
        dividerColor: _getDividerColor(context),
        timeStartTextStyle: context.textTheme.bodyLarge,
        timeEndTextStyle: context.textTheme.bodySmall,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(couple.audiences.split(",")[0], style: context.textTheme.bodyLarge),
                SizedBox(width: couple.audiences.isNotEmpty ? 8 : 0),
                Icon(Icons.circle, color: _getCircleColor(context)),
                const SizedBox(width: 8),
                Text(
                    couple.type.name,
                    style: context.textTheme.bodyLarge
                )
              ],
            ),
            const SizedBox(height: 5),
            Text(
                couple.discipline,
                style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w400
                )
            ),
            const SizedBox(height: 5),
            Text(
                couple.lecturers,
                style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400
                )
            )
          ],
        ),
      ),
    );
  }
  Color _getDividerColor(BuildContext context) {
    if (couple.isOnline) return CustomColors.green;
    return CustomColors.blue;
  }

  Color _getCircleColor(BuildContext context) {
    return switch (couple.type) {
      CoupleType.laboratory => CustomColors.red,
      CoupleType.practice => CustomColors.yellow,
      CoupleType.lecture => CustomColors.green,
      CoupleType.exam => Colors.black,
      CoupleType.none => CustomColors.green,
    };
  }
}