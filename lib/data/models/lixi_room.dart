import 'package:json_annotation/json_annotation.dart';

part 'lixi_room.g.dart';

@JsonSerializable()
class LixiRoom {
  final String? ownerId;
  final int? amount;
  final List<dynamic>? participantList;
  final String? expireDate;
  LixiRoom({this.ownerId, this.amount, this.participantList, this.expireDate});

  factory LixiRoom.fromJson(Map<String, dynamic> json) =>
      _$LixiRoomFromJson(json);
  Map<String, dynamic> toJson() => _$LixiRoomToJson(this);
}
