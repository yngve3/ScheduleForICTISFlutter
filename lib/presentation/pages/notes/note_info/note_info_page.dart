import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/app_bar.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/discipline_and_date.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/property/properties/text_property.dart';

import '../../../../gen/assets.gen.dart';
import '../../../route/routes.dart';
import '../../../widgets/property/tiles/text_tile.dart';
import 'cubit/note_info_cubit.dart';
import 'cubit/note_info_state.dart';

class NoteInfoPage extends StatelessWidget {
  const NoteInfoPage({
    super.key,
    required this.coupleID,
    required this.noteID
  });

  final String coupleID;
  final int noteID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteInfoCubit()..loadNote(noteID, coupleID),
      child: BlocBuilder<NoteInfoCubit, NoteInfoState>(
        builder: (context, state) {
          return Scaffold(
            appBar: MyAppBar(
              appBar: AppBar(),
              title: "Задание",
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<NoteInfoCubit>().deleteNote();
                    context.pop();
                  },
                  icon: Assets.icons.icDelete.image(),
                ),
                IconButton(
                    onPressed: () {
                      context.pop();
                      context.go(Routes.addNote.path({"couple_id": coupleID}), extra: noteID);
                    },
                    icon: Assets.icons.icEdit.image()
                )
              ],
            ),
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DisciplineAndDate(
                      discipline: state.discipline,
                      date: state.date ?? DateTime.now(),
                    ),
                    const SizedBox(height: 10),
                    TextProperty(
                      children: [
                        TextTile(text: state.title, style: context.textTheme.bodyLarge),
                      ],
                    ),
                    _getWidgetOrEmpty(
                      property: state.description,
                      style: context.textTheme.bodyLarge,
                      icon: Assets.icons.icList.image()
                    )
                  ],
                )
            ),
          );
        },
      )
    );
  }

  Widget _getWidgetOrEmpty({String? property, TextStyle? style, Widget? icon}) {
    if (property == null) return const SizedBox.shrink();

    return TextProperty(
      icon: icon,
      children: [
        TextTile(
          text: property,
          style: style,
        ),
      ]
    );
  }
}
