import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../domain/models/couple/couple.dart';
import '../../theme/colors.dart';
import '../../widgets/date_header.dart';
import '../../widgets/schedule/couples_item.dart';
import 'cubit/schedule_cubit.dart';

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
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleCubit, ScheduleState>(
        builder: (context, state) {
          return Column(
            children: [
              DateHeader(date: state.selectedDay),
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

  bool isAnimateToPage = false;

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
            isAnimateToPage = true;
            _controller.animateToPage(
                state.selectedDay.weekday - 1,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOut
            ).then((_) => isAnimateToPage = false);
          },

          child: PageView(
              controller: _controller,
              onPageChanged: (pageNum) {
                if (isAnimateToPage) return;

                context.read<ScheduleCubit>().nextOrPreviousDay(pageNum + 1);
              },
              children: pageList.map((e) => DaySchedule(pageNum: e)).toList()
          ),
        )
    );
  }
}

class DaySchedule extends StatefulWidget {
  const DaySchedule({
    super.key,
    required this.pageNum
  });

  final int pageNum;

  @override
  State<StatefulWidget> createState() => _DaySchedule();
}

class _DaySchedule extends State<DaySchedule> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      children: [
        CouplesItem(
            couple: Couple(
              timeStart: const TimeOfDay(hour: 23, minute: 0),
              timeEnd: const TimeOfDay(hour: 9, minute: 35),
              audience: "Д-212",
              type: CoupleType.practice,
              discipline: "Управление проектами разработки программного обеспечения",
              lecturer: "Скороход С. В."
            )
        ),
        CouplesItem(
            couple: Couple(
                timeStart: const TimeOfDay(hour: 8, minute: 0),
                timeEnd: const TimeOfDay(hour: 9, minute: 35),
                audience: "LMS",
                type: CoupleType.lecture,
                discipline: "Управление проектами разработки программного обеспечения",
                lecturer: "Скороход С. В."
            )
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}