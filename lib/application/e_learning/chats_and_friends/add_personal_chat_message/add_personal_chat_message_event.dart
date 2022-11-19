part of 'add_personal_chat_message_bloc.dart';

@freezed
class AddPersonalChatMessageEvent with _$AddPersonalChatMessageEvent {
  const factory AddPersonalChatMessageEvent.messageDescriptionChanged(
    String description,
  ) = _MessageDescriptionChanged;

  const factory AddPersonalChatMessageEvent.addMessagePressed(
    Message message,
    String partnerId,
  ) = _AddMessagepressed;
}
