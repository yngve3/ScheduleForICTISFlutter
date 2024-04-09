import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/notes/couple_notes_list/cubit/couple_notes_list_cubit.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/notes/note_add/note_add_page.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/app_bar.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/discipline_and_date.dart';

import '../../../../domain/models/note/note.dart';
import '../../../../domain/models/schedule/day_schedule_item.dart';
import '../../../route/routes.dart';
import 'cubit/couple_notes_list_state.dart';

class CoupleNotesListPage extends StatelessWidget {
  const CoupleNotesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final couple = GoRouterState.of(context).extra as Couple?;
    return BlocProvider(
      create: (context) => CoupleNotesListCubit()..loadState(couple),
      child: BlocBuilder<CoupleNotesListCubit, CoupleNotesListState>(
        builder: (context, state) {
          return Scaffold(
            appBar: MyAppBar(
              appBar: AppBar(),
              title: 'Задачи',
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DisciplineAndDate(
                    discipline: state.couple?.discipline ?? "",
                    date: state.couple?.date ?? DateTime.now(),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Заданий к занятию: ${state.notes.length}",
                    style: context.textTheme.bodyMedium,
                  ),
                  NotesList(notes: state.notes),
                  FilledButton(
                    onPressed: () => context.go(Routes.addNote.path, extra: NoteAddPageData(couple: state.couple, note: null)),
                    child: const Text("Добавить задание"),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class NotesListItem extends StatelessWidget {
  const NotesListItem({
    super.key,
    required this.note
  });

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(note.text, style: context.textTheme.bodyLarge),
    );
  }
}


class NotesList extends StatelessWidget {
  const NotesList({
    super.key,
    required this.notes
  });

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: notes.map((element) => NotesListItem(note: element)).toList(),
        ),
      ),
    );
  }
}


