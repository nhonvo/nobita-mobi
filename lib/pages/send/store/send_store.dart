import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nobita/data/const/consts.dart';
import 'package:nobita/data/models/result.dart';
import 'package:nobita/data/models/user.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/manager/manager_address.dart';
import 'package:nobita/manager/manager_path_routes.dart';
import 'package:nobita/pages/login/store/login_store.dart';
import 'package:nobita/pages/scan/store/scan_store.dart';
import 'package:provider/provider.dart';

part 'send_store.g.dart';

class SendStore = _SendStore with _$SendStore;

abstract class _SendStore with Store, BaseStoreMixin {
  BaseAPI _baseAPI = BaseAPI();
  late LoginStore _loginStore;
  late ScanStore _scanStore;
  late TextEditingController accountNumberController;
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController amountController;
  late TextEditingController descriptionController;

  @observable
  bool _isEnable = false;

  bool get isEnable => _isEnable;

  set isEnable(bool isEnable) {
    _isEnable = isEnable;
  }

  @observable
  User currentUser = User();

  @observable
  bool _isSended = false;

  bool get isSended => _isSended;

  set isSended(bool isSended) {
    _isSended = isSended;
  }

  @override
  void onInit(BuildContext context) {
    accountNumberController = TextEditingController();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    amountController = TextEditingController();
    descriptionController = TextEditingController();
    _loginStore = context.read<LoginStore>();
    _scanStore = context.read<ScanStore>();
    _isSended = false;
    isValid();
  }

  @override
  void onDispose(BuildContext context) {
    accountNumberController.dispose();
    fullNameController.dispose();
    emailController.dispose();
    amountController.dispose();
    descriptionController.dispose();
  }

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    if (BaseNavigation.getArgs(context, key: 'accountNumber') != null) {
      accountNumberController.text =
          BaseNavigation.getArgs(context, key: 'accountNumber');
      _scanStore.isNext = false;
      await getInfoById(context);
    }
  }

  @override
  void resetValue() {
    accountNumberController.clear();
    fullNameController.clear();
    emailController.clear();
    amountController.clear();
    descriptionController.clear();
    isValid();
  }

  @action
  Future<void> getInfoById(BuildContext context) async {
    currentUser = User();
    _setInfo();
    await _baseAPI.fetchData(ManagerAddress.getInfoById,
        method: ApiMethod.POST,
        headers: {
          Consts.AUTHORIZATION:
              Consts.BREARER + _loginStore.user.token.toString()
        },
        body: {
          'accountNo': accountNumberController.text
        }).then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            try {
              Result result = Result.fromJson(value.object);
              User temp = User.fromJson(result.resultObject);
              currentUser = temp;
              _setInfo();
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
  void isValid() {
    if (accountNumberController.text.isEmpty ||
        fullNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        amountController.text.isEmpty ||
        descriptionController.text.isEmpty) {
      isEnable = false;
      return;
    }
    isEnable = true;
  }

  @action
  void onPressedNext(BuildContext context) {
    if (isEnable) {
      BaseNavigation.push(context, routeName: ManagerRoutes.sendTicket);
    } else
      BaseUtils.showToast(S.of(context).pleaseFillAllData,
          bgColor: Theme.of(context).primaryColor);
  }

  void _setInfo() {
    fullNameController.text = currentUser.fullName ?? '';
    emailController.text = currentUser.email ?? '';
    isValid();
  }

  @action
  Future<void> tranfer(BuildContext context) async {
    await _baseAPI
        .fetchData(ManagerAddress.tranfer, method: ApiMethod.POST, headers: {
      Consts.AUTHORIZATION: Consts.BREARER + _loginStore.user.token.toString()
    }, body: {
      'amount': int.parse(amountController.text),
      'description': descriptionController.text,
      'toAccount': accountNumberController.text
    }).then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            try {
              Result result = Result.fromJson(value.object);
              if (result.succeeded == true) isSended = true;
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
