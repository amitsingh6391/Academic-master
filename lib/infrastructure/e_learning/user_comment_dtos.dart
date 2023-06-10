import 'package:academic_master/domain/core/value_objects.dart';
import 'package:academic_master/domain/e_learning/user_comment.dart';
import 'package:academic_master/domain/e_learning/value_objects.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_comment_dtos.freezed.dart';
part 'user_comment_dtos.g.dart';

@freezed
abstract class UserCommentDto implements _$UserCommentDto {
  const factory UserCommentDto({
    required String commentId,
    required String userId,
    required String commentDescription,
    required DateTime commentAt,
  }) = _UserCommentDto;
  const UserCommentDto._();

  factory UserCommentDto.fromDomain(UserComment comment) {
    return UserCommentDto(
      commentId: comment.commentId.getorCrash(),
      userId: comment.userId.getorCrash(),
      commentDescription: comment.commentDescription.getorCrash(),
      commentAt: DateTime.now(),
    );
  }

  UserComment toDomain() {
    return UserComment(
      commentDescription: CommentDescription(commentDescription),
      userId: UniqueId.fromUniqueString(userId),
      commentId: UniqueId.fromUniqueString(commentId),
      commentAt: Time(commentAt.toString()),
    );
  }

  factory UserCommentDto.fromJson(Map<String, dynamic> json) =>
      _$UserCommentDtoFromJson(json);

  factory UserCommentDto.fromFirestore(DocumentSnapshot doc) {
    return UserCommentDto.fromJson(doc.data()! as Map<String, dynamic>)
        .copyWith(
      commentId: doc.id,
    );
  }
}
