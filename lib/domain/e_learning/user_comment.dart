import 'package:academic_master/domain/core/failures.dart';
import 'package:academic_master/domain/core/value_objects.dart';
import 'package:academic_master/domain/e_learning/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_comment.freezed.dart';

@freezed
abstract class UserComment implements _$UserComment {
  const UserComment._();

  // ignore: sort_unnamed_constructors_first
  const factory UserComment({
    required UniqueId commentId,
    required UniqueId userId,
    required CommentDescription commentDescription,
    required Time commentAt,
  }) = _UserComment;

  factory UserComment.empty() => UserComment(
        commentDescription: CommentDescription(" "),
        commentId: UniqueId(),
        userId: UniqueId(),
        commentAt: Time(""),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return commentDescription.failureOrUnit.fold(
      (f) => some(f),
      (r) => none(),
    );
  }
}
