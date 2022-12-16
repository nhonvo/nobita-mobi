// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lixi_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LixiStore on _LixiStore, Store {
  late final _$isEnableAtom =
      Atom(name: '_LixiStore.isEnable', context: context);

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

  late final _$joinRoomAsyncAction =
      AsyncAction('_LixiStore.joinRoom', context: context);

  @override
  Future<void> joinRoom(BuildContext context) {
    return _$joinRoomAsyncAction.run(() => super.joinRoom(context));
  }

  @override
  String toString() {
    return '''
isEnable: ${isEnable}
    ''';
  }
}
