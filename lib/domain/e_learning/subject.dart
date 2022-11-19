import 'package:academic_master/domain/core/failures.dart';
import 'package:academic_master/domain/e_learning/subject_material.dart';
import 'package:academic_master/domain/e_learning/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:kt_dart/collection.dart';
part 'subject.freezed.dart';

@freezed
abstract class Subject implements _$Subject {
  const factory Subject({
    required String id,
    required SubjectIcon subjectIcon,
    required List3<StudyMaterial> studyMaterial,
    // required List subjectVideoTutorial,
  }) = _Subject;

  factory Subject.empty() => Subject(
        id: "",
        subjectIcon: SubjectIcon(""),
        studyMaterial: List3(emptyList()),
      );

  const Subject._();

  Option<ValueFailure<dynamic>> get failureOption {
    return subjectIcon.failureOrUnit.fold((f) => some(f), (r) => none());
  }

  Option<ValueFailure<dynamic>> get failureOptions {
    return subjectIcon.failureOrUnit
        .andThen(studyMaterial.failureOrUnit)
        .andThen(
          studyMaterial
              .getorCrash()
              // Getting the failureOption from the subject_Material ENTITY - NOT a failureOrUnit from a VALUE OBJECT
              .map((studyMaterial) => studyMaterial.failureOption)
              .filter((o) => o.isSome())
              // If we can't get the 0th element, the list is empty. In such a case, it's valid.
              .getOrElse(0, (_) => none())
              .fold(() => right(unit), (f) => left(f)),
        )
        .fold((f) => some(f), (_) => none());
  }
}
