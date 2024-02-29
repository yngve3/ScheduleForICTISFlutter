import 'package:flutter/material.dart';

class FavoriteSchedulesListPage extends StatelessWidget {
  const FavoriteSchedulesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
              "Расписания",
              style: Theme.of(context).textTheme.headlineLarge
          ),
        ),
        leading: IconButton(
            icon: Image.asset("assets/icons/ic_back_arrow.png", width: 28, height: 28),
            onPressed: ()  => Navigator.of(context).pop()
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            FavoriteSchedulesList()

          ],
        ),
      ),
    );
  }
}

class FavoriteSchedulesList extends StatelessWidget {
  const FavoriteSchedulesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        FavoriteSchedulesItem(favSchedule: FavSchedule("КТбо4-1", true)),
        FavoriteSchedulesItem(favSchedule: FavSchedule("КТбо4-1", false)),
        FavoriteSchedulesItem(favSchedule: FavSchedule("КТбо4-1", false)),
        FavoriteSchedulesItem(favSchedule: FavSchedule("КТбо4-1", false)),
        FavoriteSchedulesItem(favSchedule: FavSchedule("КТбо4-1", false)),
        FavoriteSchedulesItem(favSchedule: FavSchedule("КТбо4-1", false)),
      ],
    );
  }
}

class FavoriteSchedulesItem extends StatelessWidget {
  const FavoriteSchedulesItem({super.key, required this.favSchedule});

  final FavSchedule favSchedule;

  TextStyle? _getTextStyle(BuildContext context) {
    if (!favSchedule.isChosen) {
      return Theme.of(context).textTheme.bodyLarge;
    }

    return Theme.of(context).textTheme.bodyLarge?.copyWith(
      color: Colors.white
    );
  }

  Color? _getCardColor(BuildContext context) {
    if (!favSchedule.isChosen) {
      return const Color(0xFFF6F6F6);
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: _getCardColor(context),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
            favSchedule.name,
            style: _getTextStyle(context)
        ),
      ),
    );
  }
}

class FavSchedule {
  final String name;
  final bool isChosen;

  const FavSchedule(this.name, this.isChosen);
}