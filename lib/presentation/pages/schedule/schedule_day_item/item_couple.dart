import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/schedule/schedule_day_item/schedule_day_item.dart';

import '../../../../domain/models/couple/couple_type.dart';
import '../../../../domain/models/schedule/day_schedule_item.dart';
import '../../../route/routes.dart';
import '../../../widgets/card_with_time_on_left.dart';

class ItemCouple implements ScheduleDayItem {
  const ItemCouple({
    required this.couple
  });

  final Couple couple;

  @override
  Widget buildWidget(BuildContext context) {
    return InkWell(
      onTap: () => context.go(Routes.coupleNotesList.path({"couple_id": couple.id})),
      child: CardWithTimeOnLeft(
        timeStart: couple.timeStart,
        timeEnd: couple.timeEnd,
        dividerColor: _getDividerColor(context),
        timeStartTextStyle: context.textTheme.bodyLarge,
        timeEndTextStyle: context.textTheme.bodySmall,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(couple.audiences, style: context.textTheme.bodyLarge),
                SizedBox(width: couple.audiences.isNotEmpty ? 8 : 0),
                Icon(Icons.circle, color: _getCircleColor(context)),
                const SizedBox(width: 8),
                Text(
                    couple.type.name,
                    style: context.textTheme.bodyLarge?.copyWith(
                        color: context.customColors.text2
                    )
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
    if (couple.isOnline) return context.customColors.greenIndicator;

    return context.customColors.accent;
  }

  Color _getCircleColor(BuildContext context) {
    return switch (couple.type) {
      CoupleType.laboratory => context.customColors.redIndicator,
      CoupleType.practice => context.customColors.yellowIndicator,
      CoupleType.lecture => context.customColors.greenIndicator,
      CoupleType.exam => context.customColors.text1,
      CoupleType.none => context.customColors.greenIndicator,
    };
  }
}