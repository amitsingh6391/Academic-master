part of 'add_user_comment_bloc.dart';

@freezed
class AddUserCommentEvent with _$AddUserCommentEvent {
  const factory AddUserCommentEvent.commentDescriptionChanged(
    String description,
  ) = _CommentDescriptionChanged;

  const factory AddUserCommentEvent.addCommentPressed(
    UserComment comment,
    String questionId,
  ) = _AddCommentpressed;
}
