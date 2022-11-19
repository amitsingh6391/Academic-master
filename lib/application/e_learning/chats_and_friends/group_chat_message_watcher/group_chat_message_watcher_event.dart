part of 'group_chat_message_watcher_bloc.dart';

@freezed
abstract class GroupChatMessageWatcherEvent
    with _$GroupChatMessageWatcherEvent {
  const factory GroupChatMessageWatcherEvent.watchGroupChatMessages() =
      _WatchGroupChatMessages;
}
