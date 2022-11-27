// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChangePasswordStore on _ChangePasswordStore, Store {
  late final _$isShowLoadingAtom =
      Atom(name: '_ChangePasswordStore.isShowLoading', context: context);

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

  late final _$isValidAtom =
      Atom(name: '_ChangePasswordStore.isValid', context: context);

  @override
  bool get isValid {
    _$isValidAtom.reportRead();
    return super.isValid;
  }

  @override
  set isValid(bool value) {
    _$isValidAtom.reportWrite(value, super.isValid, () {
      super.isValid = value;
    });
  }

  late final _$changePasswordAsyncAction =
      AsyncAction('_ChangePasswordStore.changePassword', context: context);

  @override
  Future<void> changePassword(BuildContext context) {
    return _$changePasswordAsyncAction.run(() => super.changePassword(context));
  }

  late final _$_ChangePasswordStoreActionController =
      ActionController(name: '_ChangePasswordStore', context: context);

  @override
  void validation() {
    final _$actionInfo = _$_ChangePasswordStoreActionController.startAction(
        name: '_ChangePasswordStore.validation');
    try {
      return super.validation();
    } finally {
      _$_ChangePasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkValidate(BuildContext context) {
    final _$actionInfo = _$_ChangePasswordStoreActionController.startAction(
        name: '_ChangePasswordStore.checkValidate');
    try {
      return super.checkValidate(context);
    } finally {
      _$_ChangePasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isShowLoading: ${isShowLoading},
isValid: ${isValid}
    ''';
  }
}
