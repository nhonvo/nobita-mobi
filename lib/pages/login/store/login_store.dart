import 'dart:convert';

import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nobita/data/const/consts.dart';
import 'package:nobita/data/models/result.dart';
import 'package:nobita/data/models/user.dart';
import 'package:nobita/data/models/user_local.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/manager/manager_address.dart';
import 'package:nobita/manager/manager_key_storage.dart';
import 'package:nobita/manager/manager_path_routes.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store, BaseStoreMixin {
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  BaseAPI _baseAPI = BaseAPI();

  @observable
  User user = User();

  @observable
  bool _isShowLoading = false;

  bool get isShowLoading => _isShowLoading;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading = isShowLoading;
  }

  @observable
  bool _isValid = false;

  bool get isValid => _isValid;

  set isValid(bool isValid) {
    _isValid = isValid;
  }

  @override
  void onInit(BuildContext context) {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onDispose(BuildContext context) {
    userNameController.dispose();
    passwordController.dispose();
  }

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {}

  @override
  void resetValue() {
    user = User();
    userNameController.dispose();
    passwordController.dispose();
  }

  @action
  Future<void> onPressedLogin(BuildContext context) async {
    await onLogin(context,
        username: userNameController.text, password: passwordController.text);
    if (user.accountNo != null) {
      setPasswordUser(passwordController.text);
      BaseNavigation.push(context,
          routeName: ManagerRoutes.home, clearStack: true);
      saveUserLocal(
          usernName: userNameController.text,
          password: passwordController.text);
    }
  }

  Future<void> onLogin(BuildContext context,
      {required String username, required String password}) async {
    isShowLoading = true;
    try {
      await _baseAPI
          .fetchData(ManagerAddress.login,
              body: {'userName': username, 'password': password},
              method: ApiMethod.POST)
          .then((value) async {
        switch (value.apiStatus) {
          case ApiStatus.SUCCEEDED:
            {
              Result result = Result.fromJson(value.object);
              if (result.succeeded == true)
                await getInfo(context, token: result.resultObject);
              else
                BaseUtils.showToast(S.of(context).wrongUserNameOrPassword,
                    bgColor: Theme.of(context).primaryColor);
              return true;
            }
          case ApiStatus.INTERNET_UNAVAILABLE:
            {
              printLogYellow('INTERNET_UNAVAILABLE');
              BaseUtils.showToast(S.of(context).interNetUnavailable,
                  bgColor: Colors.red);
              break;
            }
          default:
            {
              printLogError('FAILED');
              break;
            }
        }
      });
    } catch (e) {}
    isShowLoading = false;
  }

  @action
  void onPressedCreateANewAccount(BuildContext context) {
    BaseNavigation.push(context, routeName: ManagerRoutes.register);
  }

  Future<void> getInfo(BuildContext context, {required String token}) async {
    await _baseAPI
        .fetchData(ManagerAddress.getInfo,
            headers: {Consts.AUTHORIZATION: Consts.BREARER + token},
            method: ApiMethod.GET)
        .then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            Result result = Result.fromJson(value.object);
            user = User.fromJson(result.resultObject);
            user.token = token;

            break;
          }
        case ApiStatus.INTERNET_UNAVAILABLE:
          {
            printLogYellow('INTERNET_UNAVAILABLE');
            BaseUtils.showToast(S.of(context).interNetUnavailable,
                bgColor: Colors.red);
            break;
          }
        default:
          {
            printLogError('FAILED');
            break;
          }
      }
    });
  }

  Future<bool> autoLogin(BuildContext context) async {
    try {
      if (await BaseSharedPreferences.containKey(ManagerKeyStorage.user)) {
        UserLocal userLocal = UserLocal.fromJson(jsonDecode(
            await BaseSharedPreferences.getStringValue(
                ManagerKeyStorage.user)));
        await onLogin(context,
            username: userLocal.userName ?? '',
            password: userLocal.password ?? '');
        if (user.accountNo != null) {
          BaseNavigation.push(context,
              routeName: ManagerRoutes.home, clearStack: true);
        }
        return true;
      } else
        return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> saveUserLocal(
      {required String usernName, required String password}) async {
    print('Print set');

    UserLocal temp = UserLocal(userName: usernName, password: password);
    if (await BaseSharedPreferences.containKey(ManagerKeyStorage.user)) {
      BaseSharedPreferences.remove(ManagerKeyStorage.user);
    }
    BaseSharedPreferences.saveStringValue(
        ManagerKeyStorage.user, jsonEncode(temp.toJson()));
  }

  void setPasswordUser(String pass) {
    user.password = pass;
  }

  @action
  void validation() {
    if (passwordController.text.isEmpty || userNameController.text.isEmpty) {
      isValid = false;
    } else {
      isValid = true;
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
