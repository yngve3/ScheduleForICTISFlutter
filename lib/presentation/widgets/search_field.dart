import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/schedule_subject_widget.dart';
import 'package:schedule_for_ictis_flutter/utils/constants/callbacks.dart';

import '../../domain/models/schedule_subject/schedule_subject.dart';
import '../pages/search_schedule_screen/cubit/search_schedule_state.dart';
import 'input_field.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.onChanged,
    required this.categories,
    required this.selectedCategory,
    required this.categoryChanged
  });

  final StringCallback onChanged;
  final CategoryCallback categoryChanged;
  final List<SearchCategory> categories;
  final SearchCategory selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputField(
            label: "Искать Группы, Преподвателей, Аудитории",
            textInputAction: TextInputAction.search,
            requestFocus: true,
            onChanged: (value) => onChanged(value)
        ),
        SizedBox(
            height: 60,
            child: ListView.separated(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 5),
              itemBuilder: (context, index) => SearchCategoryWidget(
                category: categories[index],
                isSelected: categories[index] == selectedCategory,
                categorySelected: categoryChanged,
              ),
            )
        )
      ],
    );
  }
}

class SearchResult extends StatelessWidget {
  const SearchResult({
    super.key,
    required this.onSelected,
    required this.searchResult,
    required this.query
  });

  final ScheduleSubjectCallback onSelected;
  final List<ScheduleSubject> searchResult;
  final String query;

  @override
  Widget build(BuildContext context) {
    if (searchResult.isEmpty && query.isNotEmpty) {
      return Center(
        child: Text("По вашему запросу ничего не найдено", style: context.textTheme.titleLarge),
      );
    } else if (searchResult.isEmpty && query.isEmpty) {
      return Center(
        child: Text("Введите текст, чтобы начать поиск", style: context.textTheme.titleLarge),
      );
    } else {
      return Wrap(
        spacing: 10,
        children: searchResult.map((element) =>
            ScheduleSubjectWidget(
              padding: 15,
              scheduleSubject: element,
              onTap: onSelected,
            )
        ).toList(),
      );
    }
  }
}


class SearchCategoryWidget extends StatelessWidget {
  const SearchCategoryWidget({
    super.key,
    required this.category,
    required this.isSelected,
    required this.categorySelected
  });

  final SearchCategory category;
  final bool isSelected;
  final CategoryCallback categorySelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      onSelected: (selected) => categorySelected(category),
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
        SearchCategory.audiences => "Аудитории",
        SearchCategory.vpks => "ВПК"
      };
}
