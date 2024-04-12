import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';

class IconWithTextButton extends StatelessWidget {
  const IconWithTextButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap
  });

  final Widget icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 10),
            Text(label, style: context.textTheme.bodyLarge)
          ],
        ),
      ),
    );
  }
}