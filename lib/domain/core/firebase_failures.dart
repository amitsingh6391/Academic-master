import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_failures.freezed.dart';

@freezed
abstract class FirebaseFailure with _$FirebaseFailure {
  const factory FirebaseFailure.unexpected() = _Unexpected;
  const factory FirebaseFailure.insufficientPermission() =
      _InsufficientPermission;
  const factory FirebaseFailure.unableToUpdate() = _UnableToUpdate;
}
