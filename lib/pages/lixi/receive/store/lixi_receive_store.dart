import 'dart:async';

import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nobita/data/const/consts.dart';
import 'package:nobita/data/models/result.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/manager/manager_address.dart';
import 'package:nobita/manager/manager_key_storage.dart';
import 'package:nobita/pages/login/store/login_store.dart';
import 'package:provider/provider.dart';

part 'lixi_receive_store.g.dart';

class LixiReceiveStore = _LixiReceiveStore with _$LixiReceiveStore;

abstract class _LixiReceiveStore with Store, BaseStoreMixin {
  BaseAPI _baseAPI = BaseAPI();
  late LoginStore _loginStore;
  late Timer timer;
  @observable
  String idRoom = '';
  @override
  void onInit(BuildContext context) {
    _loginStore = context.read<LoginStore>();
  }

  @override
  void onDispose(BuildContext context) {
    timer.cancel();
  }

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    if (await BaseSharedPreferences.containKey(ManagerKeyStorage.idJoined) ==
        true) {
      idRoom = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.idJoined);
      await getRoom(context);
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        getRoom(context);
      });
    } else {
      await BaseSharedPreferences.remove(ManagerKeyStorage.idJoined);
      BaseNavigation.pop(context);
    }
  }

  @override
  void resetValue() {}
  @action
  Future<void> getRoom(BuildContext context) async {
    await _baseAPI.fetchData(ManagerAddress.luckyMoneyGetRoom,
        method: ApiMethod.POST,
        headers: {
          Consts.AUTHORIZATION:
              Consts.BREARER + _loginStore.user.token.toString()
        },
        body: {
          'ownerAcctNo': idRoom
        }).then((value) async {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            try {
              Result result = Result.fromJson(value.object);
              if (result.succeeded == true) {
              } else {
                BaseNavigation.pop(context);
                await BaseSharedPreferences.remove(ManagerKeyStorage.idJoined);
              }
            } catch (e) {}
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
  }

  @action
  Future<void> leaveRoom(BuildContext context) async {
    await _baseAPI.fetchData(ManagerAddress.luckyMoneyLeaveRoom,
        method: ApiMethod.POST,
        headers: {
          Consts.AUTHORIZATION:
              Consts.BREARER + _loginStore.user.token.toString()
        },
        body: {
          'ownerAcctNo': _loginStore.user.accountNo
        }).then((value) async {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            try {
              Result result = Result.fromJson(value.object);
              if (result.succeeded == true) {
                BaseNavigation.pop(context);
                await BaseSharedPreferences.remove(ManagerKeyStorage.idJoined);
              } else {
                BaseNavigation.pop(context);
                await BaseSharedPreferences.remove(ManagerKeyStorage.idJoined);
                BaseUtils.showToast(S.of(context).failed,
                    bgColor: Theme.of(context).primaryColor);
              }
            } catch (e) {}
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
