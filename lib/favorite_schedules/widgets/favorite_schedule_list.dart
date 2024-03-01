import 'package:flutter/material.dart';

import '../models/fav_schedule.dart';
import 'favorite_schedule_item.dart';

class FavoriteSchedulesList extends StatelessWidget {
  const FavoriteSchedulesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        FavoriteSchedulesItem(favSchedule: FavSchedule("КТбо4-1", true)),
        FavoriteSchedulesItem(favSchedule: FavSchedule("КТбо4-1", false)),
        FavoriteSchedulesItem(favSchedule: FavSchedule("КТбо4-1", false)),
        FavoriteSchedulesItem(favSchedule: FavSchedule("КТбо4-1", false)),
        FavoriteSchedulesItem(favSchedule: FavSchedule("КТбо4-1", false)),
        FavoriteSchedulesItem(favSchedule: FavSchedule("КТбо4-1", false)),
        FavoriteSchedulesItem(favSchedule: FavSchedule("КТбо4-1", false)),
        FavoriteSchedulesItem(favSchedule: FavSchedule("КТбо4-1", false)),
        FavoriteSchedulesItem(favSchedule: FavSchedule("КТбо4-1", false)),
        FavoriteSchedulesItem(favSchedule: FavSchedule("КТбо4-1", false)),
        FavoriteSchedulesItem(favSchedule: FavSchedule("КТбо4-1", false)),
        FavoriteSchedulesItem(favSchedule: FavSchedule("КТбо4-1", false)),
        FavoriteSchedulesItem(favSchedule: FavSchedule("КТбо4-1", false)),
      ],
    );
  }
}