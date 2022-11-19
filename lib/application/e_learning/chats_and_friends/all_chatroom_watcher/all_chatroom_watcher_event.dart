part of 'all_chatroom_watcher_bloc.dart';

@freezed
abstract class AllChatroomWatcherEvent with _$AllChatroomWatcherEvent {
  const factory AllChatroomWatcherEvent.watchAllChatrooms() =
      _WatchAllChatrooms;
}
