import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schedule_for_ictis_flutter/themes/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Calendar(),
    );
  }

}

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<StatefulWidget> createState() => _Calendar();

}

class _Calendar extends State<Calendar> {

  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateHeader(date: _selectedDay),
        TableCalendar(
          weekendDays: const [],
          daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: Theme.of(context).textTheme.bodyLarge!,
          ),
          daysOfWeekHeight: 42,
          headerVisible: false,
          startingDayOfWeek: StartingDayOfWeek.monday,
          locale: 'ru_RU',
          calendarStyle: CalendarStyle(
            tablePadding: const EdgeInsets.symmetric(horizontal: 15),
              isTodayHighlighted: false,
              selectedTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
              defaultTextStyle: Theme.of(context).textTheme.bodyLarge!,
              outsideTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: CustomColors.disabledColor),
              selectedDecoration: const BoxDecoration(
                  color: CustomColors.accentColor,
                  shape: BoxShape.circle
              )
          ),
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            }
          },
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ),
      ],
    );
  }

}

class DateHeader extends StatelessWidget {
  DateHeader({
    super.key,
    required this.date,
    this.studyWeek = 1
  });

  final DateTime date;
  final int studyWeek;
  final DateFormat dateFormat = DateFormat("EEEE, d MMMM", 'ru_RU');

  @override
  Widget build(BuildContext context) {
    String formattedDate = dateFormat.format(date).firstSymToUpperCase();
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: ListTile(
        title: Text(formattedDate, style: Theme.of(context).textTheme.headlineLarge),
        subtitle: Text("Учебная неделя №$studyWeek"),
      ),
    );
  }

}

extension SymbolsCaseChanging on String {
  String firstSymToUpperCase() {
    return this[0].toUpperCase() + substring(1);
  }
}