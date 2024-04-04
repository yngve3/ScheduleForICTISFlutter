import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';

typedef SubmitCallback = Function(String value);

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.label,
    required this.onSubmit
  });

  final String label;
  final SubmitCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: context.customColors.text1,
        onSubmitted: (value) => onSubmit(value),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          labelText: label,
        )
    );
  }
}