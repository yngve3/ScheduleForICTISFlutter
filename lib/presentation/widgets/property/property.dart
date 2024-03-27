import 'package:flutter/material.dart';

class Property extends StatelessWidget {
  const Property({
    super.key,
    required this.children,
    this.icon,
  });

  final Widget? icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 15, vertical: 5
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox.square(
                dimension: 25,
                child: icon,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: children
              ),
            )
          ],
        ),
      ),
    );
  }
}