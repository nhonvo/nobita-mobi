// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SendOTPStore on _SendOTPStore, Store {
  late final _$isShowLoadingAtom =
      Atom(name: '_SendOTPStore.isShowLoading', context: context);

  @override
  bool get isShowLoading {
    _$isShowLoadingAtom.reportRead();
    return super.isShowLoading;
  }

  @override
  set isShowLoading(bool value) {
    _$isShowLoadingAtom.reportWrite(value, super.isShowLoading, () {
      super.isShowLoading = value;
    });
  }

  late final _$timeExpireAtom =
      Atom(name: '_SendOTPStore.timeExpire', context: context);

  @override
  int get timeExpire {
    _$timeExpireAtom.reportRead();
    return super.timeExpire;
  }

  @override
  set timeExpire(int value) {
    _$timeExpireAtom.reportWrite(value, super.timeExpire, () {
      super.timeExpire = value;
    });
  }

  late final _$_SendOTPStoreActionController =
      ActionController(name: '_SendOTPStore', context: context);

  @override
  void startTimer() {
    final _$actionInfo = _$_SendOTPStoreActionController.startAction(
        name: '_SendOTPStore.startTimer');
    try {
      return super.startTimer();
    } finally {
      _$_SendOTPStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isShowLoading: ${isShowLoading},
timeExpire: ${timeExpire}
    ''';
  }
}
