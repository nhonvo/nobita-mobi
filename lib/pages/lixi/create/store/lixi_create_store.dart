import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nobita/data/const/consts.dart';
import 'package:nobita/data/models/result.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/manager/manager_address.dart';
import 'package:nobita/manager/manager_key_storage.dart';
import 'package:nobita/manager/manager_path_routes.dart';
import 'package:nobita/pages/login/store/login_store.dart';
import 'package:provider/provider.dart';

part 'lixi_create_store.g.dart';

class LixiCreateStore = _LixiCreateStore with _$LixiCreateStore;

abstract class _LixiCreateStore with Store, BaseStoreMixin {
  late TextEditingController amountController;
  late LoginStore _loginStore;
  late BaseAPI _baseAPI;

  @observable
  bool isEnable = false;
  @override
  void onInit(BuildContext context) {
    _loginStore = context.read<LoginStore>();
    _baseAPI = BaseAPI();
    amountController = TextEditingController();
  }

  @override
  void onDispose(BuildContext context) {
    amountController.dispose();
  }

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {}

  @override
  void resetValue() {}

  @action
  void setIndexTabBar({required int value}) {}

  @action
  void isValid(BuildContext context) {
    if (amountController.text.isNotEmpty) {
      int? check = int.tryParse(amountController.text);
      if (check == null) {
        BaseUtils.showToast(S.of(context).pleaseEnterAmount,
            bgColor: Theme.of(context).primaryColor);
        isEnable = false;
        return;
      } else {
        if (int.parse(amountController.text).toInt() >
            (int.tryParse(_loginStore.user.balance?.split('.')[0] ?? '') ??
                0)) {
          BaseUtils.showToast(S.of(context).notEnoughBalance,
              bgColor: Theme.of(context).primaryColor);
          isEnable = false;
          return;
        }
      }
    }
    if (amountController.text.isEmpty) {
      isEnable = false;
      return;
    }

    isEnable = true;
  }

  @action
  Future<void> createRoom(BuildContext context) async {
    await _baseAPI.fetchData(ManagerAddress.luckyMoneyCreateRoom,
        method: ApiMethod.POST,
        headers: {
          Consts.AUTHORIZATION:
              Consts.BREARER + _loginStore.user.token.toString()
        },
        body: {
          'amount': int.parse(amountController.text),
        }).then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            try {
              Result result = Result.fromJson(value.object);
              if (result.succeeded == true) {
                BaseNavigation.pop(context);
                BaseNavigation.pop(context);
                BaseNavigation.push(context, routeName: ManagerRoutes.lixiSend);
                BaseSharedPreferences.savedBoolValue(
                    ManagerKeyStorage.isOwnerLixi, true);
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
