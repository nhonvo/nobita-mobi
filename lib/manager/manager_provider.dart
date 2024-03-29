import 'package:flutter/material.dart';
import 'package:nobita/pages/change_password/store/change_password_store.dart';
import 'package:nobita/pages/home/store/home_store.dart';
import 'package:nobita/pages/lixi/create/store/lixi_create_store.dart';
import 'package:nobita/pages/lixi/receive/store/lixi_receive_store.dart';
import 'package:nobita/pages/lixi/send/store/lixi_send_store.dart';
import 'package:nobita/pages/lixi/store/lixi_store.dart';
import 'package:nobita/pages/login/store/login_store.dart';
import 'package:nobita/pages/main/store/main_store.dart';
import 'package:nobita/pages/profile/store/profile_store.dart';
import 'package:nobita/pages/receive/page/receive_page.dart';
import 'package:nobita/pages/receive/store/receive_store.dart';
import 'package:nobita/pages/register/store/register_store.dart';
import 'package:nobita/pages/scan/store/scan_store.dart';
import 'package:nobita/pages/send/otp/store/send_otp_store.dart';
import 'package:nobita/pages/send/page/send_page.dart';
import 'package:nobita/pages/send/store/send_store.dart';
import 'package:nobita/pages/send/ticket/store/send_ticket_store.dart';
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
    Provider<ProfileStore>(create: (_) => ProfileStore()),
    Provider<ReceiveStore>(create: (_) => ReceiveStore()),
    Provider<ScanStore>(create: (_) => ScanStore()),
    Provider<SendStore>(create: (_) => SendStore()),
    Provider<SendTicketStore>(create: (_) => SendTicketStore()),
    Provider<ChangePasswordStore>(create: (_) => ChangePasswordStore()),
    Provider<SendOTPStore>(create: (_) => SendOTPStore()),
    Provider<LixiStore>(create: (_) => LixiStore()),
    Provider<LixiSendStore>(create: (_) => LixiSendStore()),
    Provider<LixiCreateStore>(create: (_) => LixiCreateStore()),
    Provider<LixiReceiveStore>(create: (_) => LixiReceiveStore())
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
    context.read<ProfileStore>().resetValue();
    context.read<ReceiveStore>().resetValue();
    context.read<ScanStore>().resetValue();
    context.read<SendStore>().resetValue();
    context.read<SendTicketStore>().resetValue();
    context.read<ChangePasswordStore>().resetValue();
    context.read<SendOTPStore>().resetValue();
    context.read<LixiStore>().resetValue();
    context.read<LixiSendStore>().resetValue();
    context.read<LixiCreateStore>().resetValue();
    context.read<LixiReceiveStore>().resetValue();
  }
}
