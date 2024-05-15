import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/schedule/schedule_week.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/src/table_calendar/table_calendar_theme.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../gen/assets.gen.dart';
import '../../route/routes.dart';
import '../../widgets/date_header.dart';
import 'cubit/schedule_cubit.dart';
import 'cubit/schedule_state.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Schedule(),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        distance: 70,
        type: ExpandableFabType.up,
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: Assets.icons.icAdd.image(color: context.customColors.background),
          fabSize: ExpandableFabSize.regular,
        ),
        closeButtonBuilder: RotateFloatingActionButtonBuilder(
          child: RotationTransition(
              turns: const AlwaysStoppedAnimation(45/360),
              child: Assets.icons.icAdd.image(color: context.customColors.background)
          ),
          fabSize: ExpandableFabSize.regular,
        ),
        children: [
          FloatingActionButton.small(
            heroTag: null,
            onPressed: () => context.push(Routes.addEvent.path),
            child: Assets.icons.icEvent.image(color: context.customColors.background),
          ),
          FloatingActionButton.small(
            heroTag: null,
            onPressed: () {},
            child: Assets.icons.icTask.image(color: context.customColors.background),
          ),
        ],
      )
    );
  }

}

class Schedule extends StatefulWidget {
  const Schedule({
    super.key,
    this.isTouchable = true
  });

  final bool isTouchable;

  @override
  State<StatefulWidget> createState() => _Schedule();
}

class _Schedule extends State<Schedule> {
  CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  Widget build(BuildContext context) {
    final calendarStyle = Theme.of(context).extension<TableCalendarTheme>()!.calendarStyle;
    final daysOfWeekStyle = Theme.of(context).extension<TableCalendarTheme>()!.daysOfWeekStyle;
    final headerVisible = Theme.of(context).extension<TableCalendarTheme>()!.headerVisible;

    return BlocBuilder<ScheduleCubit, ScheduleState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: DateHeader(
                  date: state.selectedDay,
                  studyWeek: state.weekSchedule.weekNumber.studyWeekNumber,
                  buttonIsVisible: !isSameDay(DateTime.now(), state.selectedDay),
                  onButtonToCurrentDateTapped: () =>
                      context.read<ScheduleCubit>().selectDay(DateTime.now()),
                ),
              ),
              const SizedBox(height: 10),
              TableCalendar(
                weekendDays: const [DateTime.sunday],
                startingDayOfWeek: StartingDayOfWeek.monday,

                headerVisible: headerVisible,
                locale: 'ru_RU',

                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: state.selectedDay,
                calendarFormat: _calendarFormat,

                daysOfWeekStyle: daysOfWeekStyle,
                calendarStyle: calendarStyle,

                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(state.selectedDay, selectedDay)) {
                    context.read<ScheduleCubit>().selectDay(selectedDay);
                  }
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },

                selectedDayPredicate: (day) {
                  return isSameDay(state.selectedDay, day);
                },
              ),
              WeekScheduleWidget(
                selectedDay: state.selectedDay,
                weekSchedule: state.weekSchedule,
                isTouchable: widget.isTouchable,
              )
            ],
          );
        }
    );
  }
}
