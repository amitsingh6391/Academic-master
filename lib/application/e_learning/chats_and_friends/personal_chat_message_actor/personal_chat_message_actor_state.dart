part of 'personal_chat_message_actor_bloc.dart';

@freezed
class PersonalChatMessageActorState with _$PersonalChatMessageActorState {
  const factory PersonalChatMessageActorState.initial() = _Initial;
  const factory PersonalChatMessageActorState.actionInProgress() =
      _ActionInProgress;
  const factory PersonalChatMessageActorState.deleteFailure(
    FirebaseFailure firebaseFailure,
  ) = _DeleteFailure;
  const factory PersonalChatMessageActorState.deleteSuccess() = _DeleteSuccess;
}
