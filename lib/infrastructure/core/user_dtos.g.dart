// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDto _$$_UserDtoFromJson(Map<String, dynamic> json) => _$_UserDto(
      id: json['id'] as String?,
      name: json['name'] as String,
      email: json['email'] as String,
      contactNumber: json['contactNumber'] as String,
      college: json['college'] as String,
      course: json['course'] as String,
      branch: json['branch'] as String,
      year: json['year'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_UserDtoToJson(_$_UserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'contactNumber': instance.contactNumber,
      'college': instance.college,
      'course': instance.course,
      'branch': instance.branch,
      'year': instance.year,
      'createdAt': instance.createdAt.toIso8601String(),
    };
