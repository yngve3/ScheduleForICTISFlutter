import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/property/property.dart';

class TextProperty extends StatelessWidget {
  const TextProperty({
    super.key,
    required this.children,
    this.icon
  });

  final Widget? icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Property(
      icon: icon,
      children: children,
    );
  }
}
