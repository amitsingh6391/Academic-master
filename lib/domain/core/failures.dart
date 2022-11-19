import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail(
    T failedValue,
  ) = InvalidEmail<T>;
  const factory ValueFailure.shortPassword(
    T failedValue,
  ) = ShortPassword<T>;

  const factory ValueFailure.exceedingLength(
    T failedValue,
    int max,
  ) = ExceedingLength<T>;

  const factory ValueFailure.listTooLong({
    required T failedValue,
    required int max,
  }) = ListTooLong<T>;

  const factory ValueFailure.empty(
    T failedValue,
  ) = Empty<T>;

  const factory ValueFailure.invalidBtechBranch(
    T failedValue,
  ) = InvalidBtechBranch<T>;

  const factory ValueFailure.invalidCourse(
    T failedValue,
  ) = InvalidCourse<T>;
  const factory ValueFailure.invalidCollege(
    T failedValue,
  ) = InvalidCollege<T>;

  const factory ValueFailure.invalidYear(
    T failedValue,
  ) = InvalidYear<T>;

  const factory ValueFailure.invaliDpharmaYear(
    T failedValue,
  ) = InvalidDpharmaYear<T>;

  const factory ValueFailure.invalidPhoneNumber(
    T failedValue,
  ) = InvalidPhoneNumber<T>;
}
