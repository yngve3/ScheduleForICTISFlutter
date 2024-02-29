import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/preferences/widgets/preference_item.dart';
import 'package:schedule_for_ictis_flutter/preferences/widgets/preference_title.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text("Настройки", style: Theme.of(context).textTheme.headlineLarge),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: PreferencesList(),
      ),
    );
  }
}

class PreferencesList extends StatelessWidget {
  const PreferencesList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PreferenceTitle(title: "Расписание"),
        PreferenceItem(
            title: "Избранные расписания",
            subtitle: "Настройка быстрого доступа к расписаниям"
        ),
        PreferenceItem(
            title: "ВПК",
            subtitle: "Выбранное ВПК будет отображаться вместе с основным расписанием"
        )
      ],
    );
  }
}