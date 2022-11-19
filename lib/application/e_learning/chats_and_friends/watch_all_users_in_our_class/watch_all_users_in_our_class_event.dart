part of 'watch_all_users_in_our_class_bloc.dart';

// @immutable
// abstract class WatchAllUsersInOurClassEvent {}

@freezed
abstract class WatchAllUsersInOurClassEvent
    with _$WatchAllUsersInOurClassEvent {
  const factory WatchAllUsersInOurClassEvent.watchAllUsersInOurClassEvent(
    String course,
    String? branch,
    String year,
  ) = _Started;
}
