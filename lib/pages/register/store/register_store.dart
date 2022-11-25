import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nobita/manager/manager_path_routes.dart';
import 'package:nobita/pages/app/store/app_store.dart';
import 'package:provider/provider.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store, BaseStoreMixin {
  late AppStore appStore;

  @override
  void onInit(BuildContext context) {
    appStore = context.read<AppStore>();
  }

  @override
  void onDispose(BuildContext context) {}

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {}

  @override
  void resetValue() {}

  @action
  void onPressedRegister(BuildContext context) {
    BaseNavigation.push(context,
        routeName: ManagerRoutes.home, clearStack: true);
  }

  @action
  void onPressedIHaveAccount(BuildContext context) {
    BaseNavigation.pop(context);
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
