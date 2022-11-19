part of 'add_personal_chat_message_bloc.dart';

@freezed
class AddPersonalChatMessageState with _$AddPersonalChatMessageState {
  const factory AddPersonalChatMessageState({
    required Message message,
    required Chatroom chatroom,
    required bool showErrorMessages,
    required bool isSaving,
    required bool isEditing,
    required String partnerId,
    // required String questionId,
    required Option<Either<FirebaseFailure, Unit>> saveFailureOrSuccessOption,
  }) = _AddPersonalChatMessageState;

  factory AddPersonalChatMessageState.initial() => AddPersonalChatMessageState(
        message: Message.empty(),
        chatroom: Chatroom.empty(),
        showErrorMessages: false,
        isSaving: false,
        isEditing: false,
        partnerId: "123456",
        saveFailureOrSuccessOption: none(),
      );
}
