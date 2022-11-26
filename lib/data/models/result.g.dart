// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      succeeded: json['succeeded'] as bool?,
      message: json['message'] as String?,
      resultObject: json['resultObject'],
      validationErrors: json['validationErrors'],
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'succeeded': instance.succeeded,
      'message': instance.message,
      'resultObject': instance.resultObject,
      'validationErrors': instance.validationErrors,
    };
