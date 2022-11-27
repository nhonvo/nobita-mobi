import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nobita/data/const/consts.dart';
import 'package:nobita/data/models/result.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/manager/manager_address.dart';
import 'package:nobita/pages/login/store/login_store.dart';
import 'package:provider/provider.dart';

part 'change_password_store.g.dart';

class ChangePasswordStore = _ChangePasswordStore with _$ChangePasswordStore;

abstract class _ChangePasswordStore with Store, BaseStoreMixin {
  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;

  late LoginStore _loginStore;
  BaseAPI _baseAPI = BaseAPI();

  @observable
  bool isShowLoading = false;
  @observable
  bool isValid = false;

  @override
  void onInit(BuildContext context) {
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    _loginStore = context.read<LoginStore>();
  }

  @override
  void onDispose(BuildContext context) {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {}

  @override
  void resetValue() {}

  @action
  void validation() {
    if (oldPasswordController.text.isEmpty ||
        newPasswordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      isValid = false;
      return;
    }
    isValid = true;
  }

  @action
  void checkValidate(BuildContext context) {
    if (oldPasswordController.text.isEmpty ||
        newPasswordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      BaseUtils.showToast(S.of(context).pleaseFillAllData,
          bgColor: Theme.of(context).primaryColor);
      isValid = false;
      return;
    }
    if (confirmPasswordController.text != newPasswordController.text) {
      BaseUtils.showToast(S.of(context).passwordAndConfirmPasswordNotSame,
          bgColor: Theme.of(context).primaryColor);
      isValid = false;
      return;
    }
    if (_loginStore.user.password != oldPasswordController.text) {
      BaseUtils.showToast(S.of(context).wrongOldPassword,
          bgColor: Theme.of(context).primaryColor);
      isValid = false;
      return;
    }
    if (_loginStore.user.password == newPasswordController.text) {
      BaseUtils.showToast(S.of(context).theNewPasswordSame,
          bgColor: Theme.of(context).primaryColor);
      isValid = false;
      return;
    }
    isValid = true;
  }

  @action
  Future<void> changePassword(BuildContext context) async {
    isShowLoading = true;
    await _baseAPI.fetchData(ManagerAddress.changePassword,
        method: ApiMethod.POST,
        headers: {
          Consts.AUTHORIZATION: Consts.BREARER + (_loginStore.user.token ?? '')
        },
        body: {
          'oldPassword': _loginStore.user.password,
          'newPassword': newPasswordController.text
        }).then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            Result result = Result.fromJson(value.object);
            if (result.succeeded == true) {
              _loginStore.saveUserLocal(
                  usernName: _loginStore.user.userName ?? '',
                  password: newPasswordController.text);
              BaseUtils.showToast(S.of(context).changePasswordSuccess,
                  bgColor: Theme.of(context).primaryColor);
              BaseNavigation.pop(context);
            } else {
              BaseUtils.showToast(S.of(context).changePasswordFailed,
                  bgColor: Theme.of(context).primaryColor);
            }
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
