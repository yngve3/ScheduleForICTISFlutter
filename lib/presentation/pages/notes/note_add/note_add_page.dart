import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/notes/note_add/cubit/note_add_cubit.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/app_bar.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/discipline_and_date.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/property/properties/input_property.dart';

import '../../../../domain/models/note/note.dart';
import '../../../../domain/models/schedule/day_schedule_item.dart';
import '../../../../gen/assets.gen.dart';
import 'cubit/note_add_state.dart';

class NoteAddPageData {
  final Couple? couple;
  final Note? note;

  const NoteAddPageData({
    required this.couple,
    required this.note
  });
}

class NoteAddPage extends StatelessWidget {
  const NoteAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra as NoteAddPageData;
    return BlocProvider(
      create: (context) => NoteAddCubit()
        ..loadFromCouple(data.couple)
        ..loadFromNote(data.note),
      child: BlocBuilder<NoteAddCubit, NoteAddState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<NoteAddCubit>(context);
          return Scaffold(
            appBar: MyAppBar(
              appBar: AppBar(),
              title: "Задача",
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DisciplineAndDate(
                          discipline: state.discipline,
                          date: state.date ?? DateTime.now(),
                        ),
                        const SizedBox(height: 10),
                        InputProperty(
                          hint: "Заголовок",
                          onChanged: (value) => cubit.titleChanged(value),
                        ),
                        InputProperty(
                          hint: "Описание",
                          onChanged: (value) => cubit.descriptionChanged(value),
                          isMultiLines: true,
                          icon: Assets.icons.icList.image(),
                        )
                      ],
                    ),
                  ),
                  FilledButton(
                    onPressed: () => cubit.addNote(),
                    child: const Text("Сохранить"),
                  )
                ],
              ),
            )
          );
        },
      ),
    );
  }
}

