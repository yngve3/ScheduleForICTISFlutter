import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';

import '../../domain/models/note/note.dart';
import '../../gen/assets.gen.dart';
import '../route/routes.dart';
import 'date_text.dart';

class NotesListItem extends StatelessWidget {
  const NotesListItem({
    super.key,
    required this.note,
    required this.coupleID,
    this.showDate = false
  });

  final Note note;
  final String coupleID;
  final bool showDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go(Routes.noteInfo.path({"couple_id": coupleID, "note_id": note.id})),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              showDate ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DateText(date: note.date),
                  Text(
                    "${note.date.hour}:${note.date.minute}",
                    style: context.textTheme.bodyMedium?.copyWith(color: context.customColors.accent),
                  )
                ],
              ) : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}