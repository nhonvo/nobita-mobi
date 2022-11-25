import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nobita/enums/enum_languages.dart';
import 'package:nobita/manager/manager_key_storage.dart';
import 'package:nobita/pages/app/store/app_store.dart';
import 'package:provider/provider.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store, BaseStoreMixin {
  late AppStore appStore;
  @observable
  String _localeLanguage = EnumLanguages.en.name;

  String get localeLanguage => _localeLanguage;

  set localeLanguage(String localeLanguage) {
    _localeLanguage = localeLanguage;
  }

  @computed
  bool get isEn => localeLanguage == EnumLanguages.en.name;

  @override
  void onInit(BuildContext context) {
    appStore = context.read<AppStore>();
  }

  @override
  void onDispose(BuildContext context) {}

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    await _getLanguage(context);
  }

  @override
  void resetValue() {}

  @action
  Future<void> setLanguages(BuildContext context,
      {required String languageCode}) async {
    if (localeLanguage != languageCode) {
      localeLanguage = languageCode;
      context
          .read<AppStore>()
          .setLanguages(context, languageCode: languageCode);
      BaseSharedPreferences.saveStringValue(
          ManagerKeyStorage.language, languageCode);
    }
  }

  Future<void> _getLanguage(BuildContext context) async {
    if (await BaseSharedPreferences.containKey(ManagerKeyStorage.language)) {
      localeLanguage = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.language);
    } else {
      localeLanguage = EnumLanguages.en.name;
    }
  }
}

/// We are using auto code generation to generate code for MobX .
/// If we see any error with .g.dart file, try to run below command.
/// The 3rd command is recommended.
///
/// 1. Build (generate .g.dart):
///    flutter packages pub run build_runner build
/// 2. Build and Watch (update .g.dart automatically):
///    flutter packages pub run build_runner watch
/// 3. Clean before updating:
///    flutter packages pub run build_runner watch --delete-conflicting-outputs
