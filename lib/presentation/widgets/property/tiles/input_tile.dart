import 'package:flutter/material.dart';

typedef OnTextChangedCallback = Function(String value);

class InputTile extends StatefulWidget {
  const InputTile({
    super.key,
    required this.hint,
    required this.onChanged,
    this.value = "",
    this.isMultiLines = false,
  });

  final String value;
  final String hint;
  final bool isMultiLines;
  final OnTextChangedCallback onChanged;

  @override
  State<InputTile> createState() => _InputTileState();
}

class _InputTileState extends State<InputTile> {

  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      cursorColor: Colors.black,
      onChanged: widget.onChanged,
      minLines: _getMinLines(),
      maxLines: _getMaxLines(),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          labelStyle: Theme.of(context).textTheme.bodyLarge,
          labelText: widget.hint
      ),
    );
  }

  int? _getMaxLines() {
    if (widget.isMultiLines) return 9;
    return 1;
  }

  int? _getMinLines() {
    if (widget.isMultiLines) return 1;
    return null;
  }
}
