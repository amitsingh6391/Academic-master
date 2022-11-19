part of 'personal_chat_message_watcher_bloc.dart';

@freezed
abstract class PersonalChatMessageWatcherState
    with _$PersonalChatMessageWatcherState {
  const factory PersonalChatMessageWatcherState.initial() = _Initial;
  const factory PersonalChatMessageWatcherState.loadInProgress() =
      _LoadInProgress;

  const factory PersonalChatMessageWatcherState.loadSuccess(
    KtList<Message> message,
  ) = _LoadSuccess;

  const factory PersonalChatMessageWatcherState.loadFailure(
    FirebaseFailure firebaseFailure,
  ) = _LoadFailure;

  const factory PersonalChatMessageWatcherState.empty() = _Empty;
}
