import 'package:flutter/material.dart';

import '../../domain/models/couple/couple.dart';
import '../theme/colors.dart';

class CouplesItem extends StatelessWidget {
  const CouplesItem({
    super.key,
    required this.couple
  });

  final Couple couple;

  Color _getDividerColor() {
    if (couple.isOnline) return CustomColors.green;

    return CustomColors.accentColor;
  }

  Color _getCircleColor() {
    switch (couple.type) {
      case CoupleType.laboratory: return CustomColors.red;
      case CoupleType.practice: return CustomColors.yellow;
      case CoupleType.lecture: return CustomColors.green;
      case CoupleType.exam: return Colors.black;
      case CoupleType.none: return CustomColors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColors.cardBackgroundColor,
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 38),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(couple.timeStart.format(context), style: Theme.of(context).textTheme.bodyLarge),
                  Text(couple.timeEnd.format(context), style: Theme.of(context).textTheme.bodySmall)
                ],
              ),
            ),
            VerticalDivider(thickness: 1, color: _getDividerColor()),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(couple.audience, style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(width: 8),
                          Icon(Icons.circle, color: _getCircleColor()),
                          const SizedBox(width: 8),
                          Text(
                              couple.type.name,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: CustomColors.textBodyMediumColor
                              )
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                          couple.discipline,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w400
                          )
                      ),
                      const SizedBox(height: 5),
                      Text(
                          couple.lecturer,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w400
                          )
                      )
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}