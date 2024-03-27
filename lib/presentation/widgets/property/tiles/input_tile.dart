import 'package:flutter/material.dart';

typedef OnTextChangedCallback = Function(String value);

class InputTile extends StatelessWidget {
  const InputTile({
    super.key,
    required this.hint,
    required this.onChanged,
    this.isMultiLines = false,
  });

  final String hint;
  final bool isMultiLines;
  final OnTextChangedCallback onChanged;

  int? _getMaxLines() {
    if (isMultiLines) return 9;
    return 1;
  }

  int? _getMinLines() {
    if (isMultiLines) return 1;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: Colors.black,
        onChanged: onChanged,
        minLines: _getMinLines(),
        maxLines: _getMaxLines(),
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            labelStyle: Theme.of(context).textTheme.bodyLarge,
            labelText: hint
        )
    );
  }
}