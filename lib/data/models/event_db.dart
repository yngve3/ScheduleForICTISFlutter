import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class EventDB {
  final TimeOfDay timeStart;
  final TimeOfDay timeEnd;
  final String title;
  final String description;

  EventDB({
    required this.timeStart,
    required this.timeEnd,
    required this.title,
    required this.description
  });
}