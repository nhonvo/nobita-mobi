import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  final bool? succeeded;
  final String? message;
  final dynamic resultObject;
  final String? validationErrors;
  Result(
      {this.succeeded, this.message, this.resultObject, this.validationErrors});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
