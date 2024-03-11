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
    required CoupleType coupleType,
    required String discipline,
    required String lecturer
  }) = _Couple;

  bool isOnline() {
    return audience == "LMS";
  }


}

enum CoupleType {
  lecture,
  practice,
  laboratory,
  exam,
  none
}