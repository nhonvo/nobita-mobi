// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterStore on _RegisterStore, Store {
  late final _$isShowLoadingAtom =
      Atom(name: '_RegisterStore.isShowLoading', context: context);

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

  late final _$onPressedRegisterAsyncAction =
      AsyncAction('_RegisterStore.onPressedRegister', context: context);

  @override
  Future<void> onPressedRegister(BuildContext context) {
    return _$onPressedRegisterAsyncAction
        .run(() => super.onPressedRegister(context));
  }

  late final _$_RegisterStoreActionController =
      ActionController(name: '_RegisterStore', context: context);

  @override
  void onPressedIHaveAccount(BuildContext context) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.onPressedIHaveAccount');
    try {
      return super.onPressedIHaveAccount(context);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isShowLoading: ${isShowLoading}
    ''';
  }
}
