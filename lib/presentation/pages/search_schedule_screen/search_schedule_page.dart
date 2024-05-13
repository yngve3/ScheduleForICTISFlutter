import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/search_schedule_screen/cubit/search_schedule_cubit.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/app_bar.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/input_field.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/schedule_subject_widget.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/screen.dart';

import '../../../domain/models/schedule_subject/schedule_subject.dart';
import 'cubit/search_schedule_state.dart';

class SearchSchedulePage extends StatelessWidget {
  const SearchSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchScheduleCubit(),
      child: BlocBuilder<SearchScheduleCubit, SearchScheduleState>(
        builder: (context, state) {
          const categories = SearchCategory.values;
          return Scaffold(
            appBar: MyAppBar(
              appBar: AppBar(),
              title: "Поиск",
            ),
            body: ScrollableScreen(
              top: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: "searchField",
                    child: InputField(
                      label: "Искать Группы, Преподвателей, Аудитории",
                      textInputAction: TextInputAction.search,
                      onSubmit: (value) => context.read<SearchScheduleCubit>().search(value),
                      requestFocus: true,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: ListView.separated(
                      itemCount: categories.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: 5),
                      itemBuilder: (context, index) => CategoryName(
                        category: categories[index],
                        isSelected: categories[index] == state.category
                      ),
                    )
                  )
                ],
              ),
              scrollable: FilteredSearchResult(
                title: "Категории",
                filteredSearchResult: state.searchResults,
              ),
            ),
          );
        },
      ),
    );
  }
}

class FilteredSearchResult extends StatelessWidget {
  const FilteredSearchResult({
    super.key,
    required this.title,
    required this.filteredSearchResult
  });

  final String title;
  final List<ScheduleSubject> filteredSearchResult;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.textTheme.titleLarge),
        const SizedBox(height: 10),
        Wrap(
          spacing: 5,
          children: filteredSearchResult.map((element) =>
              ScheduleSubjectWidget(
                scheduleSubject: element,
                callback: (scheduleSubject) {}
              )
          ).toList(),
        )
      ],
    );
  }
}


class CategoryName extends StatelessWidget {
  const CategoryName({
    super.key,
    required this.category,
    required this.isSelected
  });

  final SearchCategory category;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      onSelected: (selected) => context.read<SearchScheduleCubit>().changeCategory(category) ,
      label: Text(_getCategoryName(category), style: context.textTheme.bodyMedium?.copyWith(color: _getTextColor(context))),
      selected: isSelected,
      selectedColor: context.customColors.accent,
      disabledColor: context.customColors.card,
      backgroundColor: context.customColors.card,
      showCheckmark: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      side: BorderSide.none,
    );
  }

  Color _getTextColor(BuildContext context) =>
    isSelected ? context.customColors.background : context.customColors.text1;

  String _getCategoryName(SearchCategory category) =>
      switch(category) {
        SearchCategory.all => "Все категории",
        SearchCategory.groups => "Группы",
        SearchCategory.lectors => "Преподаватели",
        SearchCategory.audiences => "Аудитории"
      };
}

