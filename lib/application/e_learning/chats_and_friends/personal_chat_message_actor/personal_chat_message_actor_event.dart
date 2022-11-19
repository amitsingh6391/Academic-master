part of 'personal_chat_message_actor_bloc.dart';

@freezed
class PersonalChatMessageActorEvent with _$PersonalChatMessageActorEvent {
  const factory PersonalChatMessageActorEvent.deleted(
    Message personalChatMessage,
    String partnerId,
  ) = _Deleted;
}
