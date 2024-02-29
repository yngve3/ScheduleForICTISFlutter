import 'package:flutter/material.dart';

class PreferenceItem extends StatelessWidget {
  const PreferenceItem({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        color: const Color(0xFFF6F6F6),
        margin: const EdgeInsets.only(top: 10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        child: InkWell(
          child: ListTile(
              title: Text(title, style: Theme.of(context).textTheme.titleLarge),
              subtitle: Text(subtitle, style: Theme.of(context).textTheme.bodyMedium)
          ),
          onTap: () {},
        )
    );
  }
}