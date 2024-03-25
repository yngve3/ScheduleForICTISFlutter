import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/app_bar.dart';

import '../../theme/colors.dart';

class EventAddPage extends StatelessWidget {
  const EventAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appBar: AppBar(),
        title: "Мероприятие"
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 15
        ),
        child: Column(
          children: [
            const EventPropertiesFields(),
            FilledButton(
              child: const Text("Создать"),
              onPressed: () {},
            )
          ]
        ),
      ),
    );
  }
}

class EventPropertiesFields extends StatelessWidget {
  const EventPropertiesFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
          children: [
            InputField(
              hint: "Название",
              onSubmit: (value) {},
            ),
            InputField(
              hint: "Описание",
              onSubmit: (value) {},
              isMultiLines: true,
              icon: const Icon(Icons.list),
            )
          ],
        )
    );
  }

}

typedef InputFieldSubmitCallback = Function(String value);

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.hint,
    required this.onSubmit,
    this.isMultiLines = false,
    this.icon
  });

  final String hint;
  final bool isMultiLines;
  final Icon? icon;
  final InputFieldSubmitCallback onSubmit;

  int? _getMaxLines() {
    if (isMultiLines) return null;
    return 1;
  }

  int? _getMinLines() {
    if (isMultiLines) return 1;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextField(
          cursorColor: Colors.black,
          onSubmitted: onSubmit,
          minLines: _getMinLines(),
          maxLines: _getMaxLines(),
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 48,
                  vertical: 10
              ),
              labelStyle: Theme.of(context).textTheme.bodyLarge,
              labelText: hint,
              filled: true,
              focusColor: Colors.black,
              fillColor: CustomColors.cardBackgroundColor,
              prefixIcon: icon,
              border: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)
              )
          )
      ),
    );
  }
}

