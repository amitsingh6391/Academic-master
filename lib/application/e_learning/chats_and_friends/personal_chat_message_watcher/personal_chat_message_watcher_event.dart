part of 'personal_chat_message_watcher_bloc.dart';

@freezed
abstract class PersonalChatMessageWatcherEvent
    with _$PersonalChatMessageWatcherEvent {
  const factory PersonalChatMessageWatcherEvent.watchPersonalChatMessages(
    String partnerId,
  ) = _WatchPersonalChatMessages;
}
