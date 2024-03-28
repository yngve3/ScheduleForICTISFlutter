import 'package:flutter/material.dart';

import '../colors.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {

  final Color background;
  final Color accent;
  final Color disabled;

  final Color redIndicator;
  final Color greenIndicator;
  final Color yellowIndicator;

  final Color text1;
  final Color text2;

  final Color card;

  ThemeColors({
    required this.background,
    required this.accent,
    required this.redIndicator,
    required this.greenIndicator,
    required this.yellowIndicator,
    required this.text1,
    required this.text2,
    required this.card,
    required this.disabled
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? background,
    Color? accent,
    Color? redIndicator,
    Color? greenIndicator,
    Color? yellowIndicator,
    Color? text1,
    Color? text2,
    Color? card,
    Color? disabled
  }) {
    return ThemeColors(
      background: background ?? this.background,
      accent: accent ?? this.accent,
      redIndicator: redIndicator ?? this.redIndicator,
      greenIndicator: greenIndicator ?? this.greenIndicator,
      yellowIndicator: yellowIndicator ?? this.yellowIndicator,
      text1: text1 ?? this.text1,
      text2: text2 ?? this.text2,
      card: background ?? this.card,
      disabled: disabled ?? this.disabled
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(covariant ThemeExtension<ThemeColors>? other, double t,) {
    if (other is! ThemeColors) {
      return this;
    }

    return ThemeColors(
      background: Color.lerp(background, other.background, t) ?? background,
      accent: Color.lerp(accent, other.accent, t)!,
      redIndicator: Color.lerp(redIndicator, other.redIndicator, t) ?? redIndicator,
      greenIndicator: Color.lerp(greenIndicator, other.greenIndicator, t) ?? greenIndicator,
      yellowIndicator: Color.lerp(yellowIndicator, other.yellowIndicator, t) ?? yellowIndicator,
      text1: Color.lerp(text1, other.text1, t) ?? text1,
      text2: Color.lerp(text2, other.text2, t) ?? text2,
      card: Color.lerp(card, other.card, t)!,
      disabled: Color.lerp(disabled, other.disabled, t) ?? disabled
    );
  }

  static get light => ThemeColors(
    background: Colors.white,
    accent: CustomColors.blue,
    redIndicator: CustomColors.red,
    greenIndicator: CustomColors.green,
    yellowIndicator: CustomColors.yellow,
    text1: CustomColors.black,
    text2: CustomColors.grey6,
    card: CustomColors.grey1,
    disabled: CustomColors.grey5,
  );

}