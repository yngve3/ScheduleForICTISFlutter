import 'package:flutter/material.dart';

import '../models/fav_schedule.dart';
import 'schedule_item.dart';

class FavoriteSchedulesList extends StatelessWidget {
  const FavoriteSchedulesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", true)),
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", false)),
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", false)),
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", false)),
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", false)),
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", false)),
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", false)),
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", false)),
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", false)),
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", false)),
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", false)),
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", false)),
        ScheduleItem(favSchedule: FavSchedule("КТбо4-1", false)),
      ],
    );
  }
}