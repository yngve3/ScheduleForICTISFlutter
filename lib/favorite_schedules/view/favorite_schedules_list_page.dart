import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/favorite_schedules/view/favorite_schedules_add_page.dart';

import '../widgets/favorite_schedule_list.dart';

class FavoriteSchedulesListPage extends StatelessWidget {
  const FavoriteSchedulesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
            "Расписания",
            style: Theme.of(context).textTheme.headlineLarge
        ),
        leading: IconButton(
            icon: Image.asset("assets/icons/ic_back_arrow.png", width: 32, height: 32),
            onPressed: ()  => Navigator.of(context).pop()
        ),
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