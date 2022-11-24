import 'package:flutter/material.dart';
import 'package:nobita/enums/enum_themes.dart';
import 'package:nobita/theme/colors.dart';
import 'package:nobita/theme/text_styles.dart';

class AppThemes {
  AppThemes._();
  static ThemeData light = ThemeData(
      // Colors
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      primaryColorDark: AppColors.black,
      primaryColorLight: AppColors.white,
      backgroundColor: AppColors.white,
      primaryIconTheme: const IconThemeData(color: AppColors.neutral_5),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: AppColors.primary),
      dividerColor: AppColors.neutral_5,
      disabledColor: AppColors.neutral_3,
      errorColor: AppColors.red,
      hintColor: AppColors.neutral_3,
      scaffoldBackgroundColor: AppColors.white,
      highlightColor: AppColors.black,
      textTheme: TextTheme(
        titleLarge: AppTextStyles.title(),
        headlineLarge: AppTextStyles.h1(),
        headlineMedium: AppTextStyles.h2(),
        headlineSmall: AppTextStyles.h3(),
        displaySmall: AppTextStyles.body3(),
        displayMedium: AppTextStyles.body2(),
        displayLarge: AppTextStyles.body1(),
        labelLarge: AppTextStyles.button(),
      ));

  static ThemeData dark = ThemeData(
      // Colors
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      primaryColorDark: AppColors.black,
      primaryColorLight: AppColors.white,
      backgroundColor: AppColors.black,
      primaryIconTheme: const IconThemeData(color: AppColors.white),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: AppColors.neutral_2),
      dividerColor: AppColors.neutral_2,
      disabledColor: AppColors.neutral_4,
      errorColor: AppColors.red,
      hintColor: AppColors.neutral_4,
      scaffoldBackgroundColor: AppColors.black,
      highlightColor: AppColors.white,
      textTheme: TextTheme(
        titleLarge: AppTextStyles.title(color: AppColors.neutral_2),
        headlineLarge: AppTextStyles.h1(color: AppColors.neutral_2),
        headlineMedium: AppTextStyles.h2(color: AppColors.neutral_2),
        headlineSmall: AppTextStyles.h3(color: AppColors.neutral_2),
        displaySmall: AppTextStyles.body3(color: AppColors.neutral_2),
        displayMedium: AppTextStyles.body2(color: AppColors.neutral_2),
        displayLarge: AppTextStyles.body1(color: AppColors.neutral_2),
        labelLarge: AppTextStyles.button(),
      ));

  static Map<EnumThemes, ThemeData> getCurrentTheme = {
    EnumThemes.light: light,
    EnumThemes.dark: dark
  };
}
