// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubjectDto _$$_SubjectDtoFromJson(Map<String, dynamic> json) =>
    _$_SubjectDto(
      id: json['id'] as String? ?? "studyMaterial",
      subjectIcon: json['subjectIcon'] as String,
      studyMaterial: (json['studyMaterial'] as List<dynamic>)
          .map((e) => SubjectMaterialDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SubjectDtoToJson(_$_SubjectDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subjectIcon': instance.subjectIcon,
      'studyMaterial': instance.studyMaterial,
    };

_$_SubjectMaterialDto _$$_SubjectMaterialDtoFromJson(
        Map<String, dynamic> json) =>
    _$_SubjectMaterialDto(
      id: json['id'] as String,
      subjectName: json['subjectName'] as String,
      subjectNote: json['subjectNote'] as String,
      subjectSyllabus: json['subjectSyllabus'] as String,
      subjectIcon: json['subjectIcon'] as String,
      subjectPaper: json['subjectPaper'] as String,
      subjectColor: json['subjectColor'] as String,
    );

Map<String, dynamic> _$$_SubjectMaterialDtoToJson(
        _$_SubjectMaterialDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subjectName': instance.subjectName,
      'subjectNote': instance.subjectNote,
      'subjectSyllabus': instance.subjectSyllabus,
      'subjectIcon': instance.subjectIcon,
      'subjectPaper': instance.subjectPaper,
      'subjectColor': instance.subjectColor,
    };
