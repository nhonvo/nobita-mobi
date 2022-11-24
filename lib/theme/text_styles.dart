import 'package:flutter/material.dart';
import 'package:nobita/theme/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle title({Color color = AppColors.black}) => GoogleFonts.inter(
      fontWeight: FontWeight.bold,
      fontSize: Dimens.TEXT_XX_LARGE,
      color: color,
      letterSpacing: Dimens.LETTER_SPACING);
  static TextStyle h1({Color color = AppColors.black}) => GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      fontSize: Dimens.TEXT_X_LARGE,
      color: color,
      letterSpacing: Dimens.LETTER_SPACING);
  static TextStyle h2({Color color = AppColors.black}) => GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      fontSize: Dimens.TEXT_LARGE,
      color: color,
      letterSpacing: Dimens.LETTER_SPACING);
  static TextStyle h3({Color color = AppColors.black}) => GoogleFonts.inter(
      fontWeight: FontWeight.w600,
      fontSize: Dimens.DEFAULT_TEXT_SIZE,
      color: color,
      letterSpacing: Dimens.LETTER_SPACING);
  static TextStyle button({Color color = AppColors.white}) => GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      fontSize: Dimens.DEFAULT_TEXT_SIZE,
      color: color,
      letterSpacing: Dimens.LETTER_SPACING);
  static TextStyle body1({Color color = AppColors.black}) => GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      fontSize: Dimens.DEFAULT_TEXT_SIZE,
      color: color,
      letterSpacing: Dimens.LETTER_SPACING);
  static TextStyle body2({Color color = AppColors.black}) => GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      fontSize: Dimens.TEXT_SMALL,
      color: color,
      letterSpacing: Dimens.LETTER_SPACING);
  static TextStyle body3({Color color = AppColors.black}) => GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      fontSize: Dimens.TEXT_X_SMALL,
      color: color,
      letterSpacing: Dimens.LETTER_SPACING);
}
