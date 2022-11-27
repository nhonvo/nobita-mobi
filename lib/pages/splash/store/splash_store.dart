import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nobita/manager/manager_path_routes.dart';
import 'package:nobita/pages/login/store/login_store.dart';
import 'package:provider/provider.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStore with _$SplashStore;

abstract class _SplashStore with Store, BaseStoreMixin {
  late LoginStore _loginStore;

  @observable
  bool isShowLoading = false;

  @override
  void onInit(BuildContext context) {
    _loginStore = context.read<LoginStore>();
  }

  @override
  void onDispose(BuildContext context) {}

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    await _splashDelay(context);
  }

  @override
  void resetValue() {}

  Future<void> _splashDelay(BuildContext context) async {
    isShowLoading = true;
    if (!await _loginStore.autoLogin(context))
      BaseNavigation.push(context, routeName: ManagerRoutes.login);
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
