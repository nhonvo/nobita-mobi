import 'package:json_annotation/json_annotation.dart';

part 'user_local.g.dart';

@JsonSerializable()
class UserLocal {
  String? userName;
  String? password;

  UserLocal({this.userName, this.password});

  factory UserLocal.fromJson(Map<String, dynamic> json) =>
      _$UserLocalFromJson(json);
  Map<String, dynamic> toJson() => _$UserLocalToJson(this);
}
