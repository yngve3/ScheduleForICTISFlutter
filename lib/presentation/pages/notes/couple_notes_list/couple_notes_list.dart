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
  const CoupleNotesListPage({
    super.key,
    this.coupleID
  });

  final String? coupleID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoupleNotesListCubit()..loadState(coupleID),
      child: BlocBuilder<CoupleNotesListCubit, CoupleNotesListState>(
        builder: (context, state) {
          return Scaffold(
            appBar: MyAppBar(
              appBar: AppBar(),
              title: 'Задания',
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
                  const SizedBox(height: 10),
                  NotesList(notes: state.notes, coupleID: coupleID ?? ""),
                  FilledButton(
                    onPressed: () => context.go(Routes.addNote.path({"couple_id": coupleID})),
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
    required this.note,
    required this.coupleID
  });

  final Note note;
  final String coupleID;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go(Routes.noteInfo.path({"couple_id": coupleID, "note_id": note.id})),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(note.title, style: context.textTheme.bodyLarge),
        ),
      ),
    );
  }
}


class NotesList extends StatelessWidget {
  const NotesList({
    super.key,
    required this.notes,
    required this.coupleID
  });

  final List<Note> notes;
  final String coupleID;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: notes.map((element) => NotesListItem(
            note: element,
            coupleID: coupleID,
          )).toList(),
        ),
      ),
    );
  }
}


