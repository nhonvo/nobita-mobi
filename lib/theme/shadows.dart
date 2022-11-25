import 'package:flutter/material.dart';
import 'package:nobita/theme/colors.dart';

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
        color: AppColors.primary.withOpacity(0.15)),
    BoxShadow(
        blurRadius: 4,
        spreadRadius: 0,
        offset: const Offset(0, 4),
        color: AppColors.primary.withOpacity(0.3)),
  ];

  static List<BoxShadow> shadow4 = [
    BoxShadow(
        blurRadius: 10,
        spreadRadius: 4,
        offset: const Offset(0, 6),
        color: AppColors.primary.withOpacity(0.15)),
    BoxShadow(
        blurRadius: 4,
        spreadRadius: 0,
        offset: const Offset(0, 4),
        color: AppColors.primary.withOpacity(0.3)),
  ];

  static List<BoxShadow> shadow3(BuildContext context) => [
        BoxShadow(
            blurRadius: 8,
            spreadRadius: 3,
            offset: const Offset(0, 4),
            color: Theme.of(context).dividerColor.withOpacity(0.05)),
        BoxShadow(
            blurRadius: 3,
            spreadRadius: 0,
            offset: const Offset(0, 1),
            color: Theme.of(context).dividerColor.withOpacity(0.02))
      ];

  static List<BoxShadow> shadow2 = [
    BoxShadow(
        blurRadius: 2,
        spreadRadius: 0,
        offset: const Offset(0, 1),
        color: AppColors.primary.withOpacity(0.2)),
    BoxShadow(
        blurRadius: 1,
        spreadRadius: 0,
        offset: const Offset(1, 2),
        color: AppColors.primary.withOpacity(0.1))
  ];

  static List<BoxShadow> shadow1 = [
    BoxShadow(
        blurRadius: 2,
        spreadRadius: 0,
        offset: const Offset(0, 1),
        color: AppColors.primary.withOpacity(0.03)),
    BoxShadow(
        blurRadius: 5,
        spreadRadius: 1,
        offset: const Offset(0, 1),
        color: AppColors.primary.withOpacity(0.05))
  ];

  static List<BoxShadow> cardInfo = [
    BoxShadow(
        blurRadius: 50,
        spreadRadius: 0,
        offset: const Offset(0, 10),
        color: const Color(0xff263658).withOpacity(0.15))
  ];
  static List<BoxShadow> contentMyWallet = [
    BoxShadow(
        blurRadius: 50,
        spreadRadius: 0,
        offset: const Offset(0, -4),
        color: const Color(0xff263658).withOpacity(0.15)),
    const BoxShadow(
      blurRadius: 50,
    )
  ];
}
