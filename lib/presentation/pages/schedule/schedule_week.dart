import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/schedule/schedule_day.dart';

import 'cubit/schedule_cubit.dart';
import 'cubit/schedule_state.dart';

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