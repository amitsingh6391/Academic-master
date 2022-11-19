part of 'add_group_chat_message_bloc.dart';

@freezed
class AddGroupChatMessageState with _$AddGroupChatMessageState {
  const factory AddGroupChatMessageState({
    required Message message,
    required bool showErrorMessages,
    required bool isSaving,
    required bool isEditing,
    // required String questionId,
    required Option<Either<FirebaseFailure, Unit>> saveFailureOrSuccessOption,
  }) = _AddGroupChatMessageState;

  factory AddGroupChatMessageState.initial() => AddGroupChatMessageState(
        message: Message.empty(),
        showErrorMessages: false,
        isSaving: false,
        isEditing: false,
        saveFailureOrSuccessOption: none(),
      );
}
