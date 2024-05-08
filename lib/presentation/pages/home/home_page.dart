import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/home/cubit/home_page_cubit.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/schedule/schedule_day_item/schedule_day_item_widget_factory.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/date_header.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/screen.dart';

import '../../../gen/assets.gen.dart';
import '../../route/routes.dart';
import '../../widgets/notes_list_item.dart';
import 'cubit/home_page_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit()..loadState(),
      child: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          return ScrollableScreen(
            top: DateHeader(
              date: DateTime.now(),
              buttonIsVisible: false,
              studyWeek: state.studyWeekNumber,
            ),
            scrollable: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: "searchField",
                  child: GestureDetector(
                    onTap: () => context.go(Routes.searchSchedule.path),
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 2, color: context.customColors.card)
                          ),
                          child: Row(
                            children: [
                              Assets.icons.icSearch.image(height: 25, width: 25),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "Искать Группы, Преподвателей, Аудитории",
                                  style: context.textTheme.bodyLarge,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                ),
                              )
                            ],
                          )
                      )
                  ),
                ),
                const SizedBox(height: 10),
                Text("Ближайшие события", style: context.textTheme.headlineMedium),
                Column(
                  children: state.scheduleItems
                      .map((element) => ScheduleDayItemWidgetFactory.create(element, showIndicator: true, onIndicatorEnd: () => context.read<HomePageCubit>().loadState()))
                      .toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Задания", style: context.textTheme.headlineMedium),
                    TextButton(
                      onPressed: () => context.go(Routes.allNotes.path),
                      child: Text("ПОКАЗАТЬ ВСЕ", style: context.textTheme.bodyLarge?.copyWith(color: context.customColors.accent))
                    ),
                  ],
                ),
                Column(
                  children: state.notes.map((note) => NotesListItem(note: note, coupleID: note.coupleID, showDate: true)).toList()
                )
              ],
            )
          );
        },
      ),
    );
  }
}
