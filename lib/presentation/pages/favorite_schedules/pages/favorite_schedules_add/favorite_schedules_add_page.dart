import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/favorite_schedules/pages/favorite_schedules_add/cubit/favorite_schedules_add_cubit.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/app_bar.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/search_field.dart';

import '../../../../widgets/screen.dart';
import '../../../search_schedule_screen/cubit/search_schedule_state.dart';
import 'cubit/favorite_schedules_add_state.dart';

class FavoriteSchedulesAddPage extends StatelessWidget {
  const FavoriteSchedulesAddPage({super.key});

  void _handleSave(BuildContext context) {
    context.read<FavoriteSchedulesAddCubit>().saveSelectedToDB();
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
        create: (context) => FavoriteSchedulesAddCubit(),
        child: BlocBuilder<FavoriteSchedulesAddCubit, FavoriteScheduleAddState> (
          builder: (context, state) {
            final cubit = BlocProvider.of<FavoriteSchedulesAddCubit>(context);
            return ScrollableScreen(
              top: SearchField(
                categories: SearchCategory.values,
                selectedCategory: state.category,
                onChanged: (value) => cubit.search(value),
                categoryChanged: (category) => cubit.changeCategory(category),
              ),
              scrollable: SearchResult(
                onSelected: (scheduleSubject) => cubit.select(scheduleSubject),
                searchResult: state.filteredSearchResult,
                query: state.query,
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