import 'package:flutter/material.dart';

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