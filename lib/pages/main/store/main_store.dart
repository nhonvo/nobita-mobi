import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nobita/pages/app/store/app_store.dart';
import 'package:nobita/pages/home/page/home_page.dart';
import 'package:provider/provider.dart';

part 'main_store.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store, BaseStoreMixin {
  late AppStore appStore;

  late PageController pageController;

  late List<Widget> screens;

  @observable
  int _indexTabBar = 0;

  int get indexTabBar => _indexTabBar;

  set indexTabBar(int indexTabBar) {
    _indexTabBar = indexTabBar;
  }

  @override
  void onInit(BuildContext context) {
    appStore = context.read<AppStore>();
    pageController = PageController();
    screens = <Widget>[
      const HomePage(),
      Text('2'),
      Text('3'),
    ];
  }

  @override
  void onDispose(BuildContext context) {}

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {}

  @override
  void resetValue() {}

  @action
  void setIndexTabBar({required int value}) {
    indexTabBar = value;
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
