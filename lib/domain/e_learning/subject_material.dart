import 'package:academic_master/domain/core/failures.dart';
import 'package:academic_master/domain/core/value_objects.dart';
import 'package:academic_master/domain/e_learning/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject_material.freezed.dart';

@freezed
abstract class StudyMaterial implements _$StudyMaterial {
  const StudyMaterial._();

  // ignore: sort_unnamed_constructors_first
  const factory StudyMaterial({
    required UniqueId id,
    required SubjectName subjectName,
    required SubjectIcon subjectIcon,
    required SubjectNote subjectNote,
    required SubjectPaper subjectPaper,
    required SubjectSyllaybus subjectSyllaybus,
    required SubjectColor subjectColor,
  }) = _StudyMaterial;

  factory StudyMaterial.empty() => StudyMaterial(
        id: UniqueId(),
        subjectName: SubjectName(""),
        subjectIcon: SubjectIcon(""),
        subjectNote: SubjectNote(""),
        subjectSyllaybus: SubjectSyllaybus(""),
        subjectPaper: SubjectPaper(""),
        subjectColor: SubjectColor(""),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return subjectName.failureOrUnit
        .andThen(subjectIcon.failureOrUnit)
        .andThen(subjectNote.failureOrUnit)
        .andThen(subjectSyllaybus.failureOrUnit)
        .andThen(subjectColor.failureOrUnit)
        .andThen(subjectPaper.failureOrUnit)
        .fold((f) => some(f), (r) => none());
  }
}
