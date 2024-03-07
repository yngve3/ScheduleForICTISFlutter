import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/app_bar.dart';

import '../../../../../domain/models/fav_schedule.dart';
import '../../../../widgets/schedule_item.dart';
import '../favorite_schedules_add/favorite_schedules_add_page.dart';

class FavoriteSchedulesListPage extends StatelessWidget {
  const FavoriteSchedulesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appBar: AppBar(),
        title: "Расписания",
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const FavoriteSchedulesAddPage()
                      )
                  ),
              icon: Image.asset("assets/icons/ic_add.png", width: 32, height: 32)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15, right: 15, left: 15),
        child: Column(
          children: [
            const Expanded(
                child: FavoriteSchedulesList()
            ),
            const SizedBox(height: 15),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Готово"),
            )
          ],
        )
      )
    );
  }
}

class FavoriteSchedulesList extends StatelessWidget {
  const FavoriteSchedulesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", true)),
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", false)),
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", false)),
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", false)),
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", false)),
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", false)),
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", false)),
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", false)),
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", false)),
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", false)),
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", false)),
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", false)),
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", false)),
      ],
    );
  }
}