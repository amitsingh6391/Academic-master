part of 'all_chatroom_watcher_bloc.dart';

@freezed
abstract class AllChatroomWatcherState with _$AllChatroomWatcherState {
  const factory AllChatroomWatcherState.initial() = _Initial;
  const factory AllChatroomWatcherState.loadInProgress() = _LoadInProgress;

  const factory AllChatroomWatcherState.loadSuccess(
    KtList<Chatroom> chatrooms,
  ) = _LoadSuccess;

  const factory AllChatroomWatcherState.loadFailure(
    FirebaseFailure firebaseFailure,
  ) = _LoadFailure;

  const factory AllChatroomWatcherState.empty() = _Empty;
}
