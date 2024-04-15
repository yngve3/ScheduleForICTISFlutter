import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/notes/note_add/cubit/note_add_cubit.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/app_bar.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/discipline_and_date.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/property/properties/input_property.dart';

import '../../../../gen/assets.gen.dart';
import '../../../widgets/property/properties/files_property.dart';
import 'cubit/note_add_state.dart';

class NoteAddPage extends StatelessWidget {
  const NoteAddPage({
    super.key,
    this.coupleID,
    this.noteID
  });

  final String? coupleID;
  final int? noteID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteAddCubit()
        ..loadFromCouple(coupleID)
        ..loadFromNote(noteID),
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
                          value: state.title,
                        ),
                        InputProperty(
                          hint: "Описание",
                          onChanged: (value) => cubit.descriptionChanged(value),
                          isMultiLines: true,
                          icon: Assets.icons.icList.image(),
                          value: state.description ?? "",
                        ),
                        FilesProperty(
                          files: state.files,
                          isEditPossible: true,
                          onChosen: (file) => cubit.addFile(file),
                          onDelete: (file) => cubit.deleteFile(file),
                        )
                      ],
                    ),
                  ),
                  FilledButton(
                    onPressed: state.isButtonSaveEnabled ? () {
                      cubit.addNote();
                      context.pop();
                    } : null,
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





