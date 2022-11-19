import 'package:academic_master/domain/core/value_objects.dart';
import 'package:academic_master/domain/e_learning/subject.dart';
import 'package:academic_master/domain/e_learning/subject_material.dart';
import 'package:academic_master/domain/e_learning/value_objects.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

part 'subject_dtos.freezed.dart';
part 'subject_dtos.g.dart';

@freezed
abstract class SubjectDto implements _$SubjectDto {
  const factory SubjectDto({
    // ignore: invalid_annotation_target
    @JsonKey(ignore: true) @Default("studyMaterial") String id,
    required String subjectIcon,
    required List<SubjectMaterialDto> studyMaterial,
  }) = _SubjectDto;

  const SubjectDto._();

  factory SubjectDto.fromDomain(Subject subject) {
    return SubjectDto(
      id: "studyMaterial",
      subjectIcon: subject.subjectIcon.getorCrash(),
      studyMaterial: subject.studyMaterial
          .getorCrash()
          .map(
            (todoItem) => SubjectMaterialDto.fromDomain(todoItem),
          )
          .asList(),
    );
  }

  Subject toDomain() {
    return Subject(
      id: "studyMaterial",
      subjectIcon: SubjectIcon(subjectIcon),
      studyMaterial: List3(
        studyMaterial.map((dto) => dto.toDomain()).toImmutableList(),
      ),
    );
  }

  factory SubjectDto.fromJson(Map<String, dynamic> json) =>
      _$SubjectDtoFromJson(json);

  factory SubjectDto.fromFirestore(DocumentSnapshot doc) {
    return SubjectDto.fromJson(doc.data()! as Map<String, dynamic>).copyWith(
      id: doc.id,
    );
  }
}

@freezed
abstract class SubjectMaterialDto implements _$SubjectMaterialDto {
  const SubjectMaterialDto._();

  // ignore: sort_unnamed_constructors_first
  const factory SubjectMaterialDto({
    required String id,
    required String subjectName,
    required String subjectNote,
    required String subjectSyllabus,
    required String subjectIcon,
    required String subjectPaper,
    required String subjectColor,
  }) = _SubjectMaterialDto;

  factory SubjectMaterialDto.fromDomain(StudyMaterial studyMaterial) {
    return SubjectMaterialDto(
      id: studyMaterial.id.getorCrash(),
      subjectName: studyMaterial.subjectName.getorCrash(),
      subjectNote: studyMaterial.subjectNote.getorCrash(),
      subjectPaper: studyMaterial.subjectPaper.getorCrash(),
      subjectIcon: studyMaterial.subjectIcon.getorCrash(),
      subjectSyllabus: studyMaterial.subjectSyllaybus.getorCrash(),
      subjectColor: studyMaterial.subjectColor.getorCrash(),
    );
  }

  StudyMaterial toDomain() {
    return StudyMaterial(
      id: UniqueId.fromUniqueString(id),
      subjectName: SubjectName(subjectName),
      subjectNote: SubjectNote(subjectNote),
      subjectPaper: SubjectPaper(subjectPaper),
      subjectIcon: SubjectIcon(subjectIcon),
      subjectSyllaybus: SubjectSyllaybus(subjectSyllabus),
      subjectColor: SubjectColor(subjectColor),
    );
  }

  factory SubjectMaterialDto.fromJson(Map<String, dynamic> json) =>
      _$SubjectMaterialDtoFromJson(json);
}
