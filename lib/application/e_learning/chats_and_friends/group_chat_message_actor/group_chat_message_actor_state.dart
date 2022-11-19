part of 'group_chat_message_actor_bloc.dart';

@freezed
class GroupChatMessageActorState with _$GroupChatMessageActorState {
  const factory GroupChatMessageActorState.initial() = _Initial;
  const factory GroupChatMessageActorState.actionInProgress() =
      _ActionInProgress;
  const factory GroupChatMessageActorState.deleteFailure(
    FirebaseFailure firebaseFailure,
  ) = _DeleteFailure;
  const factory GroupChatMessageActorState.deleteSuccess() = _DeleteSuccess;
}
