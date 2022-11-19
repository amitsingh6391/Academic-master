part of 'watch_all_users_in_our_class_bloc.dart';

// @immutable
// abstract class WatchAllUsersInOurClassState {}

// class WatchAllUsersInOurClassInitial extends WatchAllUsersInOurClassState {}

@freezed
abstract class WatchAllUsersInOurClassState
    with _$WatchAllUsersInOurClassState {
  const factory WatchAllUsersInOurClassState.initial() = _Initial;
  const factory WatchAllUsersInOurClassState.loadInProgress() = _LoadInProgress;
  const factory WatchAllUsersInOurClassState.loadSuccess(List<User> users) =
      _LoadSuccess;
  const factory WatchAllUsersInOurClassState.loadFailure(
    FirebaseFailure firebaseFailure,
  ) = _LoadFailure;
  const factory WatchAllUsersInOurClassState.empty() = _Empty;
}
