// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SendStore on _SendStore, Store {
  late final _$_isEnableAtom =
      Atom(name: '_SendStore._isEnable', context: context);

  @override
  bool get _isEnable {
    _$_isEnableAtom.reportRead();
    return super._isEnable;
  }

  @override
  set _isEnable(bool value) {
    _$_isEnableAtom.reportWrite(value, super._isEnable, () {
      super._isEnable = value;
    });
  }

  late final _$currentUserAtom =
      Atom(name: '_SendStore.currentUser', context: context);

  @override
  User get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(User value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$_isSendedAtom =
      Atom(name: '_SendStore._isSended', context: context);

  @override
  bool get _isSended {
    _$_isSendedAtom.reportRead();
    return super._isSended;
  }

  @override
  set _isSended(bool value) {
    _$_isSendedAtom.reportWrite(value, super._isSended, () {
      super._isSended = value;
    });
  }

  late final _$_amountAtom = Atom(name: '_SendStore._amount', context: context);

  @override
  int get _amount {
    _$_amountAtom.reportRead();
    return super._amount;
  }

  @override
  set _amount(int value) {
    _$_amountAtom.reportWrite(value, super._amount, () {
      super._amount = value;
    });
  }

  late final _$getInfoByIdAsyncAction =
      AsyncAction('_SendStore.getInfoById', context: context);

  @override
  Future<void> getInfoById(BuildContext context) {
    return _$getInfoByIdAsyncAction.run(() => super.getInfoById(context));
  }

  late final _$tranferAsyncAction =
      AsyncAction('_SendStore.tranfer', context: context);

  @override
  Future<void> tranfer(BuildContext context) {
    return _$tranferAsyncAction.run(() => super.tranfer(context));
  }

  late final _$_SendStoreActionController =
      ActionController(name: '_SendStore', context: context);

  @override
  void isValid(BuildContext context) {
    final _$actionInfo =
        _$_SendStoreActionController.startAction(name: '_SendStore.isValid');
    try {
      return super.isValid(context);
    } finally {
      _$_SendStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPressedNext(BuildContext context) {
    final _$actionInfo = _$_SendStoreActionController.startAction(
        name: '_SendStore.onPressedNext');
    try {
      return super.onPressedNext(context);
    } finally {
      _$_SendStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser}
    ''';
  }
}
