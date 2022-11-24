import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nobita/enums/enum_languages.dart';
import 'package:nobita/enums/enum_themes.dart';
import 'package:nobita/manager/manager_key_storage.dart';
import 'package:nobita/theme/themes.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  @observable
  ThemeData currentTheme = AppThemes.dark;

  @observable
  EnumThemes currentEnumTheme = EnumThemes.dark;

  // @observable
  // bool isDarkTheme = false;

  Map<String, EnumThemes> _enumThemesMap = {
    EnumThemes.light.name: EnumThemes.light,
    EnumThemes.dark.name: EnumThemes.dark
  };

  Map<EnumThemes, EnumThemes> _swapTheme = {
    EnumThemes.light: EnumThemes.dark,
    EnumThemes.dark: EnumThemes.light
  };

  @observable
  Locale locale = Locale(EnumLanguages.en.name);

  @action
  void setLocale(BuildContext context, Locale newLocale) {
    locale = newLocale;
  }

  @action
  Future<void> toggleTheme() async {
    currentEnumTheme = _swapTheme[currentEnumTheme] ?? EnumThemes.dark;
    currentTheme =
        AppThemes.getCurrentTheme[currentEnumTheme] ?? AppThemes.dark;
    bool isSaved = await BaseSharedPreferences.saveStringValue(
        ManagerKeyStorage.theme, currentEnumTheme.name);
    if (isSaved) {
    } else {}
  }

  @action
  Future<void> getTheme() async {
    if (await BaseSharedPreferences.containKey(ManagerKeyStorage.theme)) {
      currentEnumTheme = _enumThemesMap[
              await BaseSharedPreferences.getStringValue(
                  ManagerKeyStorage.theme)] ??
          EnumThemes.dark;
      currentTheme =
          AppThemes.getCurrentTheme[currentEnumTheme] ?? AppThemes.dark;
    }
  }

  @action
  Future<void> setLanguages(BuildContext context,
      {required String languageCode}) async {
    setLocale(context, Locale(languageCode));
    BaseSharedPreferences.saveStringValue(
        ManagerKeyStorage.language, languageCode);
  }

  Future<void> getLanguage() async {
    if (await BaseSharedPreferences.containKey(ManagerKeyStorage.language)) {
      locale = Locale(await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.language));
    } else {
      locale = Locale(EnumLanguages.en.name);
    }
  }
}
