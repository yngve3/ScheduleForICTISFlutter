import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';

import '../../../../domain/models/note_file/note_file.dart';
import '../../../../gen/assets.gen.dart';
import '../../icon_with_text_button.dart';
import '../../image_with_two_rows_on_right.dart';

typedef FileCallback = Function(NoteFile file);

class FilesProperty extends StatelessWidget {
  const FilesProperty({
    super.key,
    required this.files,
    this.onChosen,
    this.onDelete,
    this.isEditPossible = false
  });

  final List<NoteFile> files;
  final FileCallback? onChosen;
  final FileCallback? onDelete;
  final bool isEditPossible;

  @override
  Widget build(BuildContext context) {
    final iconColor = context.colorScheme.onSurface;
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox.square(dimension: 25, child: Assets.icons.icAttach.image(color: iconColor)),
                const SizedBox(width: 10),
                Expanded(
                    child: Text("Вложения", style: context.textTheme.titleLarge)
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Уведомление"),
                      content: const Text("Файлы будут храниться локально на ваашем устройстве.  Это означает, что они не будут синхронизированы с другими вашими устройствами и если вы удалите приложение или очистите его данные, то файл может потеряться. Если расположение файла не изменилось, то он добавится"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("ОК")
                        )
                      ],
                    ),
                  ),
                  icon: Assets.icons.icAlert.image(height: 25, width: 25, color: iconColor),
                )
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
    if (isEditPossible) fileWidgets.add(AddFileButton(onChosen: onChosen));

    fileWidgets.addAll(files.map((file) => FileTile(
      file: file,
      isEditPossible: isEditPossible,
      onDelete: onDelete
    )).toList());
    return fileWidgets;
  }
}

class AddFileButton extends StatelessWidget {
  const AddFileButton({
    super.key,
    required this.onChosen
  });

  final FileCallback? onChosen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();
        if (result != null) {
          PlatformFile file = result.files.first;
          onChosen?.call(NoteFile.fromPlatformFile(file));
        }
      },
      child: Card(
        color: context.colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Assets.icons.icAdd.image(color: context.colorScheme.onPrimary),
        ),
      ),
    );
  }
}


class FileTile extends StatelessWidget {
  const FileTile({
    super.key,
    required this.file,
    this.onDelete,
    this.isEditPossible = false
  });

  final NoteFile file;
  final bool isEditPossible;
  final FileCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.colorScheme.secondaryContainer,
      child: InkWell(
        onLongPress: () => _showBottomSheet(context),
        onTap: () => _openFile(context),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: _getIcon(context.colorScheme.onSecondaryContainer),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) => showModalBottomSheet(
    elevation: 0,
    context: context,
    builder: (context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageWithTwoRowsOnRight(
              image: _getIcon(context.colorScheme.onSecondaryContainer),
              title: file.name,
              subtitle: _getTypeName()
          ),
          const SizedBox(height: 10),
          const Divider(),
          isEditPossible ? IconWithTextButton(
              onTap: () {
                onDelete?.call(file);
                Navigator.pop(context);
              },
              icon: Assets.icons.icDelete.image(color: context.colorScheme.onSurface),
              label: "Удалить"
          ) : const SizedBox.shrink(),
          IconWithTextButton(
              onTap: () {
                _openFile(context);
                Navigator.pop(context);
              },
              icon: Assets.icons.icOpen.image(color: context.colorScheme.onSurface),
              label: "Открыть"
          ),
          IconWithTextButton(
              onTap: () {},
              icon: Assets.icons.icShare.image(color: context.colorScheme.onSurface),
              label: "Поделиться"
          ),
        ],
      ),
    ),
  );

  void _openFile(BuildContext context) async {
    final openResult = await OpenFile.open(file.path);
    String message = switch(openResult.type) {
      ResultType.noAppToOpen => "Приложений для открытия этого типа файлов на устройстве не найдено",
      ResultType.fileNotFound => "Файл не найден",
      ResultType.done => "",
      _ => openResult.message
    };

    if (message.isNotEmpty && context.mounted) _showSnackBar(context, message);
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message)
    ));
  }

  Widget _getIcon(Color color) {
    return switch(file.type!) {
      TypeOfFile.pdf => Assets.icons.icFilePdf.image(color: color),
      TypeOfFile.doc => Assets.icons.icFileWord.image(color: color),
      TypeOfFile.img => Assets.icons.icFileImg.image(color: color),
      TypeOfFile.other => Assets.icons.icFile.image(color: color),
      TypeOfFile.code => Assets.icons.icFileCode.image(color: color)
    };
  }

  String _getTypeName() {
    return switch(file.type!) {
      TypeOfFile.pdf => "PDF файл",
      TypeOfFile.doc => "Документ Microsoft Word",
      TypeOfFile.img => "Изображение",
      TypeOfFile.other => "Другое",
      TypeOfFile.code => "Программный код"
    };
  }
}

