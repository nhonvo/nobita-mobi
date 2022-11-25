import 'package:flutter/material.dart';
import 'package:nobita/pages/home/store/home_store.dart';
import 'package:nobita/pages/login/store/login_store.dart';
import 'package:nobita/pages/main/store/main_store.dart';
import 'package:nobita/pages/register/store/register_store.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:nobita/pages/app/store/app_store.dart';
import 'package:nobita/pages/splash/store/splash_store.dart';

class ManagerProvider {
  ManagerProvider._();

  /// ## Providers
  /// * Delare all manager provider here and use it in app
  /// * Example:
  /// ```dart
  /// Provider<Store>(create: (_) => Store())
  /// ```
  static List<SingleChildWidget> provider = [
    Provider<AppStore>(create: (_) => AppStore()),
    Provider<SplashStore>(create: (_) => SplashStore()),
    Provider<MainStore>(create: (_) => MainStore()),
    Provider<LoginStore>(create: (_) => LoginStore()),
    Provider<RegisterStore>(create: (_) => RegisterStore()),
    Provider<HomeStore>(create: (_) => HomeStore()),
  ];

  /// ## Dispose
  /// * context.read<Store>().resetValue();
  /// * [dispose] all manager provider here
  /// * Dispose all manager provider here and reset value in app
  /// * Example:
  /// ```dart
  /// context.read<Store>().resetValue();
  /// ```
  static Future<void> dispose(BuildContext context) async {
    context.read<SplashStore>().resetValue();
    context.read<MainStore>().resetValue();
    context.read<LoginStore>().resetValue();
    context.read<RegisterStore>().resetValue();
    context.read<HomeStore>().resetValue();
  }
}