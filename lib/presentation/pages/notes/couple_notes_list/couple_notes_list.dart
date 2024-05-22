import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/notes/couple_notes_list/cubit/couple_notes_list_cubit.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/app_bar.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/discipline_and_date.dart';

import '../../../route/routes.dart';
import '../../../widgets/notes_list_item.dart';
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
                    discipline: state.coupleDB?.discipline ?? "",
                    date: state.coupleDB?.dateTimeStart ?? DateTime.now(),
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
                  coupleID: state.coupleDB?.id ?? "",
                )).toList(),
              ),
              bottom: FilledButton(
                onPressed: () => context.push(Routes.addNote.path({"couple_id": coupleID})),
                child: const Text("Добавить задание"),
              ),
            )
          );
        },
      ),
    );
  }
}


