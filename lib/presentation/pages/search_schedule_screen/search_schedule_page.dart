import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/app_bar.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/input_field.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/screen.dart';

class SearchSchedulePage extends StatelessWidget {
  const SearchSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appBar: AppBar(),
        title: "Поиск",
      ),
      body: const ScrollableScreen(
        top: Column(
          children: [
            Hero(
              tag: "searchField",
              child: InputField(
                label: "Искать Группы, Преподвателей, Аудитории",
                textInputAction: TextInputAction.search,
              ),
            ),
            Wrap(
              children: [

              ],
            )
          ],
        ),
        scrollable: Placeholder(),
      ),
    );
  }
}
