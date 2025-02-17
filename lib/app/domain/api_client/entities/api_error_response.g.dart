// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiErrorResponseImpl _$$ApiErrorResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ApiErrorResponseImpl(
  name: json['name'] as String?,
  status: (json['status'] as num?)?.toInt(),
  code: (json['code'] as num?)?.toInt(),
  message: json['message'] as String?,
);

Map<String, dynamic> _$$ApiErrorResponseImplToJson(
  _$ApiErrorResponseImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'status': instance.status,
  'code': instance.code,
  'message': instance.message,
};
