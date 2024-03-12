import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'couple.freezed.dart';

@freezed
class Couple with _$Couple {
  const Couple._();
  factory Couple({
    required TimeOfDay timeStart,
    required TimeOfDay timeEnd,
    required String audience,
    required CoupleType type,
    required String discipline,
    required String lecturer
  }) = _Couple;

  bool get isOnline => audience == "LMS";

}

enum CoupleType {
  lecture(name: "Лекция"),
  practice(name: "Практика"),
  laboratory(name: "Лабораторная"),
  exam(name: "Экзамен"),
  none(name: "");

  const CoupleType({
    required this.name
  });

  final String name;
}