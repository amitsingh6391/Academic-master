part of 'group_chat_message_watcher_bloc.dart';

@freezed
abstract class GroupChatMessageWatcherState
    with _$GroupChatMessageWatcherState {
  const factory GroupChatMessageWatcherState.initial() = _Initial;
  const factory GroupChatMessageWatcherState.loadInProgress() = _LoadInProgress;

  const factory GroupChatMessageWatcherState.loadSuccess(
    KtList<Message> message,
  ) = _LoadSuccess;

  const factory GroupChatMessageWatcherState.loadFailure(
    FirebaseFailure firebaseFailure,
  ) = _LoadFailure;

  const factory GroupChatMessageWatcherState.empty() = _Empty;
}
