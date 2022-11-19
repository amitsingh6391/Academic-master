import 'package:academic_master/domain/core/errors.dart';
import 'package:academic_master/domain/core/failures.dart';
import 'package:academic_master/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/foundation.dart";
import 'package:uuid/uuid.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

// id = identity - same as writing (right)=>right;
  T getorCrash() {
    return value.fold((l) => throw UnexpectedValueError(l), id);
  }

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UniqueId() {
    return UniqueId._(right(const Uuid().v1()));
  }

  factory UniqueId.fromUniqueString(String uniqueId) {
    return UniqueId._(right(uniqueId));
  }

  const UniqueId._(this.value);
}

class Name extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Name(String input) {
    return Name._(
      validateStringNotEmpty(input),
    );
  }

  const Name._(this.value);
}

class College extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory College(String input) {
    return College._(
      validateStringNotEmpty(input),
    );
  }

  const College._(this.value);
}

class Branch extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory Branch(String input) {
    return Branch._(
      validateStringNotEmpty(input),
    );
  }

  const Branch._(this.value);
}

class Course extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory Course(String input) {
    return Course._(
      validateStringNotEmpty(input),
    );
  }

  const Course._(this.value);
}

class Year extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory Year(String input) {
    return Year._(
      validateStringNotEmpty(input),
    );
  }

  const Year._(this.value);
}

class PhoneNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory PhoneNumber(String input) {
    return PhoneNumber._(
      validatePhoneNumber(input),
    );
  }

  const PhoneNumber._(this.value);
}

class MediaUrl extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MediaUrl(String input) {
    return MediaUrl._(
      validateStringNotEmpty(input),
    );
  }

  const MediaUrl._(this.value);
}

class Time extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Time(String input) {
    debugPrint("i m inout time for question $input");
    return Time._(
      validateStringNotEmpty(input),
    );
  }

  const Time._(this.value);
}
