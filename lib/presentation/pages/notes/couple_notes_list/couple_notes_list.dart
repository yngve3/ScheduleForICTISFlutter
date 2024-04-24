import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/notes/couple_notes_list/cubit/couple_notes_list_cubit.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/app_bar.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/date_text.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/discipline_and_date.dart';

import '../../../../domain/models/note/note.dart';
import '../../../../domain/models/schedule/day_schedule_item.dart';
import '../../../../gen/assets.gen.dart';
import '../../../route/routes.dart';
import '../../../widgets/screen.dart';
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
            body: ScrollableScreen(
              top: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DisciplineAndDate(
                    discipline: state.couple?.discipline ?? "",
                    date: state.couple?.dateTimeEnd ?? DateTime.now(),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Заданий к занятию: ${state.notes.length}",
                    style: context.textTheme.bodyMedium,
                  ),
                ],
              ),
              scrollable: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: state.notes.map((element) => NotesListItem(
                  note: element,
                  couple: state.couple,
                )).toList(),
              ),
              bottom: FilledButton(
                onPressed: () => context.go(Routes.addNote.path({"couple_id": coupleID})),
                child: const Text("Добавить задание"),
              ),
            )
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
    this.couple,
    this.showCoupleInformation = false
  });

  final Note note;
  final Couple? couple;
  final bool showCoupleInformation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go(Routes.noteInfo.path({"couple_id": couple?.id ?? "", "note_id": note.id})),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(note.title, style: context.textTheme.titleLarge),
                  SizedBox.square(
                    dimension: 25,
                    child: note.hasFiles ? Assets.icons.icAttach.image(
                        color: context.customColors.accent
                    ) : null,
                  )
                ],
              ),
              showCoupleInformation ? Column(
                children: [
                  DateText(date: note.date),
                  Text(couple?.discipline ?? "")
                ],
              ) : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}


class NotesList extends StatelessWidget {
  const NotesList({
    super.key,
    required this.notes,
    required this.couple,
    this.showCoupleInformation = false
  });

  final List<Note> notes;
  final Couple couple;
  final bool showCoupleInformation;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: notes.map((element) => NotesListItem(
            note: element,
            couple: couple,
            showCoupleInformation: showCoupleInformation,
          )).toList(),
        ),
      ),
    );
  }
}


