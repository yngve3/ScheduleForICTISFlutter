import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/favorite_schedules/view/favorite_schedules_list_page.dart';

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