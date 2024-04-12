import 'package:flutter/material.dart';

import '../theme/colors.dart';

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
          color: CustomColors.grey2,
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