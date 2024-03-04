import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/components/app_bar.dart';
import 'package:schedule_for_ictis_flutter/favorite_schedules/view/favorite_schedules_add_page.dart';

import '../widgets/favorite_schedule_list.dart';

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