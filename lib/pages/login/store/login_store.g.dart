// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStore, Store {
  late final _$userAtom = Atom(name: '_LoginStore.user', context: context);

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$_isShowLoadingAtom =
      Atom(name: '_LoginStore._isShowLoading', context: context);

  @override
  bool get _isShowLoading {
    _$_isShowLoadingAtom.reportRead();
    return super._isShowLoading;
  }

  @override
  set _isShowLoading(bool value) {
    _$_isShowLoadingAtom.reportWrite(value, super._isShowLoading, () {
      super._isShowLoading = value;
    });
  }

  late final _$_isValidAtom =
      Atom(name: '_LoginStore._isValid', context: context);

  @override
  bool get _isValid {
    _$_isValidAtom.reportRead();
    return super._isValid;
  }

  @override
  set _isValid(bool value) {
    _$_isValidAtom.reportWrite(value, super._isValid, () {
      super._isValid = value;
    });
  }

  late final _$onPressedLoginAsyncAction =
      AsyncAction('_LoginStore.onPressedLogin', context: context);

  @override
  Future<void> onPressedLogin(BuildContext context) {
    return _$onPressedLoginAsyncAction.run(() => super.onPressedLogin(context));
  }

  late final _$_LoginStoreActionController =
      ActionController(name: '_LoginStore', context: context);

  @override
  void onPressedCreateANewAccount(BuildContext context) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.onPressedCreateANewAccount');
    try {
      return super.onPressedCreateANewAccount(context);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validation() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.validation');
    try {
      return super.validation();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
