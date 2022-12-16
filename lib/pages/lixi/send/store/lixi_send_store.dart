import 'dart:async';

import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nobita/data/const/consts.dart';
import 'package:nobita/data/models/lixi_room.dart';
import 'package:nobita/data/models/result.dart';
import 'package:nobita/data/models/user.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/manager/manager_address.dart';
import 'package:nobita/manager/manager_key_storage.dart';
import 'package:nobita/manager/manager_path_routes.dart';
import 'package:nobita/pages/login/store/login_store.dart';
import 'package:provider/provider.dart';
part 'lixi_send_store.g.dart';

class LixiSendStore = _LixiSendStore with _$LixiSendStore;

abstract class _LixiSendStore with Store, BaseStoreMixin {
  BaseAPI _baseAPI = BaseAPI();
  late LoginStore _loginStore;
  late Timer timer;

  @observable
  bool isShowLoading = false;
  @observable
  LixiRoom lixiRoom = LixiRoom();

  @observable
  ObservableList<User> participants = ObservableList<User>();

  void onInit(BuildContext context) {
    _loginStore = context.read<LoginStore>();
  }

  @override
  void onDispose(BuildContext context) {
    timer.cancel();
  }

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    await getRoom(context);
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      getParticipant(context);
    });
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
          'ownerAcctNo': _loginStore.user.accountNo
        }).then((value) async {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            try {
              Result result = Result.fromJson(value.object);
              if (result.succeeded == true) {
                lixiRoom = LixiRoom.fromJson(result.resultObject);
                await getParticipant(context);
              } else {
                BaseNavigation.pop(context);
                BaseNavigation.push(context, routeName: ManagerRoutes.lixi);
                await BaseSharedPreferences.savedBoolValue(
                    ManagerKeyStorage.isOwnerLixi, false);
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

  @action
  Future<void> getParticipant(BuildContext context) async {
    await _baseAPI.fetchData(ManagerAddress.luckyMoneyGetParticipant,
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
                participants.clear();
                result.resultObject.forEach((e) {
                  participants.add(User.fromJson(e));
                });
              } else {}
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
  Future<void> deleteRoom(BuildContext context) async {
    await _baseAPI.fetchData(ManagerAddress.luckyMoneyDeleteRoom,
        method: ApiMethod.DELETE,
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
                BaseSharedPreferences.remove(ManagerKeyStorage.isOwnerLixi);
              } else {
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

  @action
  Future<void> sendLixi(BuildContext context) async {
    isShowLoading = true;
    await _baseAPI.fetchData(ManagerAddress.luckyMoneySendMoney,
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
                await deleteRoom(context);
                await BaseSharedPreferences.remove(
                    ManagerKeyStorage.isOwnerLixi);
                BaseNavigation.pop(context);
              } else {
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
    isShowLoading = false;
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
