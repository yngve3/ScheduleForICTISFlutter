import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/search_schedule_screen/cubit/search_schedule_cubit.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/app_bar.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/screen.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/search_field.dart';

import '../../route/routes.dart';
import 'cubit/search_schedule_state.dart';

class SearchSchedulePage extends StatelessWidget {
  const SearchSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchScheduleCubit(),
      child: BlocBuilder<SearchScheduleCubit, SearchScheduleState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<SearchScheduleCubit>(context);
          return Scaffold(
            appBar: MyAppBar(
              appBar: AppBar(),
              title: "Поиск",
            ),
            body: ScrollableScreen(
              top: SearchField(
                categories: SearchCategory.values,
                selectedCategory: state.category,
                onChanged: (value) => cubit.search(value),
                categoryChanged: (category) => cubit.changeCategory(category),
              ),
              scrollable: SearchResult(
                onSelected: (scheduleSubject) => context.go(Routes.searchScheduleResult.path, extra: scheduleSubject),
                searchResult: state.filteredSearchResult,
                query: state.query,
              ),
            ),
          );
        },
      ),
    );
  }
}

