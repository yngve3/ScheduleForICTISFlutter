import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/favorite_schedules_repository.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/favorite_schedules/pages/favorite_schedules_add/cubit/schedule_search_cubit.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/app_bar.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/schedule_subject_widget.dart';

import '../../../../../domain/models/schedule_subject/schedule_subject.dart';
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
                  const SearchField(),
                  FoundSchedulesList(list: state.searchResult),
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

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: context.customColors.text1,
      onSubmitted: (value) => context.read<ScheduleSearchCubit>().search(value),
      textInputAction: TextInputAction.search,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        labelText: "Введите группу, преподавателя или аудиторию",
      )
    );
  }
}

class FoundSchedulesList extends StatelessWidget {
  const FoundSchedulesList({
    super.key,
    required this.list
  });

  final List<ScheduleSubject> list;

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Align(
              alignment: Alignment.topLeft,
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 8,
                runSpacing: 5,
                direction: Axis.horizontal,
                children: list.map((e) => ScheduleSubjectWidget(
                    scheduleSubject: e,
                    callback: (element) {
                      context.read<ScheduleSearchCubit>().select(element);
                    }
                  )
                ).toList(),
              ),
            ),
          )
      );
  }
}