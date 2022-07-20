import 'package:flutter/material.dart';

/// ## AppColors contains all colors used in app
/// * Example:
/// ```dart
/// import 'package:trygo/theme/colors.dart';
/// Container(
///  color: AppColors.primary,
/// );
/// ```
class AppColors {
  AppColors._();
  static const transparent = Colors.transparent;
  // PRIMARY
  static const Color primary = Color(0xff7EB3FD);
  static Color mediumPrimary = primary.withAlpha(120);
  static Color lightPrimary = primary.withAlpha(30);
  static const Color green = Color(0xff72BC8A);
  static const Color redPink = Color(0xffF25353);
  static const Color orange = Color(0xffFFC48D);
  static const Color yellow = Color(0xffFAEDCE);
  static const Color gray = Color(0xffD9DDE8);
  static const Color white = Colors.white;
  static const Color black = Color(0xff333333);
}
