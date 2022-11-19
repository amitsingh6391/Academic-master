import 'package:academic_master/domain/core/failures.dart';

class NotAuthenticatedError extends Error {}

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;
  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explaintion =
        "Encountered a ValiueFailure at an unrecoverable point ,Terminating";
    return Error.safeToString("$explaintion Failure was: $valueFailure");
  }
}
