import 'dart:async';

import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nobita/data/const/consts.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/manager/manager_path_routes.dart';
import 'package:nobita/pages/send/store/send_store.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

part 'send_otp_store.g.dart';

class SendOTPStore = _SendOTPStore with _$SendOTPStore;

abstract class _SendOTPStore with Store, BaseStoreMixin {
  final formKey = GlobalKey<FormState>();
  late TextEditingController formController;
  StreamController<ErrorAnimationType>? errorController;
  late Timer timer;
  late SendStore sendStore;

  @observable
  bool isShowLoading = false;

  @observable
  int timeExpire = Consts.TIME_EXPIRE;

  @override
  void onInit(BuildContext context) {
    formController = TextEditingController();
    sendStore = context.read<SendStore>();
  }

  @override
  void onDispose(BuildContext context) {
    // formController.dispose();
    timer.cancel();
  }

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    startTimer();
  }

  @override
  void resetValue() {}

  @action
  void startTimer() {
    timeExpire = Consts.TIME_EXPIRE;
    timer =
        Timer.periodic(const Duration(seconds: Consts.DURATION_OTP), (timer) {
      if (timeExpire > 0) {
        timeExpire--;
      } else {
        timer.cancel();
      }
    });
  }

  String convertNumberToString(int number) {
    String result = '';
    int minute = (number ~/ 60);
    int second = (number % 60);

    if (minute < 10)
      result = '0' + minute.toString();
    else
      result = minute.toString();

    if (second < 10)
      result += ':' + '0' + second.toString();
    else
      result += ':' + second.toString();
    return result;
  }

  Future<void> onCompleted(BuildContext context,
      {required String value}) async {
    if (sendStore.otpCode == value) {
      isShowLoading = true;
      await sendStore.tranfer(context);
      isShowLoading = false;
      BaseNavigation.push(context,
          routeName: ManagerRoutes.sendTicket, clearStack: true);
    } else {
      BaseUtils.showToast(S.of(context).wrongOTP,
          bgColor: Theme.of(context).primaryColor);
    }
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
