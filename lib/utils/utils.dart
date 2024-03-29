import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nobita/manager/manager_key_storage.dart';
import 'package:nobita/theme/colors.dart';

class Utils {
  static Future<Locale> setLocale(String languageCode) async {
    await BaseSharedPreferences.saveStringValue(
        ManagerKeyStorage.language, languageCode);
    return _locale(languageCode);
  }

  static Future<Locale> getLocale() async {
    String languageCode = '';
    if (await BaseSharedPreferences.containKey(ManagerKeyStorage.language)) {
      languageCode = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.language);
    } else {
      languageCode = 'en';
    }
    return _locale(languageCode);
  }

  static Locale _locale(String languageCode) {
    return languageCode.isNotEmpty ? Locale(languageCode) : const Locale('en');
  }

  static Future<void> saveCurrentWorkSpace(String workspace) async {
    await BaseSharedPreferences.saveStringValue('currentorkspace', workspace);
  }

  static void showToast(String? message, {Toast? toastLength}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: message ?? '',
        textColor: Colors.white,
        backgroundColor: AppColors.primary,
        gravity: ToastGravity.BOTTOM,
        toastLength: toastLength ?? Toast.LENGTH_SHORT);
  }
}
