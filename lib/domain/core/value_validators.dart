import 'package:academic_master/domain/core/failures.dart';

import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';

Either<ValueFailure<String>, String> validateMaxStringLength(
  String input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
      ValueFailure.exceedingLength(
        input,
        maxLength,
      ),
    );
  }
}

Either<ValueFailure<KtList<T>>, KtList<T>> validateMaxListLength<T>(
  KtList<T> input,
  int maxLength,
) {
  if (input.size <= maxLength) {
    return right(input);
  } else {
    return left(
      ValueFailure.listTooLong(
        failedValue: input,
        max: maxLength,
      ),
    );
  }
}

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValueFailure.empty(input));
  }
}

Either<ValueFailure<String>, String> validatePhoneNumber(String input) {
  //this is standard phone number validation regex for India
  const phoneRegex = r"^[6-9]\d{9}$";
  if (RegExp(phoneRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidPhoneNumber(input));
  }
}

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(input));
  }
}

Either<ValueFailure<String>, String> validateVideoUrl(String input) {
  const videoRegex =
      r"""^((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)(\S+)?$""";

  if (RegExp(videoRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(input));
  }
}

Either<ValueFailure<String>, String> validateColorCode(String input) {
  if (input.length == 10) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.length > 6) {
    return right(input);
  } else {
    return left(ValueFailure.shortPassword(input));
  }
}

Either<ValueFailure<String>, String> validateCollege(String input) {
  if (input.length > 2) {
    return right(input);
  } else {
    return left(ValueFailure.invalidCollege(input));
  }
}

Either<ValueFailure<String>, String> validateCourse(String input) {
  if (["btech", "dpharma", "bpharma"].contains(input)) {
    return right(input);
  } else {
    return left(ValueFailure.empty(input));
  }
}

Either<ValueFailure<String>, String> validateBranch(String input) {
  if (["cse", "civil", "cse", "ece", "electrical", "it", "mechanical"]
      .contains(input)) {
    return right(input);
  } else {
    return left(ValueFailure.empty(input));
  }
}

Either<ValueFailure<String>, String> validateDpharmaYear(String input) {
  if (input == "1" || input == "2") {
    return right(input);
  } else {
    return left(ValueFailure.invaliDpharmaYear(input));
  }
}

Either<ValueFailure<String>, String> validateYear(String input) {
  if (["1", "2", "3", "4"].contains(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidYear(input));
  }
}
