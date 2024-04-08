import 'package:flutter/material.dart';

class TextTile extends StatelessWidget {
  const TextTile({
    super.key,
    required this.text,
    required this.style
  });

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}