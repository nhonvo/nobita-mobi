// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lixi_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LixiRoom _$LixiRoomFromJson(Map<String, dynamic> json) => LixiRoom(
      ownerId: json['ownerId'] as String?,
      amount: json['amount'] as int?,
      participantList: json['participantList'] as List<dynamic>?,
      expireDate: json['expireDate'] as String?,
    );

Map<String, dynamic> _$LixiRoomToJson(LixiRoom instance) => <String, dynamic>{
      'ownerId': instance.ownerId,
      'amount': instance.amount,
      'participantList': instance.participantList,
      'expireDate': instance.expireDate,
    };
