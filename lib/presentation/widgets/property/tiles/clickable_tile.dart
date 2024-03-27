import 'package:flutter/material.dart';

class ClickableTile extends StatelessWidget {
  const ClickableTile({
    super.key,
    required this.title,
    required this.trailing,
    required this.onTileClicked,
  });

  final Widget title;
  final Widget trailing;
  final VoidCallback onTileClicked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTileClicked,
      child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 10
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              title,
              trailing
            ],
          )
      ),
    );
  }
}