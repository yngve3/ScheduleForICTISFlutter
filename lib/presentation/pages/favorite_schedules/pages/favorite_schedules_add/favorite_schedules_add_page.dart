import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/app_bar.dart';

import '../../../../../domain/models/fav_schedule.dart';
import '../../../../theme/colors.dart';
import '../../../../widgets/schedule_item.dart';

class FavoriteSchedulesAddPage extends StatelessWidget {
  const FavoriteSchedulesAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Поиск расписания",
        appBar: AppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            const SearchField(),
            const FoundSchedulesList(),
            FilledButton(
              onPressed: () => context.pop(),
              child: const Text("Сохранить"),
            )
          ],
        ),
      )
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  void _handleSubmit(value, context) {

  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      onSubmitted: (value) => _handleSubmit(value, context),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        labelText: "Введите группу, преподавателя или аудиторию",
        filled: true,
        focusColor: Colors.black,
        fillColor: CustomColors.cardBackgroundColor,
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10)
        )
      )
    );
  }
}

class FoundSchedulesList extends StatelessWidget{
  const FoundSchedulesList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Align(
              alignment: Alignment.topLeft,
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 8,
                runSpacing: 5,
                direction: Axis.horizontal,
                children: [
                  ScheduleItem(favSchedule: FavSchedule("КТбо4-1", false), padding: 10),
                  ScheduleItem(favSchedule: FavSchedule("КТбо4-10", false), padding: 10),
                  ScheduleItem(favSchedule: FavSchedule("КТбо4-11", false), padding: 10),
                  ScheduleItem(favSchedule: FavSchedule("КТбо4-15", false), padding: 10),
                  ScheduleItem(favSchedule: FavSchedule("Проскуряков", true), padding: 10),
                ],
              ),
            ),
          )
      );
  }
}