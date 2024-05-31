import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';

class ImageWithTwoRowsOnRight extends StatelessWidget {
  const ImageWithTwoRowsOnRight({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle
  });

  final Widget image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          color: context.colorScheme.secondaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: image,
          ),
        ),
        Expanded(child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
        ))
      ],
    );
  }
}