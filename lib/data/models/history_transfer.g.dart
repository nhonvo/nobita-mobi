// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryTransfer _$HistoryTransferFromJson(Map<String, dynamic> json) =>
    HistoryTransfer(
      id: json['id'] as String?,
      description: json['description'] as String?,
      createdDate: json['createdDate'] as String?,
      senderName: json['senderName'] as String?,
      receiverId: json['receiverId'] as String?,
      receiverName: json['receiverName'] as String?,
      amount: json['amount'] as int?,
      senderId: json['senderId'] as String?,
    );

Map<String, dynamic> _$HistoryTransferToJson(HistoryTransfer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'createdDate': instance.createdDate,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'receiverId': instance.receiverId,
      'receiverName': instance.receiverName,
      'amount': instance.amount,
    };
