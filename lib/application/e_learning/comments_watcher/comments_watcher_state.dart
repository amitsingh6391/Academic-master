part of 'comments_watcher_bloc.dart';

@freezed
class CommentsWatcherState with _$CommentsWatcherState {
  const factory CommentsWatcherState.initial() = _Initial;
  const factory CommentsWatcherState.loadInProgress() = _LoadInProgress;

  const factory CommentsWatcherState.loadSuccess(KtList<UserComment> comments) =
      _LoadSuccess;

  const factory CommentsWatcherState.loadFailure(
    FirebaseFailure firebaseFailure,
  ) = _LoadFailure;

  const factory CommentsWatcherState.empty() = _Empty;
}
