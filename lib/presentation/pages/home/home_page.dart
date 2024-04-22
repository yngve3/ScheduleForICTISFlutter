import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/home/cubit/home_page_cubit.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/notes/couple_notes_list/couple_notes_list.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/schedule/schedule_day_item/schedule_day_item_widget_factory.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/date_header.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/screen.dart';

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
              buttonIsVisible: false
            ),
            scrollable: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    child: Card(
                      elevation: 0,
                      surfaceTintColor: Colors.white,
                      color: context.customColors.background,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: context.customColors.card, width: 2),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            SizedBox(width: 10),
                            Text("Искать Группы, Преподвателей, Аудитории")
                          ],
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10),
                Text("Ближайшие события", style: context.textTheme.headlineMedium),
                Column(
                  children: state.scheduleItems
                      .map((element) => ScheduleDayItemWidgetFactory.create(element))
                      .toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Задания", style: context.textTheme.headlineMedium),
                    TextButton(
                      onPressed: () {},
                      child: Text("ПОКАЗАТЬ ВСЕ", style: context.textTheme.bodyLarge?.copyWith(color: context.customColors.accent))
                    ),
                  ],
                ),
                Column(
                  children: state.notes
                      .map((e) => NotesListItem(note: e, coupleID: e.coupleID))
                      .toList(),
                )
              ],
            )
          );
        },
      ),
    );
  }
}
