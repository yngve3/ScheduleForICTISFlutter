import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/favorite_schedules_repository.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/favorite_schedules/pages/favorite_schedules_add/cubit/schedule_search_cubit.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/app_bar.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/search_found_list.dart';
import '../../../../widgets/search_field.dart';
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
        create: (context) => ScheduleSearchCubit(FavoriteSchedulesRepository()),
        child: BlocBuilder<ScheduleSearchCubit, ScheduleSearchState> (
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  SearchField(
                    label: "Введите группу, преподавателя или аудиторию",
                    onSubmit: (value) => context.read<ScheduleSearchCubit>().search(value),
                  ),
                  SearchFoundList(
                    list: state.searchResult,
                    onTapped: (scheduleSubject) => context.read<ScheduleSearchCubit>().select(scheduleSubject),
                  ),
                  FilledButton(
                    onPressed: state.isSaveButtonEnabled ? () => _handleSave(context) : null,
                    child: const Text("Сохранить"),
                  )
                ],
              ),
            );
          },
        ),
      )
    );
  }
}