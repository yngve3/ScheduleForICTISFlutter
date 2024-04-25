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
    this.isPassword = false
  });

  final String label;
  final SubmitCallback? onSubmit;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool isPassword;

  @override
  State<StatefulWidget> createState() => _InputFiledState();
}

class _InputFiledState extends State<InputField> {
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: context.customColors.text1,
      onSubmitted: (value) => widget.onSubmit?.call(value),
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType,
      obscureText: _obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        labelText: widget.label,
        labelStyle: context.textTheme.bodyLarge,
        filled: true,
        suffix: widget.isPassword ? IconButton(
          onPressed: () => _toggleShowPassword(),
          icon: Icon(_obscureText ? Icons.visibility_rounded : Icons.visibility_off_rounded),
        ) : null
      ),
    );
  }

  void _toggleShowPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}