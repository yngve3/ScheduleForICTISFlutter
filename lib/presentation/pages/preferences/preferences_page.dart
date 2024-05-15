import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/auth_repository.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';

import '../../route/routes.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text("Настройки", style: context.textTheme.headlineLarge),
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
          onItemTapped: () => context.push(Routes.favoriteSchedules.path)
        ),
        PreferenceItem(
          title: "Выход",
          subtitle: "",
          onItemTapped: () async {
            await AuthRepository().logOut();
            context.go(Routes.login.path);
          }
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
          style: context.textTheme.headlineMedium
      ),
    );
  }
}

class PreferenceItem extends StatelessWidget {
  const PreferenceItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onItemTapped
  });

  final String title;
  final String subtitle;
  final VoidCallback onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
          child: ListTile(
              title: Text(title, style: context.textTheme.titleLarge),
              subtitle: Text(subtitle, style: context.textTheme.bodyMedium)
          ),
          onTap: () => onItemTapped(),
        )
    );
  }
}