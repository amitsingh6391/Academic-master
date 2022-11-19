part of 'users_watcher_bloc.dart';

@freezed
abstract class UsersWatcherState with _$UsersWatcherState {
  const factory UsersWatcherState.initial() = _Initial;
  const factory UsersWatcherState.loadInProgress() = _LoadInProgress;
  const factory UsersWatcherState.loadSuccess(List<User> users) = _LoadSuccess;
  const factory UsersWatcherState.loadFailure(FirebaseFailure firebaseFailure) =
      _LoadFailure;
  const factory UsersWatcherState.empty() = _Empty;
}
