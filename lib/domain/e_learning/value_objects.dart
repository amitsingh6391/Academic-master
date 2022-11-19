import 'package:academic_master/domain/core/failures.dart';
import 'package:academic_master/domain/core/value_objects.dart';
import 'package:academic_master/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';

class SubjectName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  static const maxLength = 30;
  factory SubjectName(String input) {
    return SubjectName._(
      validateMaxStringLength(input, maxLength),
    );
  }

  const SubjectName._(this.value);
}

class SubjectNote extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  static const maxLength = 500;
  factory SubjectNote(String input) {
    return SubjectNote._(
      validateMaxStringLength(input, maxLength),
    );
  }

  const SubjectNote._(this.value);
}

class SubjectPaper extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory SubjectPaper(String input) {
    return SubjectPaper._(
      validateStringNotEmpty(input),
    );
  }

  const SubjectPaper._(this.value);
}

class SubjectSyllaybus extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory SubjectSyllaybus(String input) {
    return SubjectSyllaybus._(
      validateStringNotEmpty(input),
    );
  }

  const SubjectSyllaybus._(this.value);
}

class SubjectIcon extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  static const maxLength = 50;
  factory SubjectIcon(String input) {
    return SubjectIcon._(
      validateStringNotEmpty(input),
    );
  }

  const SubjectIcon._(this.value);
}

class SubjectColor extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  static const maxLength = 6;
  factory SubjectColor(String input) {
    return SubjectColor._(
      validateColorCode(input),
    );
  }

  const SubjectColor._(this.value);
}

class List3<T> extends ValueObject<KtList<T>> {
  @override
  final Either<ValueFailure<KtList<T>>, KtList<T>> value;

  static const maxLength = 50;

  factory List3(KtList<T> input) {
    return List3._(
      validateMaxListLength(input, maxLength),
    );
  }

  const List3._(this.value);

  int get length {
    return value.getOrElse(() => emptyList()).size;
  }

  bool get isFull {
    return length == maxLength;
  }
}

// class SubjectVideoTutorial extends ValueObject<List> {
//   @override
//   final Either<ValueFailure<String>, List<dynamic>> value;

//   factory SubjectVideoTutorial(List<dynamic> input) {
//     return SubjectVideoTutorial._(
//      // validateVideoUrl(input),
//     );
//   }

//   const SubjectVideoTutorial._(this.value);
// }

class TopicName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  static const maxLength = 50;
  factory TopicName(String input) {
    return TopicName._(
      validateMaxStringLength(input, maxLength),
    );
  }

  const TopicName._(this.value);
}

class QuestionDescription extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  static const maxLength = 3000;
  factory QuestionDescription(String input) {
    return QuestionDescription._(
      validateMaxStringLength(input, maxLength),
    );
  }

  const QuestionDescription._(this.value);
}

class CommentDescription extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  static const maxLength = 3000;
  factory CommentDescription(String input) {
    return CommentDescription._(
      validateMaxStringLength(input, maxLength),
    );
  }

  const CommentDescription._(this.value);
}
