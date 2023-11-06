// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientDetailsModelImpl _$$ClientDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientDetailsModelImpl(
      address: json['address'] as String?,
      clientId: json['clientId'] as int?,
      phoneNumber: json['phoneNumber'] as String?,
      recommended: json['recommended'] as String?,
      tariff: json['tariff'] as String?,
    );

Map<String, dynamic> _$$ClientDetailsModelImplToJson(
        _$ClientDetailsModelImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'clientId': instance.clientId,
      'phoneNumber': instance.phoneNumber,
      'recommended': instance.recommended,
      'tariff': instance.tariff,
    };
