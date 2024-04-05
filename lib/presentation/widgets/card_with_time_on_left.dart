import 'package:flutter/material.dart';

class TimeLeftPanel extends StatelessWidget {
  const TimeLeftPanel({
    super.key,
    required this.timeStart,
    required this.timeEnd,
    this.timePanelTopPadding = 30,
    this.timeStartTextStyle,
    this.timeEndTextStyle
  });

  final TimeOfDay timeStart;
  final TimeOfDay timeEnd;
  final double timePanelTopPadding;
  final TextStyle? timeStartTextStyle;
  final TextStyle? timeEndTextStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: timePanelTopPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(timeStart.format(context), style: timeStartTextStyle),
          Text(timeEnd.format(context), style: timeEndTextStyle)
        ],
      ),
    );
  }
}


class CardWithTimeOnLeft extends StatelessWidget {
  const CardWithTimeOnLeft({
    super.key,
    required this.timeStart,
    required this.timeEnd,
    required this.dividerColor,
    required this.child,
    this.color,
    this.timePanelTopPadding = 30,
    this.timeStartTextStyle,
    this.timeEndTextStyle
  });

  final TimeOfDay timeStart;
  final TimeOfDay timeEnd;
  final Color dividerColor;
  final Widget child;
  final Color? color;
  final double timePanelTopPadding;
  final TextStyle? timeStartTextStyle;
  final TextStyle? timeEndTextStyle;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: TimeLeftPanel(
                    timeStart: timeStart,
                    timeEnd: timeEnd,
                    timePanelTopPadding: timePanelTopPadding,
                    timeStartTextStyle: timeStartTextStyle,
                    timeEndTextStyle: timeEndTextStyle,
                  )
              ),
              VerticalDivider(thickness: 1, color: dividerColor),
              Expanded(
                flex: 5,
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}