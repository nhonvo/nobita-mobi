import 'dart:developer';

import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nobita/data/const/consts.dart';
import 'package:nobita/data/models/result.dart';
import 'package:nobita/data/models/user.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/manager/manager_address.dart';
import 'package:nobita/pages/login/store/login_store.dart';
import 'package:provider/provider.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store, BaseStoreMixin {
  late LoginStore loginStore;

  BaseAPI _baseAPI = BaseAPI();

  @override
  void onInit(BuildContext context) {
    loginStore = context.read<LoginStore>();
  }

  @override
  void onDispose(BuildContext context) {}

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    await getBalance.call(context);
  }

  @override
  void resetValue() {}

  @action
  Future<void> getBalance(BuildContext context) async {
    print(loginStore.user.toJson().toString());
    await _baseAPI.fetchData(
      ManagerAddress.getBalance,
      method: ApiMethod.GET,
      headers: {
        Consts.AUTHORIZATION: Consts.BREARER + (loginStore.user.token ?? '')
      },
    ).then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            Result result = Result.fromJson(value.object);
            loginStore.user.balance = result.resultObject;
            User temp = loginStore.user;
            loginStore.user = temp;
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
