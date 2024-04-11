import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/notes/note_add/cubit/note_add_cubit.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/app_bar.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/discipline_and_date.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/property/properties/input_property.dart';

import '../../../../domain/models/note_file/note_file.dart';
import '../../../../gen/assets.gen.dart';
import '../../../theme/colors.dart';
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
                        FilesProperty(files: state.files)
                      ],
                    ),
                  ),
                  FilledButton(
                    onPressed: () {
                      cubit.addNote();
                      context.pop();
                    },
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

class FilesProperty extends StatelessWidget {
  const FilesProperty({
    super.key,
    required this.files
  });

  final List<NoteFile> files;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox.square(dimension: 25, child: Assets.icons.icAttach.image()),
                const SizedBox(width: 10),
                Expanded(
                  child: Text("Вложения", style: context.textTheme.titleLarge)
                ),
                Assets.icons.icAlert.image(height: 25, width: 25)
              ],
            ),
            Wrap(
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              spacing: 10,
              runSpacing: 10,
              children: _getFileWidgets(),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _getFileWidgets() {
    final List<Widget> fileWidgets = [];
    fileWidgets.add(const AddFileButton());

    fileWidgets.addAll(files.map((file) => FileProperty(file: file)).toList());
    return fileWidgets;
  }
}

class AddFileButton extends StatelessWidget {
  const AddFileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();
        if (result != null) {
          PlatformFile file = result.files.first;
          context.read<NoteAddCubit>().addFile(file);
        }
      },
      child: Card(
        color: context.customColors.accent,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Assets.icons.icAdd.image(color: context.customColors.background),
        ),
      ),
    );
  }
}


class FileProperty extends StatelessWidget {
  const FileProperty({
    super.key,
    required this.file
  });

  final NoteFile file;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColors.grey2,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: _getIcon(),
      ),
    );
  }

  Widget _getIcon() {
    return switch(file.type!) {
      TypeOfFile.pdf => Assets.icons.icFilePdf.image(),
      TypeOfFile.doc => Assets.icons.icFileWord.image(),
      TypeOfFile.img => Assets.icons.icFileImg.image(),
      TypeOfFile.other => Assets.icons.icFile.image(),
      TypeOfFile.code => Assets.icons.icFileCode.image()
    };
  }
}



