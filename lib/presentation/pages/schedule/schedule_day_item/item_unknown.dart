import 'package:flutter/material.dart';

class ItemUnknown extends StatelessWidget {
  const ItemUnknown({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text("unknown item"),
    );
  }
}