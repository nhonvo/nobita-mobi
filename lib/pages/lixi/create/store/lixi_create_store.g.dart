// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lixi_create_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LixiCreateStore on _LixiCreateStore, Store {
  late final _$isEnableAtom =
      Atom(name: '_LixiCreateStore.isEnable', context: context);

  @override
  bool get isEnable {
    _$isEnableAtom.reportRead();
    return super.isEnable;
  }

  @override
  set isEnable(bool value) {
    _$isEnableAtom.reportWrite(value, super.isEnable, () {
      super.isEnable = value;
    });
  }

  late final _$createRoomAsyncAction =
      AsyncAction('_LixiCreateStore.createRoom', context: context);

  @override
  Future<void> createRoom(BuildContext context) {
    return _$createRoomAsyncAction.run(() => super.createRoom(context));
  }

  late final _$_LixiCreateStoreActionController =
      ActionController(name: '_LixiCreateStore', context: context);

  @override
  void setIndexTabBar({required int value}) {
    final _$actionInfo = _$_LixiCreateStoreActionController.startAction(
        name: '_LixiCreateStore.setIndexTabBar');
    try {
      return super.setIndexTabBar(value: value);
    } finally {
      _$_LixiCreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isValid(BuildContext context) {
    final _$actionInfo = _$_LixiCreateStoreActionController.startAction(
        name: '_LixiCreateStore.isValid');
    try {
      return super.isValid(context);
    } finally {
      _$_LixiCreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isEnable: ${isEnable}
    ''';
  }
}
