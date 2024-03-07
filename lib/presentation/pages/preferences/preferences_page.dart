import 'package:flutter/material.dart';

import '../favorite_schedules/pages/favorite_schedules_list/favorite_schedules_list_page.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PreferenceTitle(title: "Расписание"),
        PreferenceItem(
          title: "Избранные расписания",
          subtitle: "Настройка быстрого доступа к расписаниям",
          onItemTapped: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => const FavoriteSchedulesListPage()
              )
          ),
        ),
        PreferenceItem(
          title: "ВПК",
          subtitle: "Выбранное ВПК будет отображаться вместе с основным расписанием",
          onItemTapped: () {},
        )
      ],
    );
  }
}

class PreferenceTitle extends StatelessWidget {
  const PreferenceTitle({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium
      ),
    );
  }
}

typedef ItemTapped = Function();

class PreferenceItem extends StatelessWidget {
  const PreferenceItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onItemTapped
  });

  final String title;
  final String subtitle;
  final ItemTapped onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
          child: ListTile(
              title: Text(title, style: Theme.of(context).textTheme.titleLarge),
              subtitle: Text(subtitle, style: Theme.of(context).textTheme.bodyMedium)
          ),
          onTap: () => onItemTapped(),
        )
    );
  }
}