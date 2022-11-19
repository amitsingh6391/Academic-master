part of 'add_user_comment_bloc.dart';

@freezed
class AddUserCommentState with _$AddUserCommentState {
  const factory AddUserCommentState({
    required UserComment comment,
    required bool showErrorMessages,
    required bool isSaving,
    required bool isEditing,
    // required String questionId,
    required Option<Either<FirebaseFailure, Unit>> saveFailureOrSuccessOption,
  }) = _AddUserCommentState;

  factory AddUserCommentState.initial() => AddUserCommentState(
        comment: UserComment.empty(),
        showErrorMessages: false,
        isSaving: false,
        isEditing: false,
        // questionId: "",
        saveFailureOrSuccessOption: none(),
      );
}
