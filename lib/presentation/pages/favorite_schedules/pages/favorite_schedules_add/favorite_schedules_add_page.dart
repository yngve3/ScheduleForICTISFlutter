import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/favorite_schedules/pages/favorite_schedules_add/cubit/schedule_search_cubit.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/app_bar.dart';
import '../../../../widgets/schedule_subject_widget.dart';
import '../../../../widgets/screen.dart';
import '../../../../widgets/input_field.dart';
import 'cubit/schedule_search_state.dart';

class FavoriteSchedulesAddPage extends StatelessWidget {
  const FavoriteSchedulesAddPage({super.key});

  void _handleSave(BuildContext context) {
    context.read<ScheduleSearchCubit>().saveSelectedToDB();
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Поиск расписания",
        appBar: AppBar(),
      ),
      body: BlocProvider (
        create: (context) => ScheduleSearchCubit(),
        child: BlocBuilder<ScheduleSearchCubit, ScheduleSearchState> (
          builder: (context, state) {
            return ScrollableScreen(
              top: InputField(
                label: "Введите группу, впк, преподавателя или аудиторию",
                onSubmit: (value) => context.read<ScheduleSearchCubit>().search(value),
                textInputAction: TextInputAction.search,
              ),
              scrollable: Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 8,
                  runSpacing: 5,
                  direction: Axis.horizontal,
                  children: state.searchResult.map((e) => ScheduleSubjectWidget(
                    scheduleSubject: e,
                    callback: (scheduleSubject) => context.read<ScheduleSearchCubit>().select(scheduleSubject),
                    padding: 15,
                  )
                  ).toList(),
                ),
              ),
              bottom: FilledButton(
                onPressed: state.isSaveButtonEnabled ? () => _handleSave(context) : null,
                child: const Text("Сохранить"),
              )
            );
          },
        ),
      )
    );
  }
}