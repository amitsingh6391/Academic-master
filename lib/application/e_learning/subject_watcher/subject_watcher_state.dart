part of 'subject_watcher_bloc.dart';

@freezed
class SubjectWatcherState with _$SubjectWatcherState {
  const factory SubjectWatcherState.initial() = _Initial;
  const factory SubjectWatcherState.loadInProgress() = _LoadInProgress;

  const factory SubjectWatcherState.loadSuccess(KtList<Subject> subjects) =
      _LoadSuccess;

  const factory SubjectWatcherState.loadFailure(
    FirebaseFailure firbaseFailure,
  ) = _LoadFailure;
}
