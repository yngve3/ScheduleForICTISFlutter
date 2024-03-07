import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../theme/colors.dart';
import '../../widgets/date_header.dart';
import 'cubit/schedule_cubit.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Schedule(),
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
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleCubit, ScheduleState>(
        builder: (context, state) {
          return Column(
            children: [
              DateHeader(date: state.selectedDay),
              TableCalendar(
                weekendDays: const [],
                headerVisible: false,
                locale: 'ru_RU',
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: state.selectedDay,
                calendarFormat: _calendarFormat,

                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: Theme.of(context).textTheme.bodyLarge!,
                ),
                daysOfWeekHeight: 42,
                startingDayOfWeek: StartingDayOfWeek.monday,

                calendarStyle: CalendarStyle(
                    isTodayHighlighted: false,
                    tablePadding: const EdgeInsets.symmetric(horizontal: 15),

                    defaultTextStyle: Theme.of(context).textTheme.bodyLarge!,
                    outsideTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: CustomColors.disabledColor),

                    selectedTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
                    selectedDecoration: const BoxDecoration(
                        color: CustomColors.accentColor,
                        shape: BoxShape.circle
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
              WeekSchedule(selectedDay: state.selectedDay)
            ],
          );
        }
    );
  }
}

class WeekSchedule extends StatefulWidget {
  WeekSchedule({
    super.key,
    required this.selectedDay
  });

  DateTime selectedDay;

  @override
  State<StatefulWidget> createState() => _WeekSchedule();
}

class _WeekSchedule extends State<WeekSchedule> {

  late PageController _controller;
  final List<int> pageList = [1, 2, 3, 4, 5, 6, 7];

  @override
  void initState() {
    _controller = PageController(
        initialPage: widget.selectedDay.weekday - 1
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: BlocListener<ScheduleCubit, ScheduleState> (
          // Когда пользователь меняет дату на календаре, меняется состояние,
          // что тригерит слушатель и страница меняется.
          // Когда пользователь меняет страницу сам свайпом, то состояние также
          // сменяется, что опять же тригерит слушатель и чтобы логика смены
          // страницы не вызывалась еще раз, ведь страница уже сменена,
          // нужен код ниже
          listenWhen: (previousState, state) {
            return previousState.selectedDay.weekday - 1 == _controller.page;
          },
          listener: (context, state) {
            _controller.animateToPage(
                state.selectedDay.weekday - 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut
            );
          },
          child: PageView(
              controller: _controller,
              onPageChanged: (pageNum) {
                context.read<ScheduleCubit>().nextOrPreviousDay(pageNum + 1);
              },
              children: pageList.map((e) => DaySchedule(pageNum: e)).toList()
          ),
        )
    );
  }
}

class DaySchedule extends StatelessWidget {
  const DaySchedule({
    super.key,
    required this.pageNum
  });

  final int pageNum;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        children: const [
          CouplesItem(),
        ],
      )
    );
  }
}

class CouplesItem extends StatelessWidget {
  const CouplesItem({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Text("08:00", style: Theme.of(context).textTheme.bodyLarge),
                  Text("09:35", style: Theme.of(context).textTheme.bodySmall)
                ],
              ),
            ),
            const VerticalDivider(thickness: 2, color: CustomColors.accentColor),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Д-212", style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(width: 8),
                          const Icon(Icons.circle, color: Colors.green),
                          const SizedBox(width: 8),
                          Text(
                              "Лекция",
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: CustomColors.textBodyMediumColor
                              )
                          )
                        ],
                      ),
                      Text(
                          "Управление проектами разработки программного обеспечения",
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w400
                          )
                      ),
                      Text(
                          "Скороход С. В.",
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