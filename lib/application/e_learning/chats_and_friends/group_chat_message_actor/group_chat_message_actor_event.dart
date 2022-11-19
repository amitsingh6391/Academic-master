part of 'group_chat_message_actor_bloc.dart';

@freezed
class GroupChatMessageActorEvent with _$GroupChatMessageActorEvent {
  const factory GroupChatMessageActorEvent.deleted(
    Message groupChatMessage,
  ) = _Deleted;
}
