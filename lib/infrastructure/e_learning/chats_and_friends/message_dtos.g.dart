// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageDto _$$_MessageDtoFromJson(Map<String, dynamic> json) =>
    _$_MessageDto(
      messageId: json['messageId'] as String,
      userId: json['userId'] as String,
      messageDescription: json['messageDescription'] as String,
      messageAt: DateTime.parse(json['messageAt'] as String),
    );

Map<String, dynamic> _$$_MessageDtoToJson(_$_MessageDto instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'userId': instance.userId,
      'messageDescription': instance.messageDescription,
      'messageAt': instance.messageAt.toIso8601String(),
    };
