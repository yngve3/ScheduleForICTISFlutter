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
    this.errorText
  });

  final String label;
  final SubmitCallback? onSubmit;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool isPassword;
  final TextEditingController? controller;
  final String? errorText;

  @override
  State<StatefulWidget> createState() => _InputFiledState();
}

class _InputFiledState extends State<InputField> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: context.customColors.text1,
      onSubmitted: (value) => widget.onSubmit?.call(value),
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType,
      obscureText: _obscureText,
      controller: widget.controller,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        errorText: widget.errorText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        labelText: widget.label,
        labelStyle: context.textTheme.bodyLarge,
        suffix: widget.isPassword ? InkWell(
          onTap: () => _toggleShowPassword(),
          child: Icon(_obscureText ? Icons.visibility_rounded : Icons.visibility_off_rounded, size: 20),
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