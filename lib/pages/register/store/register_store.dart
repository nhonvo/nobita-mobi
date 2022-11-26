import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nobita/data/models/result.dart';
import 'package:nobita/manager/manager_address.dart';
import 'package:nobita/manager/manager_path_routes.dart';
import 'package:nobita/pages/login/store/login_store.dart';
import 'package:provider/provider.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store, BaseStoreMixin {
  late TextEditingController userNameController;
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  BaseAPI _baseAPI = BaseAPI();
  late LoginStore loginStore;

  @override
  void onInit(BuildContext context) {
    userNameController = TextEditingController();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    loginStore = context.read<LoginStore>();
  }

  @override
  void onDispose(BuildContext context) {
    userNameController.dispose();
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {}

  @override
  void resetValue() {}

  @action
  Future<void> onPressedRegister(BuildContext context) async {
    if (_checkValid(context)) {
      await onResgister(context);
      if (loginStore.user.accountNo != null) {
        loginStore.setPasswordUser(passwordController.text);
        BaseNavigation.push(context,
            routeName: ManagerRoutes.home, clearStack: true);
        loginStore.saveUserLocal(
            usernName: userNameController.text,
            password: passwordController.text);
      }
    }
  }

  Future<bool> onResgister(BuildContext context) async {
    await _baseAPI
        .fetchData(ManagerAddress.register,
            body: {
              'userName': userNameController.text.toString(),
              'password': passwordController.text.toString(),
              'email': emailController.text.toString(),
              'fullName': fullNameController.text.toString(),
              'identityNumber': '123'.toString(),
              'phone': phoneController.text.toString()
            },
            method: ApiMethod.POST)
        .then((value) async {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            Result result = Result.fromJson(value.object);
            await loginStore.getInfo(context, token: result.resultObject);
            return true;
          }
        case ApiStatus.INTERNET_UNAVAILABLE:
          {
            printLogYellow('INTERNET_UNAVAILABLE');
            BaseUtils.showToast('INTERNET UNAVAILABLE', bgColor: Colors.red);
            break;
          }
        default:
          {
            printLogError('FAILED');
            break;
          }
      }
    });
    return false;
  }

  @action
  void onPressedIHaveAccount(BuildContext context) {
    BaseNavigation.pop(context);
  }

  bool _checkValid(BuildContext context) {
    if (fullNameController.text.isEmpty ||
        userNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      BaseUtils.showToast('Please fill all data',
          bgColor: Theme.of(context).primaryColor);
      return false;
    }
    if (passwordController.text != confirmPasswordController.text) {
      BaseUtils.showToast('Password and confirm password are not the same',
          bgColor: Theme.of(context).primaryColor);
      return false;
    }
    return true;
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
