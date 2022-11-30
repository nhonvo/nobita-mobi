import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String? id;
  final String? userName;
  final String? email;
  String? password;
  final String? fullName;
  final String? accountNo;
  String? balance;
  String? token;
  String? phoneNumber;
  User(
      {this.fullName,
      this.id,
      this.userName,
      this.email,
      this.password,
      this.accountNo,
      this.balance,
      this.token});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
