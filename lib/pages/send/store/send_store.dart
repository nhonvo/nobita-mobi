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

  @observable
  int _amount = 0;

  int get amount => _amount;

  set amount(int amount) {
    _amount = amount;
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
    amount = 0;
    isValid(context);
  }

  @override
  void onDispose(BuildContext context) {
    accountNumberController.dispose();
    fullNameController.dispose();
    emailController.dispose();
    amountController.dispose();
    descriptionController.dispose();
    amount = 0;
    isValid(context);
  }

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {
    try {
      if (BaseNavigation.getArgs(context, key: 'accountNumber') != null) {
        accountNumberController.text =
            BaseNavigation.getArgs(context, key: 'accountNumber');
        _scanStore.isNext = false;
        await getInfoById(context);
      }
    } catch (e) {}
  }

  @override
  void resetValue() {
    accountNumberController.clear();
    fullNameController.clear();
    emailController.clear();
    amountController.clear();
    descriptionController.clear();
    amount = 0;
  }

  @action
  Future<void> getInfoById(BuildContext context) async {
    currentUser = User();
    _setInfo(context);
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
              _setInfo(context);
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
  void isValid(BuildContext context) {
    if (amountController.text.isNotEmpty) {
      int? check = int.tryParse(amountController.text);
      if (check == null) {
        BaseUtils.showToast(S.of(context).pleaseEnterAmount,
            bgColor: Theme.of(context).primaryColor);
        isEnable = false;
        return;
      }
    }
    if (accountNumberController.text.isEmpty ||
        fullNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        amountController.text.isEmpty ||
        descriptionController.text.isEmpty) {
      isEnable = false;
      return;
    }

    if (accountNumberController.text == _loginStore.user.accountNo) {
      BaseUtils.showToast(S.of(context).thisYourAccount,
          bgColor: Theme.of(context).primaryColor);
      isEnable = false;
      return;
    }
    isEnable = true;
  }

  @action
  void onPressedNext(BuildContext context) {
    try {
      if (isEnable) {
        BaseNavigation.push(context, routeName: ManagerRoutes.sendTicket);
      } else if (accountNumberController.text.isEmpty ||
          fullNameController.text.isEmpty ||
          emailController.text.isEmpty ||
          amountController.text.isEmpty ||
          descriptionController.text.isEmpty)
        BaseUtils.showToast(S.of(context).pleaseFillAllData,
            bgColor: Theme.of(context).primaryColor);
      else if (accountNumberController.text == _loginStore.user.accountNo) {
        BaseUtils.showToast(S.of(context).thisYourAccount,
            bgColor: Theme.of(context).primaryColor);
      }
    } catch (e) {}
  }

  void _setInfo(BuildContext context) {
    fullNameController.text = currentUser.fullName ?? '';
    emailController.text = currentUser.email ?? '';
    isValid(context);
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
              if (result.succeeded == true)
                isSended = true;
              else {
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
