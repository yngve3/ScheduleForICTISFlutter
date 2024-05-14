import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';

typedef SubmitCallback = Function(String value);

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.label,
    this.onSubmit,
    this.textInputAction,
    this.textInputType,
    this.isPassword = false,
    this.controller,
    this.errorText,
    this.requestFocus = false,
    this.onChanged
  });

  final String label;
  final SubmitCallback? onSubmit;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool isPassword;
  final TextEditingController? controller;
  final String? errorText;
  final bool requestFocus;
  final SubmitCallback? onChanged;

  @override
  State<StatefulWidget> createState() => _InputFiledState();
}

class _InputFiledState extends State<InputField> {
  late bool _obscureText;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _obscureText = widget.isPassword;
    if (widget.requestFocus) _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.customColors.card
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        cursorColor: context.customColors.text1,
        onSubmitted: (value) => widget.onSubmit?.call(value),
        onChanged: (value) => widget.onChanged?.call(value),
        textInputAction: widget.textInputAction,
        keyboardType: widget.textInputType,
        obscureText: _obscureText,
        controller: widget.controller,
        focusNode: _focusNode,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          errorText: widget.errorText,
          labelText: widget.label,
          labelStyle: context.textTheme.bodyLarge,
          suffix: widget.isPassword ? InkWell(
            onTap: () => _toggleShowPassword(),
            child: Icon(_obscureText ? Icons.visibility_rounded : Icons.visibility_off_rounded, size: 20),
          ) : null,
        ),
      ),
    );
  }

  void _toggleShowPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}