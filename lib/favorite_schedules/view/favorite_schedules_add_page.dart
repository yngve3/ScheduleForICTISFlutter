import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/themes/colors.dart';

class FavoriteSchedulesAddPage extends StatelessWidget {
  const FavoriteSchedulesAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
            "Поиск расписания",
            style: Theme.of(context).textTheme.headlineLarge
        ),
        leading: IconButton(
            icon: Image.asset("assets/icons/ic_back_arrow.png", width: 32, height: 32),
            onPressed: ()  => Navigator.of(context).pop()
        )
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            SearchField()
          ],
        ),
      )
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        labelText: "Введите группу, преподавателя или аудиторию",
        filled: true,
        fillColor: CustomColors.cardBackgroundColor,
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10)
        )
      )
    );
  }

}