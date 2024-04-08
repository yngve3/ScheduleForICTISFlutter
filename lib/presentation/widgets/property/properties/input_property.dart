import 'package:flutter/cupertino.dart';

import '../../../widgets/property/property.dart';
import '../../../widgets/property/tiles/input_tile.dart';

class InputProperty extends StatelessWidget {
  const InputProperty({
    super.key,
    required this.hint,
    required this.onChanged,
    this.isMultiLines = false,
    this.icon,
    this.value = ""
  });

  final String value;
  final bool isMultiLines;
  final String hint;
  final OnTextChangedCallback onChanged;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Property(
        icon: icon,
        children: [
          InputTile(
            hint: hint,
            onChanged: onChanged,
            isMultiLines: isMultiLines,
            value: value,
          ),
        ]
    );
  }
}