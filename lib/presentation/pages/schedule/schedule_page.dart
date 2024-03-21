import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/schedule/schedule_week.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../theme/colors.dart';
import '../../widgets/date_header.dart';
import 'cubit/schedule_cubit.dart';
import 'cubit/schedule_state.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ScheduleCubit(),
        child: const Schedule(),
      ),
    );
  }

}

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<StatefulWidget> createState() => _Schedule();
}

class _Schedule extends State<Schedule> {
  CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  void initState() {
    context.read<ScheduleCubit>().getWeekSchedule();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleCubit, ScheduleState>(
        builder: (context, state) {
          return Column(
            children: [
              DateHeader(date: state.selectedDay, studyWeek: state.weekSchedule.weekNum),
              const SizedBox(height: 10),
              TableCalendar(
                weekendDays: const [DateTime.sunday],
                headerVisible: false,
                locale: 'ru_RU',
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: state.selectedDay,
                calendarFormat: _calendarFormat,

                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: Theme.of(context).textTheme.bodyLarge!,
                  weekendStyle: Theme.of(context).textTheme.bodyLarge!,
                  dowTextFormatter: (date, locale) {
                    return DateFormat.E(locale).format(date).toUpperCase();
                  }
                ),
                startingDayOfWeek: StartingDayOfWeek.monday,

                calendarStyle: CalendarStyle(
                    isTodayHighlighted: false,
                    tablePadding: const EdgeInsets.symmetric(horizontal: 20),

                    defaultTextStyle: Theme.of(context).textTheme.bodyLarge!,
                    outsideTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: CustomColors.disabledColor),

                    selectedTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
                    selectedDecoration: const BoxDecoration(
                        color: CustomColors.accentColor,
                        shape: BoxShape.circle
                    ),

                    weekendTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: CustomColors.red
                    )
                ),

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
              )
            ],
          );
        }
    );
  }
}