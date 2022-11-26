// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ScanStore on _ScanStore, Store {
  late final _$_isNextAtom = Atom(name: '_ScanStore._isNext', context: context);

  @override
  bool get _isNext {
    _$_isNextAtom.reportRead();
    return super._isNext;
  }

  @override
  set _isNext(bool value) {
    _$_isNextAtom.reportWrite(value, super._isNext, () {
      super._isNext = value;
    });
  }

  late final _$onQRViewCreatedAsyncAction =
      AsyncAction('_ScanStore.onQRViewCreated', context: context);

  @override
  Future<void> onQRViewCreated(
      QRViewController controller, BuildContext context) {
    return _$onQRViewCreatedAsyncAction
        .run(() => super.onQRViewCreated(controller, context));
  }

  late final _$_getInfoByIdAsyncAction =
      AsyncAction('_ScanStore._getInfoById', context: context);

  @override
  Future<void> _getInfoById(BuildContext context,
      {required String accountNumber}) {
    return _$_getInfoByIdAsyncAction
        .run(() => super._getInfoById(context, accountNumber: accountNumber));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
