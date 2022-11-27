import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:get_cli/common/utils/json_serialize/json_ast/utils/grapheme_splitter.dart';
import 'package:mobx/mobx.dart';
import 'package:nobita/data/const/consts.dart';
import 'package:nobita/data/models/result.dart';
import 'package:nobita/data/models/user.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/manager/manager_address.dart';
import 'package:nobita/manager/manager_path_routes.dart';
import 'package:nobita/pages/login/store/login_store.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'scan_store.g.dart';

class ScanStore = _ScanStore with _$ScanStore;

abstract class _ScanStore with Store, BaseStoreMixin {
  GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  BaseAPI _baseAPI = BaseAPI();
  late LoginStore _loginStore;
  User temp = User();

  @observable
  bool _isNext = false;

  bool get isNext => _isNext;

  set isNext(bool isNext) {
    _isNext = isNext;
  }

  @override
  void onInit(BuildContext context) {
    _loginStore = context.read<LoginStore>();
  }

  @override
  void onDispose(BuildContext context) {
    controller?.dispose();
  }

  @override
  Future<void> onWidgetBuildDone(BuildContext context) async {}

  @override
  void resetValue() {}

  @action
  Future<void> onQRViewCreated(
      QRViewController controller, BuildContext context) async {
    this.controller = controller;
    await controller.scannedDataStream.listen((scanData) async {
      result = scanData;
      if (result != null) {
        controller.pauseCamera();
        try {
          if (!isNext) {
            isNext = true;
            await _getInfoById(context, accountNumber: result?.code ?? '');
          }
        } catch (e) {}
      }
    });
  }

  @action
  Future<void> _getInfoById(BuildContext context,
      {required String accountNumber}) async {
    await _baseAPI.fetchData(ManagerAddress.getInfoById,
        method: ApiMethod.POST,
        headers: {
          Consts.AUTHORIZATION:
              Consts.BREARER + _loginStore.user.token.toString()
        },
        body: {
          'accountNo': accountNumber
        }).then((value) {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            Result result = Result.fromJson(value.object);
            temp = User.fromJson(result.resultObject);
            break;
          }
        case ApiStatus.INTERNET_UNAVAILABLE:
          {
            printLogYellow('INTERNET_UNAVAILABLE');
            BaseUtils.showToast(S.of(context).interNetUnavailable,
                bgColor: Colors.red);
            isNext = false;
            break;
          }
        default:
          {
            printLogError('FAILED');
            isNext = false;
            break;
          }
      }
    }).whenComplete(() {
      if (temp.accountNo != null &&
          temp.email != null &&
          temp.fullName != null &&
          isNext) {
        BaseNavigation.pop(context);
        BaseNavigation.push(context,
            routeName: ManagerRoutes.send,
            arguments: {'accountNumber': accountNumber});
      } else {
        controller?.resumeCamera();
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
