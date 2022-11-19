part of 'comments_watcher_bloc.dart';

@freezed
abstract class CommentsWatcherEvent with _$CommentsWatcherEvent {
  const factory CommentsWatcherEvent.watchComments(String questionId) =
      _watchComments;
}
