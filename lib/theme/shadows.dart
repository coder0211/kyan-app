import 'package:flutter/material.dart';
import 'package:kyan/theme/colors.dart';

/// ## Shadows constants all shadow of the app
/// * Example:
/// ```dart
/// import 'package:trygo/theme/shadows.dart';
/// Container(
///  decoration: BoxDecoration(
///    boxShadow: Shadows.shadow1
///  ),
/// );
/// ```
class Shadows {
  Shadows._();

  static List<BoxShadow> defaultShadow = [
    BoxShadow(blurRadius: 15, color: AppColors.primary.withOpacity(0.1))
  ];
  static List<BoxShadow> shadow5 = [
    BoxShadow(
        blurRadius: 12,
        spreadRadius: 6,
        offset: const Offset(0, 8),
        color: const Color(0xff776F60).withOpacity(0.15)),
    BoxShadow(
        blurRadius: 4,
        spreadRadius: 0,
        offset: const Offset(0, 4),
        color: const Color(0xff655E70).withOpacity(0.3)),
  ];

  static List<BoxShadow> shadow4 = [
    BoxShadow(
        blurRadius: 10,
        spreadRadius: 4,
        offset: const Offset(0, 6),
        color: const Color(0xff776F60).withOpacity(0.15)),
    BoxShadow(
        blurRadius: 4,
        spreadRadius: 0,
        offset: const Offset(0, 4),
        color: const Color(0xff655E70).withOpacity(0.3)),
  ];

  static List<BoxShadow> shadow3 = [
    BoxShadow(
        blurRadius: 8,
        spreadRadius: 3,
        offset: const Offset(0, 4),
        color: const Color(0xff776F60).withOpacity(0.15)),
    BoxShadow(
        blurRadius: 3,
        spreadRadius: 0,
        offset: const Offset(0, 1),
        color: const Color(0xff655E70).withOpacity(0.3))
  ];

  static List<BoxShadow> shadow2 = [
    BoxShadow(
        blurRadius: 2,
        spreadRadius: 0,
        offset: const Offset(0, 1),
        color: const Color(0xff776F60).withOpacity(0.3)),
    BoxShadow(
        blurRadius: 6,
        spreadRadius: 2,
        offset: const Offset(0, 2),
        color: const Color(0xff655E70).withOpacity(0.15))
  ];

  static List<BoxShadow> shadow1 = [
    BoxShadow(
        blurRadius: 2,
        spreadRadius: 0,
        offset: const Offset(0, 1),
        color: const Color(0xff776F60).withOpacity(0.3)),
    BoxShadow(
        blurRadius: 3,
        spreadRadius: 1,
        offset: const Offset(0, 1),
        color: const Color(0xff655E70).withOpacity(0.15))
  ];
}
