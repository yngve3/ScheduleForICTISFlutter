import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/notes/all_notes_list/cubit/all_notes_list_cubit.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/app_bar.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/screen.dart';

import '../../../../gen/assets.gen.dart';
import '../../../widgets/notes_list_item.dart';
import 'cubit/all_notes_list_state.dart';

class AllNotesListPage extends StatelessWidget {
  const AllNotesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllNotesListCubit()..loadNotes(),
      child: BlocBuilder<AllNotesListCubit, AllNotesListState>(
        builder: (context, state) {

          final actualNotes = state.notes
              .where((note) => note.isActual)
              .map((note) => NotesListItem(note: note, coupleID: note.coupleID, showDate: true))
              .toList();

          final pastNotes = state.notes
              .where((note) => note.isPast)
              .map((note) => NotesListItem(note: note, coupleID: note.coupleID, showDate: true))
              .toList();

          return Scaffold(
            appBar: MyAppBar(
              appBar: AppBar(),
              title: "Все задания",
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Assets.icons.icSearch.image()
                )
              ],
            ),
            body: ScrollableScreen(
              scrollable: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  actualNotes.isNotEmpty ?
                  Text("Актуальные задания", style: context.textTheme.headlineMedium)
                  : const SizedBox.shrink(),
                  Column(children: actualNotes),

                  const SizedBox(height: 10),

                  pastNotes.isNotEmpty ?
                  Text("Прошедшие задания", style: context.textTheme.headlineMedium)
                  : const SizedBox.shrink(),
                  Column(children: pastNotes),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
