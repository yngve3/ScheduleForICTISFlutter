import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/events_repository.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/app_bar.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/date_text.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/property/properties/text_property.dart';

import '../../../domain/models/schedule/day_schedule_item.dart';
import '../../../gen/assets.gen.dart';
import '../../route/routes.dart';
import '../../widgets/property/tiles/text_tile.dart';

class EventInfoPage extends StatelessWidget {
  const EventInfoPage({
    super.key,
    required this.event
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Мероприятие",
        appBar: AppBar(),
        actions: [
          IconButton(
            onPressed: () {
              EventsRepository().deleteEvent(event.id);
              context.pop();
            },
            icon: Assets.icons.icDelete.image(),
          ),
          IconButton(
              onPressed: () {
                context.pop();
                context.go(Routes.addEvent.path, extra: event);
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
            TextProperty(
              children: [
                TextTile(
                  text: event.title,
                  style: context.textTheme.titleLarge,
                )
              ],
            ),

            TextProperty(
              icon: Assets.icons.icTime.image(),
              children: [
                TextTile(
                  text: "${event.timeStart.format(context)}-${event.timeEnd.format(context)}",
                  style: context.textTheme.titleLarge,
                )
              ],
            ),

            TextProperty(
              icon: Assets.icons.icEvent.image(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: DateText(
                    date: event.date,
                    style: context.textTheme.titleLarge,
                  ),
                )
              ],
            ),

            _getWidgetOrEmpty(property: event.description, icon: Assets.icons.icList.image(), context: context),
            _getWidgetOrEmpty(property: event.location, icon: Assets.icons.icLocation.image(), context: context)
          ],
        ),
      )
    );
  }

  Widget _getWidgetOrEmpty(
      {String? property, Widget? icon, required BuildContext context}) {
    if (property == null) return const SizedBox.shrink();

    return TextProperty(
      icon: icon,
      children: [
        TextTile(
          text: property,
          style: context.textTheme.titleLarge,
        )
      ],
    );
  }
}

