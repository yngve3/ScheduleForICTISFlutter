import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/favorite_schedules/pages/favorite_schedules_add/cubit/schedule_search_cubit.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/app_bar.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/schedule_item.dart';

import '../../../../../domain/models/schedule_subject/schedule_subject.dart';
import '../../../../theme/colors.dart';
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
      cursorColor: Colors.black,
      onSubmitted: (value) => context.read<ScheduleSearchCubit>().search(value),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        labelText: "Введите группу, преподавателя или аудиторию",
        filled: true,
        focusColor: Colors.black,
        fillColor: CustomColors.cardBackgroundColor,
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10)
        )
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
                children: list.map((e) => ScheduleItem(
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