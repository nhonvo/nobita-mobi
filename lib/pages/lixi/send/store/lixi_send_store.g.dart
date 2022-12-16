// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lixi_send_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LixiSendStore on _LixiSendStore, Store {
  late final _$lixiRoomAtom =
      Atom(name: '_LixiSendStore.lixiRoom', context: context);

  @override
  LixiRoom get lixiRoom {
    _$lixiRoomAtom.reportRead();
    return super.lixiRoom;
  }

  @override
  set lixiRoom(LixiRoom value) {
    _$lixiRoomAtom.reportWrite(value, super.lixiRoom, () {
      super.lixiRoom = value;
    });
  }

  late final _$getRoomAsyncAction =
      AsyncAction('_LixiSendStore.getRoom', context: context);

  @override
  Future<void> getRoom(BuildContext context) {
    return _$getRoomAsyncAction.run(() => super.getRoom(context));
  }

  @override
  String toString() {
    return '''
lixiRoom: ${lixiRoom}
    ''';
  }
}
