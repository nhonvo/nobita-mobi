import 'package:json_annotation/json_annotation.dart';

part 'history_transfer.g.dart';

@JsonSerializable()
class HistoryTransfer {
  final String? id;
  final String? description;
  final String? createdDate;
  final String? senderId;
  final String? senderName;
  final String? receiverId;
  final String? receiverName;
  final int? amount;
  HistoryTransfer(
      {this.id,
      this.description,
      this.createdDate,
      this.senderName,
      this.receiverId,
      this.receiverName,
      this.amount,
      this.senderId});

  factory HistoryTransfer.fromJson(Map<String, dynamic> json) =>
      _$HistoryTransferFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryTransferToJson(this);
}
